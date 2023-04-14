package com.projectmanagement.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.projectmanagement.ProjectRepo;
import com.projectmanagement.TaskRepo;
import com.projectmanagement.UserRepo;
import com.projectmanagement.entities.Project;
import com.projectmanagement.entities.Task;
import com.projectmanagement.entities.User;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TaskController {

	@Autowired
	private ProjectRepo prep;
	
	@Autowired
	private UserRepo urep;
	
	@Autowired
	private TaskRepo trep;
	
	@GetMapping(path = "/showassignlist")
	public String showProjectList(Model model) {
		List<Project> pl = prep.findAll();
		model.addAttribute("projectlist",pl);
		return "projectemplist";
		
	}
	
	@PostMapping(path = "/showempassign")
	public String showAssignEmpList(HttpServletRequest request,Model model) {
		int pid = Integer.parseInt(request.getParameter("project")) ;
		List<User> ul = prep.empListforproject(pid);
		model.addAttribute("pul", ul);
		model.addAttribute("assignproject",pid);
		return showProjectList(model);
	}
	
	@PostMapping(path = "/showassigntask")
	public String showAssignTask(HttpServletRequest request,Model model) {
		int pid = Integer.parseInt(request.getParameter("prid")) ;
		int emp_id = Integer.parseInt(request.getParameter("empid"));
		Project p = prep.findById(pid).get();
		User u = urep.findById(emp_id).get();
		model.addAttribute("user",u);
		model.addAttribute("project",p);
		return "assigntask";
		
	}
	
	@PostMapping(path = "/savetask")
	public String saveTask(HttpServletRequest request,Model model) {
		int pid = Integer.parseInt(request.getParameter("project-id")) ;
		Project p = prep.findById(pid).get();
		int emp_id = Integer.parseInt(request.getParameter("employee-id"));
		User u = urep.findById(emp_id).get();
		String tnm = request.getParameter("task-name");
		String desc = request.getParameter("task-desc");
		Date sdt = Date.valueOf(request.getParameter("task-startdate"));
		Date edt = Date.valueOf(request.getParameter("task-duedate"));
		Task t = new Task(tnm, desc, sdt, edt, "pending", "nothing", p, u);
		model.addAttribute("assigntask","added succesfull");
		trep.save(t);
//		List<Task> tl = trep.taskOfProject(pid);
//		model.addAttribute("tasklist", tl);
		return showProjectList(model);
	}
	
}
