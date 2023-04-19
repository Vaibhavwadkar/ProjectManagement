package com.projectmanagement.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.projectmanagement.ProjectRepo;
import com.projectmanagement.SubTaskRepo;
import com.projectmanagement.TaskRepo;
import com.projectmanagement.UserRepo;
import com.projectmanagement.entities.Project;
import com.projectmanagement.entities.Subtask;
import com.projectmanagement.entities.Task;
import com.projectmanagement.entities.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class TaskController {

	@Autowired
	private ProjectRepo prep;
	
	@Autowired
	private UserRepo urep;
	
	@Autowired
	private TaskRepo trep;
	
	
	
	//-------------------Manager--------------------//
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
		List<Task> tl = trep.taskOfProject(pid);
		model.addAttribute("tasklist", tl);
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
		String tpri = request.getParameter("priority");
		Date sdt = Date.valueOf(request.getParameter("task-startdate"));
		Date edt = Date.valueOf(request.getParameter("task-duedate"));
		Task t = new Task(tnm, desc, sdt, edt,null, "pending","N/A",tpri, "nothing", p, u);
		model.addAttribute("assigntask","added succesfull");
		trep.save(t);
		return showProjectList(model);
	}
	
	@Transactional
	@PostMapping(path = "/removetask")
	public String removeTask(HttpServletRequest request,Model model) {
		int pid = Integer.parseInt(request.getParameter("proid"));
		int eid = Integer.parseInt(request.getParameter("empid"));
		trep.removeTask(pid, eid);
		return showProjectList(model);
	}
	
	//----------------Employee------------------
	@GetMapping(path="/assigntasklist")
	public String seeAssignTaskList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int eid = (Integer)(session.getAttribute("user"));
		List<Task> et = trep.taskOfEmp(eid);
		List<Task> ret = trep.taskOfEmpReview(eid);
		model.addAttribute("emptasklists", et);
		model.addAttribute("reviewemptask", ret);
		return "emptasklist";
	}
	
	@PostMapping(path = "/emptask")
	public String seeTaskDetails(HttpServletRequest request,Model model) {
		int tid =Integer.parseInt(request.getParameter("taskid"));
		Task empt = trep.findById(tid).get();
		model.addAttribute("emptask", empt);
		return "emptask";
	}
	
	@GetMapping(path="/updatetasklist")
	public String seeUpdateTaskList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int eid = (Integer)(session.getAttribute("user"));
		List<Task> uet = trep.taskOfEmp(eid);
		List<Task> uetr = trep.taskOfEmpReview(eid);
		model.addAttribute("upemptasklist", uet);
		model.addAttribute("upemptasklistreview", uetr);
		return "updatetasklist";
	}
	
	@PostMapping(path = "/addcomment")
	public String addComment(HttpServletRequest request, Model model) {
		int tid = Integer.parseInt(request.getParameter("taskId")) ;
		Task t = trep.findById(tid).get();
		model.addAttribute("taskcomment", t);
		return "addcomment";
	}
	@Transactional
	@PostMapping(path = "/savecomment")
	public String saveComment(HttpServletRequest request,Model model) {
		int tid = Integer.parseInt(request.getParameter("taskId")) ;
		String cmnt = request.getParameter("comment");
		Task t = trep.findById(tid).get();
		t.setTaskComment(cmnt);
		model.addAttribute("addedcmt", "Comment sent successfully.");
		return seeUpdateTaskList(request, model);
	}
	
	@PostMapping(path = "/updateemptask")
	public String updateEmpTask(HttpServletRequest request,Model model) {
		int tid = Integer.parseInt(request.getParameter("taskId")) ;
		Task t = trep.findById(tid).get();
		model.addAttribute("updtetsk", t);
		return "updateemptask";
		
	}
	@Transactional
	@PostMapping(path = "/saveemptask")
	public String saveEmpTask(HttpServletRequest request,Model model) {
		int tid = Integer.parseInt(request.getParameter("taskId")) ;
		String status = request.getParameter("status");
		Task t = trep.findById(tid).get();
		t.setTaskStatus(status);
		if(status.equalsIgnoreCase("ready-to-review")) {
			Long now = System.currentTimeMillis();
			Date tdt = new Date(now);
			t.setTaskCompletedDate(tdt);
		}
		model.addAttribute("addedstatus", "reoprted successfully.");
		return seeUpdateTaskList(request, model);
		
	}
	
	
	
}
