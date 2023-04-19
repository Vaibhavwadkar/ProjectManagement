<%@page import="com.projectmanagement.entities.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Custom fonts for this template-->
    <link href="./dashboard-style/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./dashboard-style/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<h2>Pending task</h2>
	<% if (request.getAttribute("emptasklists") != null) {
	List<Task> taskls=(List<Task>)request.getAttribute("emptasklists"); 
	for(Task i:taskls){ %>
		<section>
			<h2>Task Title</h2>
			<p><%=i.getTaskName() %></p>
			<h2>Deadline</h2>
			<p><%=i.getTaskDueDate() %></p>
			<h2>Project Name</h2>
			<p><%=i.getProjectId().getProjectName() %></p>
			<h2>Task Priority</h2>
			<p><%=i.getTaskPriority() %></p>
			<h2>Assignee</h2>
			<p><%=i.getProjectId().getManager().getFirstName()+" "+i.getProjectId().getManager().getLastName() %></p>
			<form action="emptask" method="post">
				<input type="hidden" value=<%=i.getId() %> name="taskid">
				<input type="submit" value="View Details" />
			</form>
		</section>
	<%}
	}
	else{%>
		<h4>No task assigned</h4>
	<%}
	%>

</body>
</html>