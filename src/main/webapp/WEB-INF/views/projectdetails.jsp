<%@page import="com.projectmanagement.entities.Task"%>
<%@page import="com.projectmanagement.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.projectmanagement.entities.Project"%>
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
	<%-- <h1>Project Details</h1>
	<% Project pr = (Project)request.getAttribute("curProject"); %>
	<form action="updateProject" method="post">
		<input type="hidden" value=<%=pr.getId() %> name="project-id">
		<label for="project-name">Project Name:</label>
		<input type="text" id="project-name" value=<%=pr.getProjectName() %> name="project-name"><br>

		<label for="project-desc">Description:</label>
		<textarea id="project-desc" name="project-desc"><%=pr.getProjectDesc() %></textarea><br>

		<label for="start-date">Start Date:</label>
		<input type="date" id="start-date" value=<%=pr.getProjectStartDate() %> name="start-date"><br>

		<label for="due-date">Due Date:</label>
		<input type="date" id="due-date" value=<%=pr.getProjectDueDate() %> name="due-date"><br>

		<label for="status">Status:</label>
		<select id="status" name="status">
			<option value="pending">Pending</option>
			<option value="completed">Completed</option>
		</select><br>

		<button type="submit" id="update-btn">Update</button>
	</form> --%>
	<%-- <div class="row justify-content-center mt-3">
        <button id="addEmp" onclick="showAddEmpForm()" class="btn btn-primary">Add Employee</button>
     <div id="addEmpForm" style="display: none">
	<form action="addEmpfrlist" method="post" >
		<input type="hidden" value=<%=pr.getId() %> name="projectid">
		<label for="emp">Employee:</label>
		<select id="emp" name="empforproject">
		<% if(request.getAttribute("freeEmp")!=null) {
			List<User> freeu = (List<User>)request.getAttribute("freeEmp");
			for(User u:freeu){
		%>
			<option value=<%=u.getId() %>><%=u.getFirstName()+" "+u.getLastName() %></option>
		<%
			}
			} %>
		</select><br>
		<button type="submit" id="add-emp-btn">Add</button>
	</form>
	<button id="closeEmp" onclick="closeAddEmpForm()" class="btn btn-primary">Close</button>
	</div>
	</div> --%>

	<%-- <h2>Assigned Employees</h2>
	<table>
		<thead>
			<tr>
				<th>Sr.No.</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Remove</th>
			</tr>
		</thead>
		<tbody>
		<% if(request.getAttribute("empOfProject")!=null) {
			List<User> empProject = (List<User>)request.getAttribute("empOfProject");
			for(User u:empProject){
		%>
			<tr>
				<td>1</td>
				<td><%=u.getFirstName() %></td>
				<td><%=u.getLastName() %></td>
				<td><%=u.getEmail() %></td>
				<td><form action="removeassign" method="POST">
      		<input type="hidden" value=<%=u.getId() %> name="empid">
      		<input type="hidden" value=<%=pr.getId() %> name="prid">
            <input type="submit" value="Remove">
          </form></td>
			</tr>
		<%}
		}%>
		</tbody>
	</table> --%>

	<%-- <h2>Tasks</h2>
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
		<% if(request.getAttribute("taskOfProject")!=null) {
			List<Task> taskProject = (List<Task>)request.getAttribute("taskOfProject");
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
      				<input type="submit" value="Review">
      			</form></td>
			</tr>
		<%}
		}%>
		</tbody>
	</table>
	 --%>
	
<body id="page-top">
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
                        <h1 class="h3 mb-0 text-gray-800">Project Details</h1>
                    </div>

                    <!-- Content Row -->

                    <div class="row">
                        <div class="col-xl-12 col-lg-12">
                            <div class="card shadow mb-12" style="padding: 15px">
                                <!-- Card Body -->
                                <div class="card-body ">
                                <% Project pr = (Project)request.getAttribute("curProject"); %>	
                                    <form action="updateProject" method="post" class="row gy-2 gx-3 align-items-center">
                        				<div class=" mb-12 row input-group">
                            				 <input type="hidden" value=<%=pr.getId() %> name="project-id">
                            				 <label for="project-name" class="col-sm-2 col-form-label">Project Name:</label>
                            				 <div class="col-sm-10"><input type="text" class="form-control" id="project-name" value=<%=pr.getProjectName() %> name="project-name"></div>
                            			</div>
   
										<div class="mb-12 row input-group">
  											 <label for="description" class="col-sm-2 col-form-label">Description:</label>
  											 <div class="col-sm-10"><textarea  class="form-control"name="project-desc"><%=pr.getProjectDesc() %></textarea></div>
										</div>
										<div class=" mb-12 row input-group">
											<div class="col-6">
  											 <label for="start_date" >Start Date:</label>
  											 <input type="date" id="start-date" value=<%=pr.getProjectStartDate() %> name="start-date" class="form-control" >
											</div>
											<div class="col-6">
  											 <label for="end_date">End Date:</label>
  											 <input type="date" id="due-date" value=<%=pr.getProjectDueDate() %> name="due-date" class="form-control" >
  											</div>
  										</div>
  										<div class="mb-12 row input-group">
  											 <label for="status" class="col-sm-2 col-form-label">Status:</label>
  											 <div class="col-sm-10">
  											 	<select id="status" name="status" class="form-control">
													<option value="pending">Pending</option>
													<option value="completed">Completed</option>
												</select>
											</div>
										</div>
                            				<div >
                                				<button class="btn btn-primary" type="submit" style="margin-bottom: 10px;">
                                    				Update Project
                                				</button>
                            				</div>
                    				</form>
                    				<!-- <div class="row justify-content-center mt-3"> -->
        								<button id="addEmp" onclick="showAddEmpForm()" class="btn btn-primary">Add Employee</button>
     									<!-- <div id="addEmpForm" class="row gy-2 gx-3 align-items-center" style="display: none"> -->
											<form action="addEmpfrlist" method="post" id="addEmpForm" class="row gy-2 gx-3 align-items-center" style="display: none" >
											<input type="hidden" value=<%=pr.getId() %> name="projectid">
											<div class=" mb-12 row input-group">
												<label for="emp" class="col-sm-2 col-form-label">Employee:</label>
												<div class="col-sm-10"><select id="emp" class="form-control" name="empforproject">
												<% if(request.getAttribute("freeEmp")!=null) {
													List<User> freeu = (List<User>)request.getAttribute("freeEmp");
													for(User u:freeu){
												%>
													<option value=<%=u.getId() %>><%=u.getFirstName()+" "+u.getLastName() %></option>
												<%
												}
												} %>
												</select></div>
											</div>
												<button type="submit" id="add-emp-btn" class="btn btn-primary">Add</button>
												<a id="closeEmp" onclick="closeAddEmpForm()" class="btn btn-primary">Close</a>
												</form>
												<!-- <button id="closeEmp" onclick="closeAddEmpForm()" class="btn btn-primary">Close</button> -->
											<!-- </div> -->
										<!-- </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Progress</h6>
                                </div>
                                <div class="card-body">
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=request.getAttribute("percentage")%>%"
                                            aria-valuenow=<%=request.getAttribute("percentage") %> aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    
                                </div>
                            </div>
                    
                     <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Assigned Employees</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Sr.No.</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Email</th>
											<th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Sr.No.</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Email</th>
											<th>Remove</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                          <% if(request.getAttribute("empOfProject")!=null) {
										  List<User> empProject = (List<User>)request.getAttribute("empOfProject");
										for(User u:empProject){
										%>
										<tr>
											<td>1</td>
											<td><%=u.getFirstName() %></td>
											<td><%=u.getLastName() %></td>
											<td><%=u.getEmail() %></td>
											<td><form action="removeassign" method="POST">
      										<input type="hidden" value=<%=u.getId() %> name="empid">
      										<input type="hidden" value=<%=pr.getId() %> name="prid">
            								<input type="submit" value="Remove">
          									</form></td>
										</tr>
										<%}
										}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tasks</h6>
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
                                         <% if(request.getAttribute("taskOfProject")!=null) {
											List<Task> taskProject = (List<Task>)request.getAttribute("taskOfProject");
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
      											<input type="submit" value="Review">
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
    
	<script>
    function showAddEmpForm() {
       if( document.getElementById("addEmpForm").style.display = "none"){
    	   
    	   document.getElementById("addEmpForm").style.display = "block"
       }
    }
    function closeAddEmpForm() {
       if( document.getElementById("addEmpForm").style.display = "block"){
        document.getElementById("addEmpForm").style.display = "none";
       }
    }

</script>
	
</body>
</html>