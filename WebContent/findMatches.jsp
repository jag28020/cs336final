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
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>Matching Ride Requests</h3>
				<a class="btn btn-primary" href="userDash.jsp">Back to Dashboard</a>
				<br/><br/>
				<table class="table">
					<tr>
						<th>Passenger </th>
						<th>Accept Request </th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String[] params = request.getQueryString().split("&");

							String str = "SELECT passenger FROM requests WHERE ";
							for (int i=0; i<params.length-1; i++){
								str+=params[i].replaceAll("%20", " ").replaceAll("=", "='");
								str+="'";
								if (i<params.length-2)
									str+=" AND ";
							}
							ResultSet result = stmt.executeQuery(str);
							while (result.next()) {
								out.print("<tr>");
								String s = result.getString(1);
						        out.print("<td>"+s+"</td>");
 	  							out.print("<td><a class='btn btn-primary' href='processRequestUpdate.jsp?" 
						        																		+ request.getQueryString() 
						        																		+ "&passenger=" 
						        																		+ result.getString("passenger") 
						        																		+ "&driver=" 
						        																		+ session.getAttribute("username").toString()
						        																		+ "&accepted=1" 
						        																		+ "'>Click</a> </td>");
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