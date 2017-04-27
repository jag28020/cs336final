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
		String username = "";
		String password = "";
		String ru_email = "";
		String name = "";
		String phone = "";
		boolean isAdmin = false;
		boolean isSysStaff = false;
		boolean isDisabled = false;
		
		try {
			String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM users WHERE username='" + request.getParameter("user") + "'";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			username = result.getString("username");
			password = result.getString("password");
			ru_email = result.getString("ru_email");
			name = result.getString("name");
			phone = result.getString("phone");
			isAdmin = result.getBoolean("isAdmin");
			isSysStaff = result.getBoolean("isSysStaff");
			isDisabled = result.getBoolean("isDisabled");
			con.close();
		}
		catch(Exception e){
			response.sendRedirect("error.jsp?msg=" + e.toString());
		}
	
	
	%>
	<div class="container">
		<h1>Edit User <%= request.getParameter("user") %></h1>
		<br>
		<a class="btn btn-default" href="sysStaffDash.jsp">Back to Dashboard</a>
		<div class="row">
			<div class="col-md-6">
				<h3>User Info</h3>
				<form method="post" action="processSupportUpdate.jsp?username=<%= request.getParameter("user") %>">
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" name="password" placeholder="Password" value='<%=password%>'>
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="text" class="form-control" name="ru_email" placeholder="RU Email" value='<%=ru_email%>'>
					</div>
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" name="name" placeholder="Name" value='<%=name%>'>
					</div>
					<div class="form-group">
						<label>Phone</label>
						<input type="text" class="form-control" name="phone" placeholder="Phone" value='<%=phone%>'>
					</div>
					<div class="form-group">
						<label>isAdmin</label>
						<input type="text" class="form-control" name="isAdmin" placeholder="false" value='<%=isAdmin%>'>
					</div>
					<div class="form-group">
						<label>isSysStaff</label>
						<input type="text" class="form-control" name="isSysStaff" placeholder="false" value='<%=isSysStaff%>'>
					</div>
					<div class="form-group">
						<label>isDisabled</label>
						<input type="text" class="form-control" name="isDisabled" placeholder="false" value='<%=isDisabled%>'>
					</div>
					<input type="submit" class="btn btn-default">
					<br/><br/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>