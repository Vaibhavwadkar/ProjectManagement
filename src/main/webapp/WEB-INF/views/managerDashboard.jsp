<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<h1>Welcome to Manager Dashboard...!<%=session.getAttribute("user") %> </h1>
	<a href="/addproject"><input type="button" value="Add project" ></a>
</body>
</html>