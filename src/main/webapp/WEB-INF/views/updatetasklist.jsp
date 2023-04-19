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
	<h1>Assigned Tasks</h1>
	<table>
		<thead>
			<tr>
				<th>Sr. No.</th>
				<th>Task Name</th>
				<th>Task Description</th>
				<th>Task Priority</th>
				<th>Due Date</th>
				<th>Status</th>
				<th>Assignee</th>
				<th>Add Comment</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
		<% if (request.getAttribute("upemptasklist") != null) {
	List<Task> taskls=(List<Task>)request.getAttribute("upemptasklist"); 
	for(Task i:taskls){ %>
			<tr>
				<td>1</td>
				<td><%=i.getTaskName() %></td>
				<td><%=i.getTaskDesc() %></td>
				<td><%=i.getTaskPriority() %></td>
				<td><%=i.getTaskDueDate() %></td>
				<td><%=i.getTaskStatus() %></td>
				<td><%=i.getProjectId().getManager().getFirstName()+" "+i.getProjectId().getManager().getLastName() %></td>
				<td>
					<form action="addcomment" method="post">
						<input type="hidden" value=<%=i.getId() %> name="taskId" >
						<button type="submit">Add Comment</button>
					</form>
				</td>
				<td>
					<form action="updateemptask" method="post">
						<input type="hidden" value=<%=i.getId() %> name="taskId">
						<button type="submit">Update</button>
					</form>
				</td>
			</tr>
			<%}
	}
	if(request.getAttribute("upemptasklist") == null){%>
		<h4>No task Assigned</h4>
		
	<%}
	%>
		</tbody>
	</table>
	
	<h2>Ready to review task</h2>
	<table>
		<thead>
			<tr>
				<th>Sr. No.</th>
				<th>Task Name</th>
				<th>Task Description</th>
				<th>Task Priority</th>
				<th>Due Date</th>
				<th>Status</th>
				<th>Assignee</th>
				<th>Add Comment</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
		<% if (request.getAttribute("upemptasklistreview") != null) {
	List<Task> tasklsr=(List<Task>)request.getAttribute("upemptasklistreview"); 
	for(Task i:tasklsr){ %>
			<tr>
				<td>1</td>
				<td><%=i.getTaskName() %></td>
				<td><%=i.getTaskDesc() %></td>
				<td><%=i.getTaskPriority() %></td>
				<td><%=i.getTaskDueDate() %></td>
				<td><%=i.getTaskStatus() %></td>
				<td><%=i.getProjectId().getManager().getFirstName()+" "+i.getProjectId().getManager().getLastName() %></td>
				<td>
					<form action="addcomment" method="post">
						<input type="hidden" value=<%=i.getId() %> name="taskId" >
						<button type="submit">Add Comment</button>
					</form>
				</td>
				<td>
					<form action="updateemptask" method="post">
						<input type="hidden" value=<%=i.getId() %> name="taskId">
						<button type="submit">Update</button>
					</form>
				</td>
			</tr>
			<%}
	}
	if(request.getAttribute("upemptasklistreview") == null){%>
		<h4>No task Assigned</h4>
		
	<%}
	%>
		</tbody>
	</table>
	
	
</body>
</html>