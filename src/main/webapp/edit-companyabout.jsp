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
							<form action="companyabout" method="post">
								<h1 style="font-family: abcd" ><%=name %></h1> <br> <br>
								<span class="ohed">Website</span> : <span class="osh"> <input type="text" placeholder="Enter Website" name="website1"> </span> <br>
								<span class="ohed">Industry</span> : <span class="osh"> <input type="text" placeholder="Enter Industry" name="industry1"> </span> <br>
								<span class="ohed">Company size</span> : <span class="osh"><input type="text" placeholder="Enter No Of Employees" name="empno1"></span> <br>
								<span class="ohed">Specialties</span> : <span class="osh"> <input type="text" placeholder="Enter Specailities" name="speciaities1"> </span>
								<div class="ohed" >About</div>
								<div class="osh">
									<textarea style="width: 90%" rows="3" name="cabout1"></textarea>
								</div>
								<input type="submit" class="btn btn-primary" value="Update Details">
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
			
					