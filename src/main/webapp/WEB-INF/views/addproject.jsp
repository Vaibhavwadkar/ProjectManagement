<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Project</title>
 <!-- Custom fonts for this template-->
    <link href="./dashboard-style/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./dashboard-style/css/sb-admin-2.min.css" rel="stylesheet">
    <style type="text/css">
    .addproject .form-control{
    	margin-bottom: 10px !important;
    }
    
    </style>
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
                        <h1 class="h3 mb-0 text-gray-800">Add Project</h1>
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
                                    <form action="saveproject" method="POST" class="row gy-2 gx-3 align-items-center">
                        				<div class=" mb-12 row input-group">
                            				 <input type="hidden" id="manager_id" name="manager_id" value=<%=session.getAttribute("user") %>>
                            				 <label for="manager_name" class="col-sm-2 col-form-label">Manager Name:</label>
                            				 <div class="col-sm-10"><input type="text" id="manager_name" class="form-control" name="manager_name" value=<%=session.getAttribute("mgrnm") %> readonly></div>
                            			</div>
                            			<div class="mb-12 row input-group">
                            				<label for="project_name" class="col-sm-2 col-form-label">Project Name:</label>
  											<div class="col-sm-10"><input type="text" id="project_name" class="form-control" name="project_name" required></div> 
										</div>
										<div class="mb-12 row input-group">
  											 <label for="description" class="col-sm-2 col-form-label">Description:</label>
  											 <div class="col-sm-10"><textarea id="description" name="description" class="form-control" required></textarea></div>
										</div>
										<div class=" mb-12 row input-group">
											<div class="col-6">
  											 <label for="start_date" >Start Date:</label>
  											 <input type="date" id="start_date" class="form-control" name="start_date" required>
											</div>
											<div class="col-6">
  											 <label for="end_date">End Date:</label>
  											 <input type="date" id="end_date" class="form-control" name="end_date" required>
  											</div>
  										</div>
  										<div class="mb-12 row input-group">
  											 <label for="status" class="col-sm-2 col-form-label">Status:</label>
  											 <div class="col-sm-10"><input type="text" id="project_status" class="form-control" name="project_status" value="Pending" readonly></div>
										</div>
										<div class="mb-12 row input-group">
  											 <label for="remarks" class="col-sm-2 col-form-label">Remarks:</label>
  											 <div class="col-sm-10"><textarea id="remarks" class="form-control" name="remarks">N/A</textarea></div>
  										</div>
                            				<div >
                                				<button class="btn btn-primary" type="submit">
                                    				Create Project
                                				</button>
                            				</div>
                    				</form>
                                </div>
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
    <script>
    
    function closeCreatedAlert() {
        document.getElementById("created").style.display = "none";
    }

</script>

	
	
	
</body>

</html>