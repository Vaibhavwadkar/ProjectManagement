<%@page import="com.projectmanagement.entities.Subtask"%>
<%@page import="java.util.List"%>
<%@page import="com.projectmanagement.entities.Task"%>
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
	<%-- <h1>Task Details</h1>
	<% Task ts = (Task)request.getAttribute("taskdtls"); %>
	<p><strong>Task Name:</strong> <%=ts.getTaskName() %></p>
	<p><strong>Description:</strong> <%=ts.getTaskDesc() %></p>
	<p><strong>Priority:</strong> <%=ts.getTaskPriority() %></p>
	<p><strong>Start Date:</strong> <%=ts.getTaskStartDate() %></p>
	<p><strong>Due Date:</strong> <%=ts.getTaskDueDate() %></p>
	<p><strong>Completed On:</strong> <%=ts.getTaskCompletedDate() %></p>
	<p><strong>Status:</strong> <%=ts.getTaskStatus() %></p>
	<p><strong>Employee:</strong> <%=ts.getEmployeeId().getFirstName()+" "+ts.getEmployeeId().getLastName() %></p>
	<p><strong>Comment:</strong> <%=ts.getTaskComment() %></p>
	<p><strong>Remark:</strong> <%=ts.getTaskRemark() %></p>

	<form action="updtTaskMgr" method="post">
		<input type="hidden" value=<%=ts.getId() %> name="tskId">
		<label for="status">Update Status:</label>
		<select id="status" name="status" >
			<option value="pending">Pending</option>
			<option value="completed">Completed</option>
		</select><br>

		<label for="remark">Add Remark:</label>
		<textarea id="remark" name="remark"></textarea><br>

		<button type="submit" id="update-btn">Update</button>
	</form> --%>

	<%-- <h2>Subtasks</h2>
	<table>
		<thead>
			<tr>
				<th>Sr.no.</th>
				<th>Subtask Name</th>
				<th>Description</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		<% if(request.getAttribute("subtaskdtls")!=null) {
			List<Subtask> subtskOftsk = (List<Subtask>)request.getAttribute("subtaskdtls");
			for(Subtask st:subtskOftsk){
		%>
			<tr>
				<td>1</td>
				<td><%=st.getSubtaskName() %></td>
				<td><%=st.getSubtaskDesc() %></td>
				<td><%=st.getSubtaskStatus() %></td>
			</tr>
		<%}
			}%>
		</tbody>
	</table> --%>
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
                        <h1 class="h3 mb-0 text-gray-800">Task Details</h1>
                    </div>

                    <!-- Content Row -->

                    <div class="row">
                        <div class="col-xl-12 col-lg-12">
                            <div class="card shadow mb-12" style="padding: 15px">
                                <!-- Card Body -->
                                <div class="card-body ">
                                <% Task ts = (Task)request.getAttribute("taskdtls"); %>
                                    <div class="">
                        				<div class="row mb-3">
                            				 <div class="col-sm-2"><strong><label >Task Name:</label></strong></div> 
                            				 <div class="col-sm-10"><p><%=ts.getTaskName() %></p></div>
                            			</div>
   
										<div class="mb-12 row input-group">
  											<div class="col-sm-2"><strong><label for="description" >Description:</label></strong></div> 
  											 <div class="col-sm-10"><p><%=ts.getTaskDesc() %></p></div>
										</div>
										<div class=" mb-12 row input-group">
											<div class="col-6">
  											 <Strong><label for="start_date" >Priority:</label></Strong>
  											 <p><%=ts.getTaskPriority() %></p>
											</div>
											<div class="col-6">
  											 <Strong><label for="end_date">Status:</label></Strong>
  											 <p><%=ts.getTaskStatus() %></p>
  											</div>
  										</div>
										<div class=" mb-12 row input-group">
											<div class="col-6">
  											 <Strong><label for="start_date" >Start Date:</label></Strong>
  											 <p><%=ts.getTaskStartDate() %></p>
											</div>
											<div class="col-6">
  											 <Strong><label for="end_date">End Date:</label></Strong>
  											 <p><%=ts.getTaskDueDate() %></p>
  											</div>
  										</div>
										<div class=" mb-12 row input-group">
											<div class="col-6">
  											 <Strong><label for="start_date" >Completed On:</label></Strong>
  											 <p><%=ts.getTaskCompletedDate() %></p>
											</div>
											<div class="col-6">
  											 <Strong><label for="end_date">Employee:</label></Strong>
  											 <p><%=ts.getEmployeeId().getFirstName()+" "+ts.getEmployeeId().getLastName() %></p>
  											</div>
  										</div>
  										<div class="mb-12 row input-group">
  											 <div class="col-sm-2"><Strong><label for="description" >Comment:</label></Strong></div>
  											 <div class="col-sm-10"><p><%=ts.getTaskComment() %></p></div>
										</div>
  										<div class="mb-12 row input-group">
  											 <div class="col-sm-2"><Strong><label for="description" >Remark:</label></Strong></div>
  											 <div class="col-sm-10"><p><%=ts.getTaskRemark() %></p></div>
										</div>
                            				<div >
                                				<form action="updtTaskMgr" method="post">
													<input type="hidden" value=<%=ts.getId() %> name="tskId">
													<div class="mb-12 row input-group">
													<div class="col-sm-2"><label for="status" >Update Status:</label></div>
													<div class="col-sm-10"><select id="status" name="status" class="form-control">
														<option value="pending">Pending</option>
														<option value="completed">Completed</option>
													</select></div>
													</div>
													<div class="mb-12 row input-group">
													<div class="col-sm-2"><label for="remark" >Add Remark:</label></div>
													<div class="col-sm-10"><textarea id="remark" name="remark" class="form-control"></textarea></div>
													</div>

													<button type="submit" id="update-btn" class="btn btn-primary">Update</button>
												</form>
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
                            <h6 class="m-0 font-weight-bold text-primary">Subtasks</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Sr.no.</th>
											<th>Subtask Name</th>
											<th>Description</th>
											<th>Status</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Sr.no.</th>
											<th>Subtask Name</th>
											<th>Description</th>
											<th>Status</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                          <% if(request.getAttribute("subtaskdtls")!=null) {
											List<Subtask> subtskOftsk = (List<Subtask>)request.getAttribute("subtaskdtls");
											for(Subtask st:subtskOftsk){
											%>
										<tr>
											<td>1</td>
											<td><%=st.getSubtaskName() %></td>
											<td><%=st.getSubtaskDesc() %></td>
											<td><%=st.getSubtaskStatus() %></td>
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