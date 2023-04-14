<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<script type="text/javascript">
	function matchPasswords() {
		// Get the password and confirm password fields
		var password = document.getElementById("password");
		var confirmPassword = document.getElementById("confirm-password");

		// Check if the passwords match
		if (password.value != confirmPassword.value) {
			 alert("Passwords do not match");
		} 
	}
</script>
</head>
<body>
	<h1>Registration Page</h1>
	<form action="adduser" method="post">
		<label for="first-name">First Name:</label> <input type="text"
			id="first-name" name="first-name" required><br> <label
			for="last-name">Last Name:</label> <input type="text" id="last-name"
			name="last-name" required><br> <label for="email">Email:</label>
		<input type="email" id="email" name="email"
			pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required><br>

		<label for="password">Password:</label> <input type="password"
			id="password" name="password"
			pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required><br>

		<label for="confirm-password">Confirm Password:</label> <input
			type="password" id="confirm-password" name="confirm-password" onblur="matchPasswords()"
			required><br> <label for="role">Role:</label> <select
			id="role" name="role">
			<option value="employee">Employee</option>
			<option value="manager">Manager</option>
		</select><br> <input type="submit" value="Register">
	</form>
</body>
</html>