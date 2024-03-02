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
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style type="text/css">
			@font-face {
			    font-family:abcd ;
			    src: url("Fonts/Diavlo_BOLD_II.otf");
			}
			
			@font-face {
			    font-family:def ;
			    src: url("Fonts/Divalo_BOLD.otf");
			}
			
			@font-face {
			    font-family:def ;
			    src: url("Fonts/Romanica.Ttf");
			}
			
			.ohed{
				font-family:lmn;
				font-weight: 800;
				font-size: 18px;
				margin-bottom: 4px;
			}
			
			.osh{
				font-family:lmn;
				font-weight: 400;
				font-size: 18px;
				margin-bottom: 4px;
				
			}
		</style>
	</head>
	<body>
	
		<%
		String name= (String) session.getAttribute("oname");
		String email= (String) session.getAttribute("oemail");
		String pass= (String) session.getAttribute("opass");
		String city= (String) session.getAttribute("ocity");
		String profile= (String) session.getAttribute("profile");		
		%>

		
		
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="companymenubar.jsp"></jsp:include>
		
		<!-- ============about section========= -->
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black; ">
					<div class="col-md-4" style="margin: auto;">
						<a href="edit-profile-pic.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px;float: right;"></span></a>
						<img alt="" src="images/company.png" height="100px">
					</div>
					<div class="col-md-8">
						<h1 style="font-family: abcd" ><%=name %></h1> <br> <br>
						<span class="ohed">Website</span> : <span class="osh"><a href="#">www.accenture.com</a></span> <br>
						<span class="ohed">Industry</span> : <span class="osh">Business Consulting and Services</span> <br>
						<span class="ohed">Company size</span> : <span class="osh">10,001+ employees</span> <br>
						<span class="ohed">Specialties</span> : <span class="osh">Management Consulting, Systems Integration and Technology, Business Process Outsourcing, and Application and Infrastructure Outsourcing</span>
						
					</div>
					<div class="about" style="margin:20px;">
						<div class="ohed" >About</div>
						<div class="osh">Accenture is a global professional services company with leading capabilities in digital, cloud, and security. Combining unmatched experience and specialized skills across more than 40 industries, we offer Strategy and Consulting, Technology and Operations Services, and Accenture Song—all powered by the world’s largest network of Advanced Technology and Intelligent Operations centers. 
					</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<!--JOBS SECTION -->
			<div class="col-md-8">
				
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black; ">
					
					<div style="font-family: abcd; margin: 5px;"><h2>RECENT JOBS</h2></div>
					
					<div class="jobcont" style="border: 2px solid black; width: 100%; margin: 15px; padding: 10px; ">
						<h2 style="font-family: lmn">Application Developer</h2>
						<span class="ohed">Location</span> : <span class="osh">Pune, Maharashtra</span> <br>
						<span class="ohed">Job Type</span> : <span class="osh">Hybrid</span> <br>
						<span class="ohed">Vacancy</span> : <span class="osh">28</span> <br>
						<span class="ohed">Experiance</span> : <span class="osh">0-2 Years</span> <br>
						<span class="ohed">Salary</span> : <span class="osh">5-6 LPA</span> <br>
						
					</div>
					<div class="jobcont" style="border: 2px solid black; width: 100%; margin: 15px; padding: 10px; ">
						<h2 style="font-family: lmn">Application Developer</h2>
						<span class="ohed">Location</span> : <span class="osh">Pune, Maharashtra</span> <br>
						<span class="ohed">Job Type</span> : <span class="osh">Hybrid</span> <br>
						<span class="ohed">Vacancy</span> : <span class="osh">28</span> <br>
						<span class="ohed">Experiance</span> : <span class="osh">0-2 Years</span> <br>
						<span class="ohed">Salary</span> : <span class="osh">5-6 LPA</span> <br>
						
					</div>
	
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>
			
					