<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Div</title>
</head>
<body>
	<div class="row">
		
			<div class="col-md-3">
			</div>
			
			<div class="col-md-6 reg">
				<form action="login" method="post">
					<br> <br>
				<h2>Login</h2> <br> <br>
				<input type="text" placeholder="Enter Email..." name=email1 class="reg-tf"> <br> <br>
				<input type="password" placeholder="Enter Password..." name="pass1" class="reg-tf"> <br> <br>
				Remember Me <input type="checkbox" name="Remember" value="Remember1"><br> <br>
				<input type="submit" value="Login" class="btn btn-primary" style="width: 100px">  <br> <br>
				</form>		
			</div>
			
			<div class="col-md-3">
			</div>
		
		</div>
</body>
</html>