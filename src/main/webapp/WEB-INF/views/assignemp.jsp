<%@page import="com.projectmanagement.entities.Project"%>
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
                        <h1 class="h3 mb-0 text-gray-800">Assign Employee to Project</h1>
                    </div>

                    <!-- Content Row -->

                    <div class="row">
                        <div class="col-xl-12 col-lg-12">
                            <div class="card shadow mb-12" style="padding: 15px">
                                <!-- Card Body -->
                                <div class="card-body addproject">
                                <%
								if (request.getAttribute("addproject") != null) {
								%>
								<div class="alert alert-success alert-dismissible fade show rounded-3" id="created" style="display: flex;" role="alert">
  									<p class="col-sm-10" style="margin: 0px">Project Created Successfully.</p>
  									<button type="button" class="btn col-sm-2" data-bs-dismiss="alert" aria-label="Close" onclick="closeCreatedAlert()" style="padding: 1px;text-align: right;">X</button>
								</div>
								<%
								}
								%>	
								<div class=" gy-2 gx-3 align-items-center">
                                    <form action="showassigned" method="POST" >
                        				<div class=" mb-12 row input-group">
                            				 <label for="project" class="col-sm-2 col-form-label">Projects:</label>
                            				 <div class="col-sm-10">
                            				<select id="project" name="project" class="form-control">
    										<% List<Project> prlst =(List<Project>)request.getAttribute("projectlist");
												for(Project i:prlst){%>
												<option value=<%=i.getId()%>><%=i.getProjectName() %></option>
											<%	}%>
 											 </select>
 											 </div>
                            			</div>
                            				<div >
                                				<button class="btn btn-primary" type="submit">
                                    				Add Employee
                                				</button>
                            				</div>
                    				</form>
                    				<% if (request.getAttribute("emplist") != null && session.getAttribute("projectId") != null) { %>
                    					<form action="assign" method="POST" >
                        				<div class=" mb-12 row input-group">
                            				 <label for="employee" class="col-sm-2 col-form-label">Employees:</label>
                            				  <div class="col-sm-10">
                            				<select id="employee" name="employee" class="form-control">
    										<% List<User> emplst =(List<User>)request.getAttribute("emplist");  
												for(User i:emplst){%>
												<option value=<%=i.getId()%>><%=i.getFirstName()+" "+i.getLastName() %></option>
											<%	}
											%>
 											 </select>
 											 </div>
                            			</div>
                            				<div >
                                				<button class="btn btn-primary" type="submit">
                                    				Add
                                				</button>
                            				</div>
                    				</form>
                    				
                    				<%} %>
                    			</div>
                                </div>
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
                                            <th>sr.no</th>
      										<th>name</th>
      										<th>email</th>
      										<th>phone</th>
      										<th>action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>sr.no</th>
      										<th>name</th>
      										<th>email</th>
      										<th>phone</th>
      										<th>action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                          <% if (request.getAttribute("pul") != null) {
  												List<User> emplstpr =(List<User>)request.getAttribute("pul");
  												for(User i:emplstpr){%>
    												<tr>
      													<td>1</td>
     	 												<td><%=i.getFirstName()+" "+i.getLastName() %></td>
      													<td><%=i.getEmail() %></td>
      													<td><%=i.getPhoneNumber() %></td>
      													<td><form action="removeassign" method="POST">
      														<input type="hidden" value=<%=i.getId() %> name="empid">
            												<input type="submit" value="Remove">
          													</form></td>
    												</tr>
    											<%	}
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