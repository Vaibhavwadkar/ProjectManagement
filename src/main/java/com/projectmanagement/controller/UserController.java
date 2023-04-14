package com.projectmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.projectmanagement.UserRepo;
import com.projectmanagement.entities.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserRepo urep;
	
	@GetMapping(path="/register")
	public String getRegister() {
		
		return "registration";
		
	}
	
	@GetMapping(path="/login")
	public String getLogin() {
		
		return "login";
		
	}
	
	@PostMapping(path = "/adduser")
	public String addUser(HttpServletRequest request , Model model ) {
		String fnm = request.getParameter("first-name");
		String lnm = request.getParameter("last-name");
		String mail = request.getParameter("email");
		String psd = request.getParameter("password");
		String rl = request.getParameter("role");
		if(rl.equalsIgnoreCase("employee")) {
			User u = new User(fnm, lnm, mail, mail, psd, rl,"free" ,null);
			urep.save(u);
		}else {
			User u = new User(fnm, lnm, mail, mail, psd, rl,"active" ,null);
			urep.save(u);
		}
		model.addAttribute("register","Registered succufully");
		return "login";
	}
	
	@PostMapping(path = "/verify")
	public String validate(HttpServletRequest request ,Model model) {
		HttpSession session = request.getSession();
		String unm = request.getParameter("username");
		String pwd = request.getParameter("password");
		User nu = urep.validateUser(unm, pwd);
		if(nu!=null) {
			session.setAttribute("user", nu.getId());
			session.setAttribute("usernm", nu.getFirstName()+" "+nu.getLastName());
			if(nu.getRole().equalsIgnoreCase("manager")) {
				
				return "managerDashboard";
			}
			else {
				return "empDashboard";
			}
		}
		else {
			model.addAttribute("login","Login failed..!!");
			return "login";
			
		}
	}
	
}
