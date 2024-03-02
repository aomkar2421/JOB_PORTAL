<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/index.css">
</head>
<body>
			<div class="row header-bg" >
				<div class="col-md-7 logo">
						<a href="index.jsp"><img alt="" src="images/ao.png" style="height: 35px"><span class="logot">Job Hub</span></a>
						
				</div>
				<div class="col-md-5">
						<div class="btn-group">
						  <button class="btn btn-info btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Employee
						  </button>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="register.jsp">Register</a>
    						<a class="dropdown-item" href="login.jsp">Login</a>
						  </div>
						</div>
						<div class="btn-group">
						  <button class="btn btn-info btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Organization
						  </button>
						  <div class="dropdown-menu">	   
						    <a class="dropdown-item" href="registercompany.jsp">Register</a>
    						<a class="dropdown-item" href="logincompany.jsp">Login</a>
						  </div>
						</div>
				</div>
			</div>
</body>
</html>