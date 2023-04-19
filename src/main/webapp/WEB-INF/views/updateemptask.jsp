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

	<%  Task tsk = (Task)request.getAttribute("updtetsk"); %>
	<h1>Task Details</h1>
	<p>Task Name: <%=tsk.getTaskName() %></p>
	<p>Task Description: <%=tsk.getTaskDesc() %></p>
	<p>Task Status: <%=tsk.getTaskStatus() %></p>
	<p>Start Date: <%=tsk.getTaskStartDate() %></p>
	<p>Due Date: <%=tsk.getTaskDueDate() %></p>
	<p>Priority: <%=tsk.getTaskPriority() %></p>
	<p>Report To: <%=tsk.getProjectId().getManager().getFirstName()+" "+tsk.getProjectId().getManager().getFirstName() %></p>
	<p>Remark: <%=tsk.getTaskRemark() %></p>
	
	<form action="saveemptask" method="post">
		<input type="hidden" value=<%=tsk.getId() %> name="taskId">
		<label for="comment">Update Status:</label>
		<select name="status">
  			<option value="not-started">Not Started</option>
  			<option value="in-progress">In Progress</option>
  			<option value="ready-to-review">Ready to Review</option>
		</select>
		<button type="submit">Submit</button>
	</form>

</body>
</html>