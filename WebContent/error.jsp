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
<title>Error</title>
</head>
<body>
	<% 
		String message = "Hi";
		message = request.getQueryString();
		message = message.substring(message.indexOf("=")+1);
		message = message.replaceAll("%20", " ");
	
	%>
	<div class="container">
		<h1>Error</h1>
		<br>
		<p>
			<%= message %>
		</p>
		<a class="btn btn-primary" href="index.jsp">Home</a>
	</div>
	
	
</body>
</html>