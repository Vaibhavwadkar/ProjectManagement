package com.projectmanagement.controller;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.projectmanagement.ProjectRepo;
import com.projectmanagement.UserRepo;
import com.projectmanagement.entities.Project;
import com.projectmanagement.entities.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectRepo prep;
	
	@Autowired
	private UserRepo urep;
	
	@GetMapping(path = "/addproject")
	public String addProject(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User mu = urep.findById((Integer) session.getAttribute("user")).get();
		session.setAttribute("mgrnm", (mu.getFirstName()+mu.getLastName()));
		return "addproject";
	}
	
	@PostMapping(path = "/saveproject")
	public String saveProject(HttpServletRequest request , Model model) {
		int mgr_id = Integer.parseInt(request.getParameter("manager_id"));
		User mu = urep.findById(mgr_id).get();
		String pnm = request.getParameter("project_name");
		String desc = request.getParameter("description");
		Date sdt = Date.valueOf(request.getParameter("start_date"));
		Date edt = Date.valueOf(request.getParameter("end_date"));
		String rmrk = request.getParameter("remarks");
		Project p = new Project(pnm,desc,sdt,edt,"pending",rmrk,mu,null);
		model.addAttribute("addproject","added succesfull");
		prep.save(p);
		return "addproject";
		
		
	}
	
	@GetMapping(path = "/showassign")
	public String showAssign(Model model) {
		List<User> ul = urep.freeEmpList();
		List<Project> pl = prep.findAll();
		model.addAttribute("emplist",ul);
		model.addAttribute("projectlist",pl);
		return "assignemp";
		
	}
	
	@Transactional
	@PostMapping(path = "/assign")
	public String assign(HttpServletRequest request ,Model model) {
		int pid = Integer.parseInt(request.getParameter("project")) ;
		int uid = Integer.parseInt( request.getParameter("employee"));
		Project pr = prep.findById(pid).get();
		User us = urep.findById(uid).get();
		List<User> uset = pr.getEmployee_id();
		List<Project> pset = us.getProject_id();
		uset.add(us);
		pset.add(pr);
		pr.setEmployee_id(uset);
		us.setProject_id(pset);
		us.setStatus("assigned");
		//System.out.println(pr);
		List<User> ul = prep.empListforproject(pid);
		model.addAttribute("pul", ul);
		model.addAttribute("assignproject", pid);
		return showAssign(model);
	}
	
//	@PostMapping("/project/{projectId}/employee/{employeeId}/remove")
//	public String removeEmployeeFromProject(@PathVariable int projectId, @PathVariable int employeeId,Model model) {
//		System.out.println("here");
//	    Project p = prep.findById(projectId).get();
//	    List<User> emp= p.getEmployee_id();
//	    User u = urep.findById(employeeId).get();
//	    emp.remove(u);
//	    System.out.println(emp);
//	    p.setEmployee_id(emp);
//	    return showAssign(model);
//	}
	@Transactional
	@PostMapping(path = "/removeassign")
	public String removeEmployeeFromProject(HttpServletRequest request ,Model model) {
		int emp_id = Integer.parseInt(request.getParameter("empid"));
		int prj_id = Integer.parseInt(request.getParameter("prid"));
		User us = urep.findById(emp_id).get();
		us.setStatus("free");
		prep.removeAssignedEmp(emp_id);
		List<User> ul = prep.empListforproject(prj_id);
		model.addAttribute("pul", ul);
		return showAssign(model);
	}
	
	
	
	
	
	

}
