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
		Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		String str = "SELECT COUNT(*) as cnt FROM users";

		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
		
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countCars = result.getInt("cnt");

		String licenseplate = request.getParameter("licenseplate");
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String year = request.getParameter("year");
		int passengers = Integer.parseInt(request.getParameter("passengers"));
		String driver = session.getAttribute("username").toString();


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO cars(licenseplate, make, model, year, passengers, driver)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, licenseplate);
		ps.setString(2, make);
		ps.setString(3, model);
		ps.setString(4, year);
		ps.setInt(5, passengers);
		ps.setString(6, driver);


		//Run the query against the DB
		ps.executeUpdate();
		
		//Check new count
		str = "SELECT COUNT(*) as cnt FROM cars";

		//Run the query against the DB
		result = stmt.executeQuery(str);
		
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int newCount = result.getInt("cnt");
	
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		if (countCars==newCount)
			response.sendRedirect("error.jsp?msg=New Car add failed");
		else{
			response.sendRedirect("userDash.jsp");

		}
		

	} catch (Exception ex) {
		response.sendRedirect("error.jsp?msg=" + ex.toString());
	}
%>
</body>
</html>