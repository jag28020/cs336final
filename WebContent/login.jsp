<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

	<%
	try {

		//Create a connection string
		String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "jag583", "Jag52395!");

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String username = request.getParameter("lUsername");
		String password = request.getParameter("lPassword");

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		String str = "SELECT COUNT(*) as cnt FROM users WHERE username = '"+username+"' AND password = '"+password+"'";

		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
		
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countUsers = result.getInt("cnt");
	
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		if (countUsers==0)
			out.print("<h2>Login Failed</h2>");
		else
			out.print("<h2>Login Succeeded!</h2>");
		

	} catch (Exception ex) {
		out.print("insert failed");
		out.print(ex);
	}
%>
</body>
</html>