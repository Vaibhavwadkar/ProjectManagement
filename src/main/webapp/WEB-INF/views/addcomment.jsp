<%@page import="com.projectmanagement.entities.Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  Task tsk = (Task)request.getAttribute("taskcomment"); %>
	<h1>Task Details</h1>
	<p>Task Name: <%=tsk.getTaskName() %></p>
	<p>Task Description: <%=tsk.getTaskDesc() %></p>
	<p>Task Status: <%=tsk.getTaskStatus() %></p>
	<p>Start Date: <%=tsk.getTaskStartDate() %></p>
	<p>Due Date: <%=tsk.getTaskDueDate() %></p>
	<p>Report To: <%=tsk.getProjectId().getManager().getFirstName()+" "+tsk.getProjectId().getManager().getFirstName() %></p>
	
	<form action="savecomment" method="post">
		<input type="hidden" value=<%=tsk.getId() %> name="taskId">
		<label for="comment">Add Comment:</label>
		<textarea name="comment" id="comment" cols="30" rows="10"></textarea>
		<button type="submit">Submit</button>
	</form>
</body>
</html>