<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Admin Query</title>
</head>
<body>
	<%String sqlQuery = request.getParameter("query"); %>
	<div class="container">
		<a href="adminDash.jsp" class="btn btn-primary" style="margin-top:10px">Back to Admin Dash</a>
		<h1>Admin Query</h1>
		<br>
		<p><%= sqlQuery %></p>
		<br/>
		<p><%
			String sqlResult = "";
			try {
		
				String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
				Statement stmt = con.createStatement();
				String str = sqlQuery;
				ResultSet result = stmt.executeQuery(str);
				
				ResultSetMetaData meta = result.getMetaData();
				int cols = meta.getColumnCount();
				while (result.next()) {
			       for (int i=1; i <= cols; i++) {
			           if (i > 1) 
			        	   out.print(",  ");
			           String val = result.getString(i);
			           out.print(meta.getColumnName(i) + ": " + val);
			       }
			       out.println("<br/>");
			   }
				
				con.close();
		
		
			} catch (Exception ex) {
				response.sendRedirect("error.jsp?msg=" + ex.toString());
			}
		%></p>
	</div>
	
</body>
</html>