package com.projectmanagement.controller;

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
import com.projectmanagement.entities.Subtask;
import com.projectmanagement.entities.Task;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class SubTaskController {
	@Autowired
	private ProjectRepo prep;
	
	@Autowired
	private UserRepo urep;
	
	@Autowired
	private TaskRepo trep;
	
	@Autowired
	private SubTaskRepo strep;
	
	@GetMapping(path = "/subtasklist")
	public String subTaskList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int eid = (Integer)(session.getAttribute("user"));
		List<Task> tls = trep.taskOfEmp(eid);
		model.addAttribute("emptaskls", tls);
		return "addsubtask";
	}
	@PostMapping(path = "/showsubtask")
	public String showSubTaskList(HttpServletRequest request,Model model) {
		int tid =Integer.parseInt(request.getParameter("tsk"));
		List<Subtask> sublist = strep.subtaskOfTask(tid);
		model.addAttribute("subtasklist",sublist);
		model.addAttribute("taskid", tid);
		return subTaskList(request, model);
	}
	@PostMapping(path = "/addsubtask")
	public String saveSubtask(HttpServletRequest request,Model model) {
		int tid =Integer.parseInt(request.getParameter("taskid"));
		Task t = trep.findById(tid).get();
		String stnm = request.getParameter("subtaskName");
		String stdesc = request.getParameter("subtaskDescription");
		Subtask st = new Subtask(stnm, stdesc, "pending", t);
		strep.save(st);
		return subTaskList(request,model);
	}
	
	@PostMapping(path = "/removesubtask")
	public String removeSub(HttpServletRequest request,Model model) {
		int stid =Integer.parseInt(request.getParameter("subtaskId"));
//		Subtask s = strep.findById(stid).get();
//		strep.delete(s);
		strep.removeSubTask(stid);
		return subTaskList(request,model);
	}
	
	@PostMapping(path = "/showupdateSubtask")
	public String showUpdateSub(HttpServletRequest request,Model model) {
		int stid =Integer.parseInt(request.getParameter("subtaskId"));
		Subtask sub = strep.findById(stid).get();
		model.addAttribute("updtsubtsk", sub);
		return "updatesubtask";
	}
	
	@Transactional
	@PostMapping(path = "/updatesubtask")
	public String updateSub(HttpServletRequest request, Model model) {
		int stid =Integer.parseInt(request.getParameter("subtask_id"));
		String stnm = request.getParameter("subtask_name");
		String stdesc = request.getParameter("subtask_description");
		String ststatus = request.getParameter("subtask_status");
		Subtask sub = strep.findById(stid).get();
		sub.setSubtaskName(stnm);
		sub.setSubtaskDesc(stdesc);
		sub.setSubtaskStatus(ststatus);
		return subTaskList(request,model);
	}
	
	
	
}
