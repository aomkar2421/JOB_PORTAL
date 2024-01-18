<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%
		String name= (String) session.getAttribute("sname");
		String email= (String) session.getAttribute("semail");
		%>
		
		<%
		//to prevent loading of profile page after logging out
		if(name==null || name.equals("")){
			response.sendRedirect("login.jsp");
		}
		%>
    
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
			#ubtn{
				border : 2px solid black;
				border-radius: 7px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black; ">
					<div class="col-md-3">
						<img alt="" src="images/profile pic.jpg" height="100px">
					</div>
					<div class="col-md-9">
						<form action="UploadProfilePic" method="post" enctype="multipart/form-data">
						<h3>Edit Profile Pic</h3>
							<b><%=email %></b> <br><br>
							<input type="file" name="uploadprofilrpic" id="ubtn" value="Select File">
							<input type="button" value="Update Profile Pic" class="btn btn-primary">
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>
