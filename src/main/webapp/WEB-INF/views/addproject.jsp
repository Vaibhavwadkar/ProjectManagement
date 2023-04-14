<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Project</title>
</head>
<body>
	<form action="saveproject" method="POST">
  <input type="hidden" id="manager_id" name="manager_id" value=<%=session.getAttribute("user") %>>

  <label for="manager_name">Manager Name:</label>
  <input type="text" id="manager_name" name="manager_name" value=<%=session.getAttribute("mgrnm") %> readonly>

  <label for="project_name">Project Name:</label>
  <input type="text" id="project_name" name="project_name" required>

  <label for="description">Description:</label>
  <textarea id="description" name="description" required></textarea>

  <label for="start_date">Start Date:</label>
  <input type="date" id="start_date" name="start_date" required>

  <label for="end_date">End Date:</label>
  <input type="date" id="end_date" name="end_date" required>
  
  <label for="status">Status:</label>
  <input type="text" id="project_status" name="project_status" value="Pending" readonly>

  <label for="remarks">Remarks:</label>
  <textarea id="remarks" name="remarks"></textarea>

  <input type="submit" value="Create Project">
</form>
	
</body>
</html>