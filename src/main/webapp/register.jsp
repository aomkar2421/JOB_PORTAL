<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Regiater - JobHub</title>
		
		<script type="text/javascript">
			function validation() {
				var name2=document.regform.name1.value;
				var email2=document.regform.email1.value;
				var pass2=document.regform.pass1.value;
				var gender2=document.regform.gender1.value;
				var field2=document.regform.field1.value;
				var city2=document.regform.city1.value;
				
				if (name2==="") {
					alert("Name cannot be empty");
					return false;
				}
				else if (email2==="") {
					alert("Email cannot be empty");
					return false;
				}
				else if (pass2==="") {
					alert("Password cannot be empty");
					return false;
				}
				else if (gender2==="") {
					alert("Email cannot be empty");
					return false;
				}
				else if (email2==="") {
					alert("please select gender");
					return false;
				}
				/*else if (field2==="") {
					alert("please select field");
					return false;
				}*/
				else if(city2==="Select City") {
					alert("please select city");
					return false;
				}
				else{
					document.regform.action="reg";
					document.regform.submit();
				}
			}
		</script>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="css/register.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	</head>
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
		
			<div class="col-md-3">
			</div>
			
			<div class="col-md-6 reg">
				<form method="post" name="regform" onsubmit="return validation()">  <!-- <form action="reg" method="post"> -->
					<br> <br>
				<h2>Register</h2> <br> <br>
				<input type="text" placeholder="Enter Name..." name="name1" class="reg-tf"> <br> <br>
				<input type="text" placeholder="Enter Email..." name=email1 class="reg-tf"> <br> <br>
				<input type="password" placeholder="Enter Password..." name="pass1" class="reg-tf"> <br> <br>
				Select Gender : <input type="radio" name="gender1" value="male">Male <input type="radio" name="gender1" value="female">Female  <br> <br>
				Select Field : <input type="checkbox" name="field1" value="Information Technology"> Information Technology
							   <input type="checkbox" name="field1" value="Marketing"> Marketing <br>
							   <input type="checkbox" name="field1" value="Finance"> Finance <br> <br>
				<select class="reg-tf" name="city1">
					<option>Select City</option>
					<option value="Pune">Pune</option>
					<option value="Mumbai">Mumbai</option>
					<option value="Bengluru">Bengluru</option>
				</select> <br> <br>
				<input type="submit" value="Register" class="btn btn-primary" style="width: 100px">	
				</form>		
			</div>
			
			<div class="col-md-3">
			</div>
		
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	
	</body>
</html>