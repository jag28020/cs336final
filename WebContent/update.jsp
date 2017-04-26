<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
		//Create a connection string
		String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
		
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
				
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//strings//
		String RUEmail=request.getParameter("uEmail");
		String name=request.getParameter("uName");
		String phone=request.getParameter("uPhone");
		String username = session.getAttribute("username").toString();
		
		//query//
		String str="UPDATE users SET users.name='"+name+"', users.ru_email='"+RUEmail+"', users.phone='"+phone+"' WHERE users.username='"+username+"'";
		
		//Run query against DB//
		int result = stmt.executeUpdate(str);
		
	} catch (Exception ex) {
		out.print("insert failed");
		out.print(ex);
	}
	%>
</body>
</html>