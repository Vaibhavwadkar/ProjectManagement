<%@page import="com.projectmanagement.entities.User"%>
<%@page import="com.projectmanagement.entities.Project"%>
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
	<form action="showempassign" method="post">
  <label for="project">Project:</label>
  <select id="project" name="project">
    <% 
    List<Project> prlst =(List<Project>)request.getAttribute("projectlist");
				for(Project i:prlst){%>
					<option value=<%=i.getId()%>><%=i.getProjectName() %></option>
			<%	}
			%>
  </select>
  <input type="submit" value="Show Employees">
  </form>
  <table>
  <thead>
    <tr>
      <th>sr.no</th>
      <th>name</th>
      <th>email</th>
      <th>phone</th>
      <th>action</th>
    </tr>
  </thead>
  <tbody>
  <%
  if (request.getAttribute("pul") != null) {
  List<User> emplstpr =(List<User>)request.getAttribute("pul");
  int cnt=0;
				for(User i:emplstpr){%>
    <tr>
      <td><%=cnt+1 %></td>
      <td><%=i.getFirstName()+" "+i.getLastName() %></td>
      <td><%=i.getEmail() %></td>
      <td><%=i.getPhoneNumber() %></td>
      <td>
      <form action="showassigntask" method="post">
      		<input type="hidden" value=<%=i.getId() %> name="empid">
      		<input type="hidden" value=<%=request.getAttribute("assignproject") %> name="prid">
            <input type="submit" value="Assign Task">
          </form>
      <form action="removeassign" method="POST">
      		<input type="hidden" value=<%=i.getId() %> name="empid">
      		<input type="hidden" value=<%=request.getAttribute("assignproject") %> name="prid">
            <input type="submit" value="Remove">
          </form></td>
    </tr>
    <%	}
  }
			%>
  </tbody>
</table>
</body>
</html>