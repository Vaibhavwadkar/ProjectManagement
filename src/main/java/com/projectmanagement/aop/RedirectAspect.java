package com.projectmanagement.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@EnableAspectJAutoProxy
@Aspect
@Component
public class RedirectAspect {
	public RedirectAspect() {
		System.out.println("acpect running");
	}
	
	@Autowired
	private HttpServletRequest request;
	
	@Pointcut("execution(String com.projectmanagement.controller.ProjectController.*(..))")
	public void mypointcutProject() {}
	
	@Around(value = "mypointcutProject()")
	public String redirectValidationProject(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("in acpects redirect method");
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null ) {
			System.out.println("in if condition");
			return "login";
		}
		return (String)jp.proceed();
	}
	@Pointcut("execution(String com.projectmanagement.controller.TaskController.*(..))")
	public void mypointcutTask() {}
	
	@Around(value = "mypointcutTask()")
	public String redirectValidationTask(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("in acpects redirect method");
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null ) {
			System.out.println("in if condition");
			return "login";
		}
		return (String)jp.proceed();
	}
	@Pointcut("execution(String com.projectmanagement.controller.SubTaskController.*(..))")
	public void mypointcutSubtask() {}
	
	@Around(value = "mypointcutSubtask()")
	public String redirectValidationSubtask(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("in acpects redirect method");
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null ) {
			System.out.println("in if condition");
			return "login";
		}
		return (String)jp.proceed();
	}
}
