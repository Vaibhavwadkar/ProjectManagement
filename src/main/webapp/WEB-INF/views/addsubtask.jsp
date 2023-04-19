<%@page import="com.projectmanagement.entities.Subtask"%>
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
	<form action="showsubtask" method="post">
	<label for="task">Task:</label>
	<%
	if (request.getAttribute("emptaskls") != null) {
	%>
  <select id="task" name="tsk">
    <% 
    List<Task> tsklst =(List<Task>)request.getAttribute("emptaskls");
				for(Task i:tsklst){%>
					<option value=<%=i.getId()%>><%=i.getTaskName() %></option>
			<%	}
			%>
  </select>
  <input type="submit" value="Show Subtask">
	
	</form>
	<header>
		<h1>Create Subtask</h1>
	</header>
	<main>
		<form action="addsubtask" method="post">
			<fieldset>
				<legend>Subtask Details</legend>
				<input type="hidden" value=<%=request.getAttribute("taskid") %> name="taskid">
				<label for="subtaskName">Subtask Name:</label>
				<input type="text" id="subtaskName" name="subtaskName"><br><br>
				<label for="subtaskDescription">Subtask Description:</label><br>
				<textarea id="subtaskDescription" name="subtaskDescription"></textarea><br><br>
				<input type="submit" value="Create Subtask">
			</fieldset>
		</form>
	</main>
	<table>
			<thead>
				<tr>
					<th>Sr. No.</th>
					<th>Subtask Name</th>
					<th>Subtask Description</th>
					<th>Status</th>
					<th>Update Status</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
			<%if (request.getAttribute("subtasklist") != null){  
				List<Subtask> stsklst =(List<Subtask>)request.getAttribute("subtasklist");
				for(Subtask i:stsklst){
				%>
			
				<tr>
					<td>1</td>
					<td><%=i.getSubtaskName() %></td>
					<td><%=i.getSubtaskDesc() %></td>
					<td><%=i.getSubtaskStatus() %></td>
					<td>
					<form action="showupdateSubtask" method="post">
						<input type="hidden" value=<%=i.getId() %> name="subtaskId">
						<input type="submit" value="Update">
					</form>
					</td>
					<td>
						<form action="removesubtask" method="post">
							<input type="hidden" value=<%=i.getId() %> name="subtaskId">
							<input type="submit" value="Remove">
						</form>
					</td>
				</tr>
				
			<%
				}
				} %>
			</tbody>
		</table>
		<%}else{ %>
			
			<h4>No task Assigned..!!</h4>
		<%} %>
	</body>
</html>