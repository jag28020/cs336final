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
	String str="UPDATE requests SET ";
	String where = " WHERE ";
	try{
		String url = "jdbc:mysql://mysqldbtest.clyorau1iwkj.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "jag583", "cs336final");	
		Statement stmt = con.createStatement();
		String[] params = request.getQueryString().split("&");
		
		//query//

		for (int i=0; i<params.length; i++){
			String param = params[i].replaceAll("%20", " ").replaceAll("=", "='");
			if (param.contains("destination") || param.contains("departure") || param.contains("isRecurring") ) { }
			else if ( param.contains("passenger") || param.contains("date") || param.contains("timeFrom") || param.contains("timeTo") ) {
				where+= "requests." + param + "'";
				if (!param.contains("passenger"))
					where+=" AND ";
			}
			else{
				if (param.contains("timeStart") || param.contains("timeEnd")){
					String now = new java.util.Date().toString();
					String[] parts = now.split(" ");
					now = parts[3];
					param = param.replaceAll("1", now);
					str+="requests.";
					str+=param + "'";
				}
				else{
					str+="requests.";
					str+=param;
					str+="'";
					if (i<params.length-1)
						str+=", ";
				}
			}
		}
		str+=where;
		
		
		int result = stmt.executeUpdate(str);
		
		con.close();
		response.sendRedirect("userDash.jsp");
		
	} catch (Exception ex) {
		out.print(str);
		response.sendRedirect("error.jsp?msg=" + ex.toString());
	}
	%>
</body>
</html>