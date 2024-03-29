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
		String industry = (String)session.getAttribute("industry");		
		String specialities = (String)session.getAttribute("specialities");		
		String website = (String)session.getAttribute("website");		
		String empno = (String)session.getAttribute("empno");		
		String about = (String)session.getAttribute("about");		

		%>
		
		
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		
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
						<h1 style="font-family: abcd" ><%=name %> <a href="edit-companyabout.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a></h4></h1> <br> <br>
						<span class="ohed">Website</span> : <span class="osh"> <%=website %> </span> <br>
						<span class="ohed">Industry</span> : <span class="osh"> <%=industry %> </span> <br>
						<span class="ohed">Company size</span> : <span class="osh"> <%=empno %> </span> <br>
						<span class="ohed">Specialties</span> : <span class="osh"> <%=specialities %> </span>
						
					</div>
					<div class="about" style="margin:20px;">
						<div class="ohed" >About</div>
						<div class="osh"> <%=about %> </div>
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
					
					<div class="jobcont" style="width: 100%; margin: 15px; padding: 10px; ">
						<%
						String jobprofile="",experiance="",salary="",description="",openings="",skills="",location="",cemail="",cperson="",cprofile="",cphone="";                              
						int id ;
						
							try{
								Connection con=DBConnect.getConnect();
								PreparedStatement ptst=con.prepareStatement("select * from jobs where company=?");
								ptst.setString(1, name);
								ResultSet rs=ptst.executeQuery();
								
								while(rs.next()){	
										id = rs.getInt("id");
										jobprofile=rs.getString("jobprofile");
										experiance=rs.getString("experiance");
										location=rs.getString("location");
										salary=rs.getString("salary");
										description=rs.getString("description");
										skills=rs.getString("skills");
										
										%>
											<div class="col-md-12 job-display">
												<h3><b><%=jobprofile %></b></h3>
												<div><b>Salary</b> :-<%=salary %></div>
												<div><b>Location</b> :-<%=location %></div>
												<div><b>Skills</b> :-<%=skills %></div>
												<div><b>Description</b> :-<%=description %></div>
												<div><a href="jobs-desc.jsp?id=<%=id%>">See Full Details</a></div>
											</div>
										<%
								}
							}catch(Exception e){
								e.printStackTrace();
							}
						
						%>												
					</div>
	
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>
			
					