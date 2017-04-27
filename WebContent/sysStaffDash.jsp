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
<title>System Support Staff Dashboard</title>
</head>
<body>
	<div class="container">
		<h1>System Support Staff Dashboard</h1>
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3>Edit User</h3>
				<form method="post" action="editUser.jsp">
					<div class="form-group">
						<label for="username">Select a User</label>
						<select name="user">
							<%
							try {
								String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
								Class.forName("com.mysql.jdbc.Driver");
								Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
								Statement stmt = con.createStatement();
								String str = "SELECT username FROM users";
								ResultSet result = stmt.executeQuery(str);
								while (result.next()) {
									String val = result.getString(1);
							       	out.print("<option val=" + val + ">"+val+"</option>");
							   }
								con.close();
						
							} catch (Exception ex) {
								response.sendRedirect("error.jsp?msg=" + ex.toString());
							}
							%>
						</select>
					</div>
					
					<input type="submit" class="btn btn-default">
				</form>
			</div>
			
			
			<div class="col-md-6">
				<h3>Create Ad</h3>
				<form method="post" action="processAd.jsp">
					<div class="form-group">
						<label for="link">Image Link</label>
						<input type="text" class="form-control" name="link" placeholder="www.ImageLink.com"/>
					</div>
					<div class="form-group">
						<label for="link">Price per Impression</label>
						<input type="text" class="form-control" name="driverCommission" placeholder="12.99"/>
					</div>
					<input type="submit" class="btn btn-default">
				</form>
			</div>
									
		</div>
		
		
		<div class="row">
			<div class="col-md-6">
				<h3>Ad Impressions Report</h3>
				<table class="table">
					<tr>
						<th>Link </th>
						<th>Impressions</th>
						<th>Price per Impression </th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT * FROM ads";
							ResultSet result = stmt.executeQuery(str);
							ResultSetMetaData meta = result.getMetaData();
							int cols = meta.getColumnCount();
							while (result.next()) {
								out.print("<tr>");
								for (int i=1; i<=cols; i++) {
						           	out.print("<td>"+result.getString(i)+"</td>");
							     }
								out.print("</tr>");
						   }
							con.close();
					
						} catch (Exception ex) {
							response.sendRedirect("error.jsp?msg=" + ex.toString());
						}
					%>
				</table>
			</div>
		
		
		
		
		</div>
		
		
		
		
		
		
		
	</div>
</body>
</html>