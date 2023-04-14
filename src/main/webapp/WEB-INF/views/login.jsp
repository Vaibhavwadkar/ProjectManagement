<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="./login-style/fonts/icomoon/style.css">

    <link rel="stylesheet" href="./login-style/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./login-style/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="./login-style/css/style.css">
<title>Login</title>
</head>
<body>
	<!-- <form name="loginForm" action="verify" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <input type="submit" value="Login">
  	</form> -->
  	<div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6 order-md-2">
          <img src="./login-style/images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8 shadow-lg rounded-3" style="padding: 30px; ">
              <div class="mb-4">
              <h3><strong>Hello there!</strong></h3>
              <p class="mb-4">Make your Project Management easy.</p>
            </div>
            <%
				if (request.getAttribute("login") != null) {
			%>
				<%-- <h5 style="text-align: center; background-color: rgba(255,0,0,0.3); padding: 5px;"><%=request.getAttribute("login")%></h5> --%>
				<div class="alert alert-warning rounded-3" role="alert">
  					<h6 class="alert-heading">Whoops!</h6>
  					<p style="font-size: 13px">Seems that either username or password isn't right. We could help you reset your password.</p>
				</div>
			<%
			}
			%>
            <form name="loginForm" action="verify" method="post">
              <div class="form-group first">
                <label for="username">Email</label>
                <input type="text" class="form-control" id="username" name="username" required>

              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
              </div>

              <input type="submit" value="Log In" class="btn text-white btn-block btn-primary">

              <!-- <span class="d-block text-left my-4 text-muted"> or sign in with</span>
              
              <div class="social-login">
                <a href="#" class="facebook">
                  <span class="icon-facebook mr-3"></span> 
                </a>
                <a href="#" class="twitter">
                  <span class="icon-twitter mr-3"></span> 
                </a>
                <a href="#" class="google">
                  <span class="icon-google mr-3"></span> 
                </a>
              </div> -->
            </form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="./login-style/js/jquery-3.3.1.min.js"></script>
    <script src="./login-style/js/popper.min.js"></script>
    <script src="./login-style/js/bootstrap.min.js"></script>
    <script src="./login-style/js/main.js"></script>
  	
</body>
</html>