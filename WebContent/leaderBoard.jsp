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
		<div class="row">
			<div class="col-md-6">
				<h3>Leader Board</h3>
				<table class="table">
					<tr>
						<th>Driver </th>
						<th>Rides</th>
						<th>Earnings</th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT * FROM leaderboard";
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