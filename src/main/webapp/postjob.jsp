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
			.tf{
				position: relative;
				right: 100px;
				height: 35px;
				width: 300px;
			}
			td{
				position: relative;
				left: 100px;
			}
		</style>
	</head>
	<body>
		
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
		
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8 reg">
				<form action="postjob" method="post">
					<table class="table">
					  <tbody>
					    <tr>
					      <td>Job Profile</td> <td><input type="text" name="jobprofile" class="tf"> </td>
					    </tr>
					 	<tr>
					      <td>Experiance</td> <td><input type="text" name="experiance" class="tf"> </td>
					    </tr>
					 	<tr>
					      <td>Salary</td> <td><input type="text" name="salary" class="tf"> </td>
					    </tr>
					 	<tr>
					      <td>Openings</td> <td><input type="text" name="openings" class="tf"> </td>
					    </tr>
					 	<tr>
					      <td>Location</td> <td><input type="text" name="location" class="tf"> </td>
					    </tr>
					 	<tr>
					      <td>Contact Email</td> <td><input type="text" name="cemail" class="tf"> </td>
					    </tr>
					    <tr>
					      <td>Description</td> <td><textarea name="description" class="tf" rows="4" style="height: 150px"></textarea></td>
					    </tr>
					    <tr>
					      <td>Skills</td> <td><textarea name="skills" class="tf" rows="4" style="height: 150px"></textarea></td>
					    </tr>
					    
					  </tbody>
					</table>
					<input type="submit" class="btn btn-primary" width="250px">
				</form>		
			</div>
			
			<div class="col-md-2">
			</div>
		
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>