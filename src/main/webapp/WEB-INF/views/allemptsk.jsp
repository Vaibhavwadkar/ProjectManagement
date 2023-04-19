<%@page import="com.projectmanagement.entities.Task"%>
<%@page import="com.projectmanagement.entities.User"%>
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
    <!-- Custom styles for this page -->
    <link href="./dashboard-style/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">

<%-- <form action="showtaskofemp" method="post" id="myForm">
  <label for="employee">Employee:</label>
  <select id="employee" name="employee">
    <% 
    List<User> ulst =(List<User>)request.getAttribute("allemp");
				for(User i:ulst){%>
					<option value=<%=i.getId()%>><%=i.getFirstName()+" "+i.getLastName() %></option>
			<%	}
			%>
  </select>
  <button type="submit" >Show Task</button>
  </form>
  <h2>Tasks</h2>
  <% if(request.getAttribute("tasklistofemp")!=null) { %>
  <form action="filtertask" method="post">
  	<select id="filter" name="filter">
   		<option value="all">All</option>
   		<option value="pending">Pending</option>
   		<option value="ready">Ready to review</option>
  </select>
  <button type="submit" >Filter</button>
  </form>
  <%}%>
	<table>
		<thead>
			<tr>
				<th>Sr.No.</th>
				<th>Task Name</th>
				<th>Start Date</th>
				<th>Due Date</th>
				<th>Assigned</th>
				<th>Status</th>
				<th>View Details</th>
			</tr>
		</thead>
		<tbody>
		<% if(request.getAttribute("tasklistofemp")!=null) {
			List<Task> taskProject = (List<Task>)request.getAttribute("tasklistofemp");
			for(Task t:taskProject){
		%>
			<tr>
				<td>1</td>
				<td><%=t.getTaskName() %></td>
				<td><%=t.getTaskStartDate() %></td>
				<td><%=t.getTaskDueDate() %></td>
				<td><%=t.getEmployeeId().getFirstName()+" "+t.getEmployeeId().getLastName() %></td>
				<td><%=t.getTaskStatus() %></td>
				<td><form action="taskDtls" method="post">
      				<input type="hidden" value=<%=t.getId() %> name="taskId">
      				<input type="submit" value="Review"  <%=t.getTaskStatus().equalsIgnoreCase("completed") ? "readonly" : "" %> >
      			</form></td>
			</tr>
		<%}
		}%>
		</tbody>
	</table> --%>
	<!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="sidebar-mgr.jsp"%>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="topbar.jsp"%>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Task List</h1>
                    </div>
                    <div class="card-body ">
                    	<form action="showtaskofemp" method="post">
							<div class="mb-12 row input-group">
							<div class="col-sm-2"><label for="employee" >Employee:</label></div>
							<div class="col-sm-10"><select id="employee" name="employee" class="form-control">
								 <% 
    								List<User> ulst =(List<User>)request.getAttribute("allemp");
									for(User i:ulst){%>
										<option value=<%=i.getId()%>><%=i.getFirstName()+" "+i.getLastName() %></option>
									<%	}
									%>
							</select></div>
							</div>
							<button type="submit" id="update-btn" class="btn btn-primary" style="margin-bottom: 10px;">Show Task</button>
							</form>
							<% if(request.getAttribute("tasklistofemp")!=null) { %>
								<form action="filtertask" method="post">
									<div class="mb-12 row input-group">
									<div class="col-sm-2">
										<select id="filter" name="filter" class="form-control">
   											<option value="all">All</option>
   											<option value="pending">Pending</option>
   											<option value="ready">Ready to review</option>
  										</select></div>
									<div class="col-sm-10"><button type="submit" id="update-btn" class="btn btn-primary">Filter</button></div>
							</div>
							</form>
							<%}%>
                    </div>

                    <!-- Content Row -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Task of Project</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Sr.No.</th>
											<th>Task Name</th>
											<th>Start Date</th>
											<th>Due Date</th>
											<th>Assigned</th>
											<th>Status</th>
											<th>View Details</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Sr.No.</th>
											<th>Task Name</th>
											<th>Start Date</th>
											<th>Due Date</th>
											<th>Assigned</th>
											<th>Status</th>
											<th>View Details</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                     <% if(request.getAttribute("tasklistofemp")!=null) {
										List<Task> taskProject = (List<Task>)request.getAttribute("tasklistofemp");
										for(Task t:taskProject){
										%>
										<tr>
											<td>1</td>
											<td><%=t.getTaskName() %></td>
											<td><%=t.getTaskStartDate() %></td>
											<td><%=t.getTaskDueDate() %></td>
											<td><%=t.getEmployeeId().getFirstName()+" "+t.getEmployeeId().getLastName() %></td>
											<td><%=t.getTaskStatus() %></td>
											<td><form action="taskDtls" method="post">
      											<input type="hidden" value=<%=t.getId() %> name="taskId">
      											<input type="submit" value="Review"  <%=t.getTaskStatus().equalsIgnoreCase("completed") ? "readonly" : "" %> >
      										</form></td>
										</tr>
									<%}
									}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>



 <!-- Bootstrap core JavaScript-->
    <script src="./dashboard-style/vendor/jquery/jquery.min.js"></script>
    <script src="./dashboard-style/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./dashboard-style/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./dashboard-style/js/sb-admin-2.min.js"></script>
    <!-- Page level plugins -->
    <script src="./dashboard-style/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="./dashboard-style/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="./dashboard-style/js/demo/datatables-demo.js"></script>
</body>
</html>