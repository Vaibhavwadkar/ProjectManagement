<%@page import="com.projectmanagement.entities.User"%>
<%@page import="com.projectmanagement.entities.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Project pr = (Project)request.getAttribute("project");
User ur = (User)request.getAttribute("user");
%>
	<form action="savetask" method="post">
  <label for="employee-name">Employee Name:</label>
  <input type="text" id="employee-name" name="employee-name" readonly="readonly" value=<%=ur.getFirstName()+ur.getLastName() %>><br><br>
  
  <input type="hidden" id="employee-id" name="employee-id" value=<%=ur.getId() %>>
  
  <label for="project-name">Project Name:</label>
  <input type="text" id="project-name" name="project-name" value=<%=pr.getProjectName() %> readonly="readonly"><br><br>
  
  <input type="hidden" id="project-id" name="project-id" value=<%=pr.getId() %>>
  
  <label for="task-name">Task Name:</label>
  <input type="text" id="task-name" name="task-name"><br><br>
  
  <label for="task-desc">Task Description:</label><br>
  <textarea id="task-desc" name="task-desc" rows="4" cols="50"></textarea><br><br>
  
  <label for="task-startdate">Task Start Date:</label>
  <input type="date" id="task-startdate" name="task-startdate"><br><br>
  
  <label for="task-duedate">Task Due Date:</label>
  <input type="date" id="task-duedate" name="task-duedate"><br><br>
  
  <input type="submit" value="Submit">
</form>
</body>
</html>