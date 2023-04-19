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
import jakarta.websocket.Session;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectRepo prep;
	
	@Autowired
	private UserRepo urep;
	
	@Autowired
	private TaskRepo trep;
	
	@Autowired
	private SubTaskRepo strep;
	
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
		Project p = new Project(pnm,desc,sdt,edt,null,"pending",rmrk,mu,null);
		prep.save(p);
		model.addAttribute("addproject","added succesfull");
		return "addproject";
		
		
	}
	
	@GetMapping(path = "/showassign")
	public String showProjectList(Model model) {
		
		List<Project> pl = prep.findAll();
		
		model.addAttribute("projectlist",pl);
		return "assignemp";
		
	}
	@PostMapping(path = "/showassigned")
	public String showAssignedEmp(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int pid = Integer.parseInt(request.getParameter("project"));
		List<User> ul = urep.freeEmpList();
		List<User> ulp = prep.empListforproject(pid);
		model.addAttribute("pul", ulp);
		model.addAttribute("emplist",ul);
		session.setAttribute("projectId", pid);
		//model.addAttribute("projectId", pid);
		return showProjectList(model);
		
	}
	
	
	@Transactional
	@PostMapping(path = "/assign")
	public String assign(HttpServletRequest request ,Model model) {
		HttpSession session = request.getSession();
		int pid = (Integer)(session.getAttribute("projectId")) ;
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
		//model.addAttribute("assignproject", pid);
		return showProjectList(model);
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
		HttpSession session = request.getSession();
		int emp_id = Integer.parseInt(request.getParameter("empid"));
		int prj_id = (Integer)(session.getAttribute("projectId"));
		trep.removeTask(prj_id,emp_id);
		User us = urep.findById(emp_id).get();
		us.setStatus("free");
		prep.removeAssignedEmp(emp_id);
		List<User> ul = prep.empListforproject(prj_id);
		model.addAttribute("pul", ul);
		return showProjectList(model);
	}
	
	@GetMapping(path = "/projectlist")
	public String projectList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int mgrid = (Integer)session.getAttribute("user");
		List<Project> projectPen = prep.projetListPending(mgrid);
		List<Project> projectCom = prep.projetListCompleted(mgrid);
		model.addAttribute("pendingProject", projectPen);
		model.addAttribute("completedProject", projectCom);
		return "projectlist";
		
	}
	
	@PostMapping(path = "/pendindPro")
	public String seeProjectDetails(HttpServletRequest request,Model model) {
		int prId = Integer.parseInt(request.getParameter("projectId"));
		HttpSession session = request.getSession();
		session.setAttribute("projectlistId", prId);
		Project p = prep.findById(prId).get();
		List<Task> tls = trep.taskOfProject(prId);
		//List<User> uls = prep.empListforproject(prId);
		List<User> uls = p.getEmployee_id();
		int completedTasks = 0;
		for (Task task : tls) {
            if (task.getTaskStatus().equals("completed")) {
                completedTasks++;
            }
        }
		 int percentage = (int) Math.round((double) completedTasks / tls.size() * 100);
		List<User> fuls = urep.freeEmpList();
		model.addAttribute("percentage", percentage);
		model.addAttribute("curProject", p);
		model.addAttribute("taskOfProject", tls);
		model.addAttribute("empOfProject", uls);
		model.addAttribute("freeEmp", fuls);
		return "projectdetails";
	}
	
	@Transactional
	@PostMapping(path = "/updateProject")
	public String updateProjectMgr(HttpServletRequest request,Model model) {
		int prId = Integer.parseInt(request.getParameter("project-id"));
		String prnm = request.getParameter("project-name");
		String prdesc = request.getParameter("project-desc");
		Date prstd = Date.valueOf(request.getParameter("start-date"));
		Date pred = Date.valueOf(request.getParameter("due-date"));
		String prst = request.getParameter("status");
		Project p = prep.findById(prId).get();
		p.setProjectName(prnm);
		p.setProjectDesc(prdesc);
		p.setProjectStartDate(prstd);
		p.setProjectDueDate(pred);
		p.setProjectStatus(prst);
		return projectList(request, model);
	}
	
	@Transactional
	@PostMapping(path = "/addEmpfrlist")
	public String addempfromlist(HttpServletRequest request,Model model) {
		//int pid = Integer.parseInt(request.getParameter("projectid")) ;
		HttpSession session = request.getSession();
		int pid = (Integer)session.getAttribute("projectlistId") ;
		int uid = Integer.parseInt( request.getParameter("empforproject"));
		Project pr = prep.findById(pid).get();
		User us = urep.findById(uid).get();
		List<User> uset = pr.getEmployee_id();
		List<Project> pset = us.getProject_id();
		uset.add(us);
		pset.add(pr);
		pr.setEmployee_id(uset);
		us.setProject_id(pset);
		us.setStatus("assigned");
		return projectList(request, model);
	}
	
	@PostMapping(path = "/taskDtls")
	public String tskDetails(HttpServletRequest request,Model model) {
		int tid = Integer.parseInt(request.getParameter("taskId")) ;
		Task t = trep.findById(tid).get();
		List<Subtask> sls = strep.subtaskOfTask(tid);
		int completedTasks = 0;
		for (Subtask stask : sls) {
            if (stask.getSubtaskStatus().equals("completed")) {
                completedTasks++;
            }
        }
		 int percentage = (int) Math.round((double) completedTasks / sls.size() * 100);
		 model.addAttribute("percentage", percentage);
		model.addAttribute("taskdtls", t);
		model.addAttribute("subtaskdtls", sls);
		return "taskdetails";
	}
	
	@Transactional
	@PostMapping(path = "/updtTaskMgr")
	public String updateTskMgr(HttpServletRequest request,Model model) {
		int tid = Integer.parseInt(request.getParameter("tskId")) ;
		String tstatus = request.getParameter("status");
		String tremark = request.getParameter("remark");
		Task t = trep.findById(tid).get();
		t.setTaskRemark(tremark);
		t.setTaskStatus(tstatus);
		if(tstatus.equalsIgnoreCase("completed")) {
			Long now = System.currentTimeMillis();
			Date tdt = new Date(now);
			t.setTaskCompletedDate(tdt);
		}
		return projectList(request,model);
		
	}
	
	@GetMapping(path = "mgrprojects")
	public String allprojectofmgr(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int pid = (Integer)session.getAttribute("user") ;
		List<Project> allpofmg = prep.allProjectsofmgr(pid);
		model.addAttribute("allprojectofmgr", allpofmg);
		return "allprojectfortask";
	}
	
	@PostMapping(path = "/showtaskofp")
	public String taskofproject(HttpServletRequest request,Model model) {
		int prid = Integer.parseInt(request.getParameter("project"));
		List<Task> tsklist = trep.taskOfProject(prid);
		model.addAttribute("tasklistofprjct", tsklist);
		return allprojectofmgr(request, model);
	}
	
	@GetMapping(path = "/allusers")
	public String allUserForMgr(Model model) {
		List<User> allUser = urep.empList();
		model.addAttribute("allemp", allUser);
		return "allemptsk";
	}
	
	@PostMapping(path = "/showtaskofemp")
	public String taskofemployee(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int eid = Integer.parseInt(request.getParameter("employee"));
		List<Task> tsklist = trep.taskOfEmployee(eid);
		model.addAttribute("tasklistofemp", tsklist);
		session.setAttribute("empidforfilter", eid);
		return allUserForMgr(model);
	}
	
	@PostMapping(path = "/filtertask")
	public String filtertaskofemployee(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int eid = (Integer)(session.getAttribute("empidforfilter"));
		String ch = request.getParameter("filter");
		if(ch.equalsIgnoreCase("all")) {
			List<Task> tsklist = trep.taskOfEmployee(eid);
			model.addAttribute("tasklistofemp", tsklist);
		}else if(ch.equalsIgnoreCase("pending")) {
			List<Task> tsklist = trep.taskOfEmp(eid);
			model.addAttribute("tasklistofemp", tsklist);
		}else {
			List<Task> tsklist = trep.taskOfEmpReview(eid);
			model.addAttribute("tasklistofemp", tsklist);
		}
		return allUserForMgr(model);
	}
	
	
	

}
