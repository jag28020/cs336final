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
<title>Admin Dashboard</title>
</head>
<body>
	<div class="container">
		<a href="index.jsp" class="btn btn-primary" style="margin-top:10px">Home</a>
		<h1>Admin Dashboard</h1>
		<br>
		<h3>Add New System Support Staff</h3>
		<form method="POST" action="processNewSysStaff.jsp">
			<div class="form-group">
		    	<label for="username">Username</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="Username">
			</div>
		  	<div class="form-group">
		    	<label for="email">RU Email</label>
		    	<input type="text" class="form-control" id="email" name="email" placeholder="RU Email">
		  	</div>
		  	<div class="form-group">
		    	<label for="password">Password</label>
		    	<input type="password" class="form-control" id="password" name="password" placeholder="Password">
		  	</div>
		  	<input type="submit" class="btn btn-default">
		</form>
		
		<br/><br/>
		
		<h3>Run query</h3>
		<form method="POST" action="processQuery.jsp">
			<div class="form-group">
		    	<label >SQL Query</label>
				<input type="text" class="form-control" id="query" name="query" placeholder="SELECT * FROM users">
			</div>
		  	<input type="submit" class="btn btn-default">
		</form>
		
	</div>
</body>
</html>