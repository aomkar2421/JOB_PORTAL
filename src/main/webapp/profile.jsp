<%@page import="connection.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login - JobHub</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/register.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/fonts.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		
		
	</head>
	<body>
	
		<%
		String name= (String) session.getAttribute("sname");
		String email= (String) session.getAttribute("semail");
		String pass= (String) session.getAttribute("spass");
		String gender= (String) session.getAttribute("sgender");
		String field= (String) session.getAttribute("sfield");
		String city= (String) session.getAttribute("scity");
		
		String title= (String) session.getAttribute("stitle");
		if(title==null || title.equals("")){
			title="";
		}

		String skills = (String) session.getAttribute("sskills");
	    if(skills==null || skills.equals(""))
	    {
	        skills="";
	    }
		%>
		
		<%
		//to prevent loading of profile page after logging out
		if(name==null || name.equals("")){
			response.sendRedirect("login.jsp");
		}
		%>
		
		
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<!-- ============about section========= -->
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black; ">
					<div class="col-md-4" style="display: flex; flex-direction: column; justify-content: center;">
						<a href="edit-profile-pic.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px;float: right;"></span></a>
						<img alt="" src="images/profile pic.jpg" height="100px" width="100px">
						<div style="margin-top: 20px;">
							<h6 class="ohed">Gender : <span class="osh"><%=gender %></span> </h6>
							<h6 class="ohed">Field : <span class="osh"><%=field %></span> </h6>
							<h6 class="ohed">City : <span class="osh"><%=city %></span> </h6>
						</div>
					</div>
					<div class="col-md-8">
						<h3 class="ohed" style="font-size: 25px">Name :- <%=name %><a href="edit-profile-about.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a></h3>  <br> <br>
						<h4 class="ohed">About :</h4> <span class="osh"><%=title %></span> <br>
						<h4 class="ohed">Skills :</h4> <span class="osh"><%=skills %></span> <br><br>
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		
		<!-- ============Experiance section========= -->	
		<jsp:include page="profile-project.jsp"></jsp:include>	
		
		
		
		<!-- ============Education section========= -->
		<jsp:include page="profile-education.jsp"></jsp:include>	
		
		
		
		<!-- ============Experiance section========= -->	
		<jsp:include page="profile-experiance.jsp"></jsp:include>	
		
		
		
		<div>
			<div class="row">
				<div class="col-md-4">
				</div>
				
				<div class="col-md-6">
					<input type="submit" value="Follow" class="btn btn-default" style="align-self: flex-end;">
				</div>
				
				<div class="col-md-2">
				</div>
			</div>
		</div>
		
		
		<!-- ===========Resume Section=========== -->
		
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black;">
					<div class="col-md-12">
						<a href="">Upload Resume</a>
					</div>
					<div class="col-md-12">
						<a href="resumebuilder.jsp">Build Resume</a>
					</div>
				</div>
			</div>
		</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>

					