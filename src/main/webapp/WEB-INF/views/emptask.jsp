<%@page import="com.projectmanagement.entities.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>Task Details</h1>
	</header>
	<main>
	<% if (request.getAttribute("emptask") != null) {
	Task task=(Task)request.getAttribute("emptask"); 
	 %>
		<section>
			<h2>Task Title</h2>
			<p><%=task.getTaskName() %></p>
		</section>
		<section>
			<h2>Description</h2>
			<p><%=task.getTaskDesc() %></p>
		</section>
		<section>
			<h2>Deadline</h2>
			<p><%=task.getTaskDueDate() %></p>
		</section>
		<section>
			<h2>Task Priority</h2>
			<p><%=task.getTaskPriority() %></p>
		</section>
		<section>
			<h2>Project Name</h2>
			<p><%=task.getProjectId().getProjectName() %></p>
		</section>
		<section>
			<h2>Assignee</h2>
			<p><%=task.getProjectId().getManager().getFirstName()+" "+task.getProjectId().getManager().getLastName() %></p>
		</section>
		<form action="subtasklist" method="get">
			<input type="hidden" value=<%=task.getId() %> name="task_id">
			<input type="submit" value="Create Subtask">
		</form>
	<%}
	%>
	</main>
</body>
</html>