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
		
		<style type="text/css">
			.rcon{
				background-color: rgb(204, 255, 255);
			    text-align: center;
				margin-top: 10px;
			    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
			}
		</style>
		
    </head>
    <body>
        
        <jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		
		<div class="row">
		
			<div class="col-md-3">
			</div>
			
			<div class="col-md-6 reg">
				<form method="post" name="regorgform" onsubmit="return validation()">  <!-- <form action="reg" method="post"> -->
					<br> <br>
					<h2>Register For Organization</h2> <br><br> 
					<input type="text" placeholder="Enter Organization Name..." name="oname1" class="reg-tf"> <br> <br>
					<input type="text" placeholder="Enter Organization Email..." name="oemail1" class="reg-tf"> <br> <br>
					<input type="password" placeholder="Enter Password..." name="opass1" class="reg-tf"> <br> <br>
					<input type="text" placeholder="Enter City..." name="ocity1" class="reg-tf"> <br> <br>
					<input type="submit" value="Register" class="btn btn-primary" style="width: 100px">	
				</form>		
			</div>
			
			
			<div class="col-md-3">
			</div>
		
		</div>
		
		
		
		<jsp:include page="footer.jsp"></jsp:include>
        
    </body>
    <script type="text/javascript">
			function validation() {
				var name2=document.regorgform.oname1.value;
				var email2=document.regorgform.oemail1.value;
				var pass2=document.regorgform.opass1.value;
				var city2=document.regorgform.ocity1.value;
				
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
				else if(city2==="") {
					alert("City cannot be empty");
					return false;
				}
				else{
					alert("Registered Succesfully")
					document.regorgform.action="regorg";
					document.regorgform.submit();
				}
			}
		</script>
</html>