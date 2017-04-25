<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>Welcome</h1>
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3>User Info</h3>
				<form method="post" action="register.jsp">
					<div class="form-group">
						<label for="ru_email">Rutgers Email</label>
						<input type="text" class="form-control" id="uEmail" name="uEmail" placeholder="email">
					</div>
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" class="form-control" id="uName" name="uName" placeholder="Name">
					</div>
					<div class="form-group">
						<label for="name">Phone</label>
						<input type="text" class="form-control" id="uName" name="uName" placeholder="Phone">
					</div>
					<input type="submit" class="btn btn-default">
				</form>
			</div>
		</div>
	</div>
</body>
</html>