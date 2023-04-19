<%@page import="com.projectmanagement.entities.Subtask"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Subtask s = (Subtask)request.getAttribute("updtsubtsk") ;%>
	<form action="updatesubtask" method="POST">
  <input type="hidden" value=<%=s.getId() %> name="subtask_id" >
  <label for="subtask_name">Subtask Name:</label>
  <input type="text" id="subtask_name" value=<%=s.getSubtaskName() %> name="subtask_name"><br>

  <label for="subtask_description">Subtask Description:</label>
  <textarea id="subtask_description" name="subtask_description"><%=s.getSubtaskDesc() %></textarea><br>

  <label for="subtask_status">Subtask Status:</label>
  <select id="subtask_status" name="subtask_status" >
    <option value="pending" <%= s.getSubtaskStatus().equalsIgnoreCase("pending") ? "selected" : "" %>>Pending</option>
    <option value="in_progress" <%= s.getSubtaskStatus().equalsIgnoreCase("in_progress") ? "selected" : "" %>>In Progress</option>
    <option value="completed" <%= s.getSubtaskStatus().equalsIgnoreCase("completed") ? "selected" : "" %>>Completed</option>
  </select><br>

  <input type="submit" value="Submit">
</form>
	

</body>
</html>