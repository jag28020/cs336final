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
		<a href="processLogout.jsp" class="btn btn-default">Logout</a>
		<div class="row">
			<div class="col-md-4">
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
				</form>
			</div>			
		</div>
		<br><hr/><br>
		
		<div class="row">
			<div class="col-md-12">
				<h3>Rides as a Passenger</h3>
				<table class="table">
					<tr>
						<th>Departing From </th>
						<th>Destination</th>
						<th>Date </th>
						<th>Pickup Window Start </th>
						<th>Pickup Window End </th>
						<th>Recurring? </th>
						<th>Car </th>
						<th>Driver </th>
						<th>Start Time</th>
						<th>End Time</th>
						<th>Review Driver</th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT departure, destination, date, timeFrom, timeTo, isRecurring, car, driver, timeStart, timeEnd FROM requests WHERE passenger='" + session.getAttribute("username").toString() + "' AND accepted='1'" ;
							ResultSet result = stmt.executeQuery(str);
							ResultSetMetaData meta = result.getMetaData();
							int cols = meta.getColumnCount();
							while (result.next()) {
								out.print("<tr>");
								for (int i=1; i<=cols; i++) {
									String s = result.getString(i);
									String text = s;
									if (s==null){
										text="PENDING";
									}
									else if (s.equals("1")) 
										text="true";
									else if (s.equals("0"))
										text="false";
									
						           	out.print("<td>"+text+"</td>");
							     }
								out.print("<td><a class='btn btn-default'>Review</a></td>");
								/* out.print("<td><a class='btn btn-primary' href='findMatches.jsp?date=" 
					     																		+ result.getString("date") 
					     																		+ "&timeFrom=" 
					     																		+ result.getString("timeFrom") 
					     																		+ "&timeTo=" 
					     																		+ result.getString("timeTo") 
					     																		+ "&departure=" 
					     																		+ result.getString("departure") 
					     																		+ "&destination="
					     																		+ result.getString("destination")
					     																		+ "&isRecurring=" 
					     																		+ result.getString("isRecurring")
							     																+ "&car=" 
					     																		+ result.getString("car")
					     																		+ "'>Click</a> </td>"); */
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
		<br><hr/><br>
		<div class="row">
			<div class="col-md-12">
				<h3>Rides as a Driver</h3>
				<table class="table">
					<tr>
						<th>Departing From </th>
						<th>Destination</th>
						<th>Date </th>
						<th>Pickup Window Start </th>
						<th>Pickup Window End </th>
						<th>Recurring? </th>
						<th>Car </th>
						<th>Passenger </th>
						<th>Start Time</th>
						<th>End Time</th>
						<th>Review Passenger</th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT departure, destination, date, timeFrom, timeTo, isRecurring, car, passenger, timeStart, timeEnd FROM requests WHERE driver='" + session.getAttribute("username").toString() + "'";
							ResultSet result = stmt.executeQuery(str);
							ResultSetMetaData meta = result.getMetaData();
							int cols = meta.getColumnCount();
							String p1 = "Start";
							String p2 = "timeStart";
							while (result.next()) {
								out.print("<tr>");
								for (int i=1; i<=cols; i++) {
									String s = result.getString(i);
									String text = s;
									if (s==null) {
										text="<a class='btn btn-primary' href='processRequestUpdate.jsp?timeFrom=" 
												+ result.getString("timeFrom") 
												+ "&timeTo=" 
												+ result.getString("timeTo") 
												+ "&date=" 
												+ result.getString("date") 
												+ "&" + p2 + "=1"
												+ "&passenger="
												+ result.getString("passenger") 
												+ "'>" + p1 + "</a>";
										p1 = "End";
										p2 = "timeEnd";
									}
									else if (s.equals("1")) 
										text="true";
									else if (s.equals("0"))
										text="false";
									
						           	out.print("<td>"+text+"</td>");
							     }
								out.print("<td><a class='btn btn-default'>Review</a></td>");
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
		<br><hr/><br>
		<div class="row">
		
			<div class="col-md-4">
				<h3>Add a Car</h3>
				<form method="post" action="processNewCar.jsp">
					<div class="form-group">
						<label>License Plate</label>
						<input type="text" class="form-control" name="licenseplate" placeholder="ABC123">
					</div>
					<div class="form-group">
						<label>Make</label>
						<input type="text" class="form-control" name="make" placeholder="Honda">
					</div>
					<div class="form-group">
						<label>Model</label>
						<input type="text" class="form-control"  name="model" placeholder="Accord">
					</div>
					<div class="form-group">
						<label>Year</label>
						<input type="text" class="form-control" name="year" placeholder="2003">
					</div>
					<div class="form-group">
						<label>Passengers</label>
						<input type="text" class="form-control" name="passengers" placeholder="4">
					</div>
					<input type="submit" class="btn btn-default">
					<br/><br/>
				</form>
			</div>
		
		
		
			<div class="col-md-8">
				<h3>My Cars</h3>
				<table class="table">
					<tr>
						<th>Driver </th>
						<th>License Plate</th>
						<th>Make </th>
						<th>Model </th>
						<th>Year </th>
						<th>Passengers </th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT * FROM cars WHERE driver='" + session.getAttribute("username").toString() + "'";
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
		<br><hr/><br>
		<div class="row">
			<div class="col-md-4">
				<h3>Create Ride Request</h3>
				<form method="post" action="processNewRequest.jsp">
					<div class="form-group">
						<label>Departing From</label>
						<input type="text" class="form-control" name="departure" placeholder="">
					</div>
					<div class="form-group">
						<label>Going To</label>
						<input type="text" class="form-control" name="destination" placeholder="">
					</div>
					<div class="form-group">
						<label>Date</label>
						<input type="date" class="form-control"  name="date" placeholder="">
					</div>
					<div class="form-group">
						<label>Pickup Window Start</label>
						<input type="time" class="form-control" name="timeFrom" placeholder="">
					</div>
					<div class="form-group">
						<label>Pickup Window End</label>
						<input type="time" class="form-control" name="timeTo" placeholder="">
					</div>
					<div class="form-group">
						<label>Recurring?</label>
						<input type="checkbox" class="form-control" name="isRecurring" >
					</div>
					<input type="submit" class="btn btn-default">
					<br/><br/>
				</form>
			</div>
			<div class="col-md-8">
				<h3>My Ride Requests</h3>
				<table class="table">
					<tr>
						<th>Departing From </th>
						<th>Destination</th>
						<th>Date </th>
						<th>Pickup Window Start </th>
						<th>Pickup Window End </th>
						<th>Recurring? </th>
						<th>Accepted? </th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT departure, destination, date, timeFrom, timeTo, isRecurring, accepted FROM requests WHERE passenger='" + session.getAttribute("username").toString() + "'";
							ResultSet result = stmt.executeQuery(str);
							ResultSetMetaData meta = result.getMetaData();
							int cols = meta.getColumnCount();
							while (result.next()) {
								out.print("<tr>");
								for (int i=1; i<=cols; i++) {
									String s = result.getString(i);
									if (s.equals("1")) 
										s="true";
									else if (s.equals("0"))
										s="false";
									
						           	out.print("<td>"+s+"</td>");
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
		<br><hr/><br>
		<div class="row">
			<div class="col-md-4">
				<h3>Create Ride Offer</h3>
				<form method="post" action="processNewOffer.jsp">
					<div class="form-group">
						<label>Departing From</label>
						<input type="text" class="form-control" name="departure" placeholder="">
					</div>
					<div class="form-group">
						<label>Going To</label>
						<input type="text" class="form-control" name="destination" placeholder="">
					</div>
					<div class="form-group">
						<label>Date</label>
						<input type="date" class="form-control"  name="date" placeholder="">
					</div>
					<div class="form-group">
						<label>Pickup Window Start</label>
						<input type="time" class="form-control" name="timeFrom" placeholder="">
					</div>
					<div class="form-group">
						<label>Pickup Window End</label>
						<input type="time" class="form-control" name="timeTo" placeholder="">
					</div>
					<div class="form-group">
						<label>Recurring?</label>
						<input type="checkbox" class="form-control" name="isRecurring" >
					</div>
					<div class="form-group">
						<label>Pick a Car</label>
						<select class="form-control" name="car">
							<%
							try {
								String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
								Class.forName("com.mysql.jdbc.Driver");
								Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
								Statement stmt = con.createStatement();
								String str = "SELECT cars.licenseplate FROM cars WHERE driver='" + session.getAttribute("username").toString() + "'";
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
					<br/><br/>
				</form>
			</div>
			<div class="col-md-8">
				<h3>My Ride Offers</h3>
				<table class="table">
					<tr>
						<th>Departing From </th>
						<th>Destination</th>
						<th>Date </th>
						<th>Pickup Window Start </th>
						<th>Pickup Window End </th>
						<th>Recurring? </th>
						<th>Car </th>
						<th>Matching Requests </th>
					</tr>
					<%
						try {
							String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, "jag583", "cs336final");
							Statement stmt = con.createStatement();
							String str = "SELECT departure, destination, date, timeFrom, timeTo, isRecurring, car FROM offers WHERE driver='" + session.getAttribute("username").toString() + "'";
							ResultSet result = stmt.executeQuery(str);
							ResultSetMetaData meta = result.getMetaData();
							int cols = meta.getColumnCount();
							while (result.next()) {
								out.print("<tr>");
								for (int i=1; i<=cols; i++) {
									String s = result.getString(i);
									String text = s;
									if (s.equals("1")) 
										text="true";
									else if (s.equals("0"))
										text="false";
									
						           	out.print("<td>"+text+"</td>");
							     }
								out.print("<td><a class='btn btn-primary' href='findMatches.jsp?date=" 
					     																		+ result.getString("date") 
					     																		+ "&timeFrom=" 
					     																		+ result.getString("timeFrom") 
					     																		+ "&timeTo=" 
					     																		+ result.getString("timeTo") 
					     																		+ "&departure=" 
					     																		+ result.getString("departure") 
					     																		+ "&destination="
					     																		+ result.getString("destination")
					     																		+ "&isRecurring=" 
					     																		+ result.getString("isRecurring")
							     																+ "&car=" 
					     																		+ result.getString("car")
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