<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Choose Login or Register</title>
</head>
<body>
	<div class="container">
		<h1>Ride Sharing Service </h1>
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3>Login</h3>
				<form method="post" action="login.jsp">
					<div class="form-group">
				    	<label for="username">Username</label>
				    	<input type="text" class="form-control" id="lUsername" name="lUsername" placeholder="Username">
				  	</div>
				  	<div class="form-group">
				    	<label for="password">Password</label>
				    	<input type="password" class="form-control" id="lPassword" name="lPassword" placeholder="Password">
				  	</div>
				  	<input type="submit" class="btn btn-default">
				</form>
			</div>
			
			<div class="col-md-6">
				<h3>Register</h3>
				<form method="post" action="register.jsp">
					<div class="form-group">
				    	<label for="username">Username</label>
				    	<input type="text" class="form-control" id="rUsername" name="rUsername" placeholder="Username">
				  	</div>
				  	<div class="form-group">
				    	<label for="password">Password</label>
				    	<input type="password" class="form-control" id="rPassword" name="rPassword" placeholder="Password">
				  	</div>
				  	<input type="submit" class="btn btn-default">
				  </form>
			</div>
			
			
		</div>
	</div>
	
	
</body>
</html>