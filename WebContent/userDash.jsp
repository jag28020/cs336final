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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
	<%
		String email = "";
		String phone = "";
		String name = "";


		try {
			String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM users WHERE username='" + session.getAttribute("username").toString() + "'";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			email = result.getString("ru_email");				
			name = result.getString("name");
			if (name==null)
				name = "";
			phone = result.getString("phone");
			if (phone==null)
				phone = "";
			con.close();
		}
		catch(Exception e){
			out.print(e);
		}
	
	
	%>
	<div class="container">
		<h1>Welcome <%= session.getAttribute("username").toString() %></h1>
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3>User Info</h3>
				<form method="post" action="processUserUpdate.jsp">
					<div class="form-group">
						<label for="ru_email">Rutgers Email</label>
						<input type="text" class="form-control" id="uEmail" name="uEmail" placeholder="email" value='<%=email%>'>
					</div>
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" class="form-control" id="uName" name="uName" placeholder="Name" value='<%=name%>'>
					</div>
					<div class="form-group">
						<label for="name">Phone</label>
						<input type="text" class="form-control" id="uPhone" name="uPhone" placeholder="Phone" value='<%=phone%>'>
					</div>
					<input type="submit" class="btn btn-default">
					<br/><br/>
					<a href="processLogout.jsp" class="btn btn-default">Logout</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>