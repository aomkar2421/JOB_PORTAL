<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login - JobHub</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/register.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	</head>
	<body>
		
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
		  <strong>Hey User!</strong> You have entred wrong details.
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
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
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>