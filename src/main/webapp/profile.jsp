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
					<div class="col-md-4">
						<a href="edit-profile-pic.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px;float: right;"></span></a>
						<img alt="" src="images/profile pic.jpg" height="100px">
					</div>
					<div class="col-md-8">
						<h3>Name :- <%=name %><a href="edit-profile-about.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a></h3>  <br> <br>
						<h4>About :</h4> <%=title %> <br>
						<h4>skills :</h4> <%=skills %> <br><br>
						
						<h6>Gender : <%=gender %></h6>
						<h6>Field : <%=field %></h6>
						<h6>City : <%=city %></h6>
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		<!-- ============Education section========= -->
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black;">
					<div class="col-md-12">
						<h4 style="margin-left: 200px">Education Details <a href="add-profile-education.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
						
					<%
					String school="",degree="",year="",grade="",description="",id="";
					Connection con=DBConnect.getConnect();
					try {
												
						con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
						PreparedStatement ptst=con.prepareStatement("select * from education where email=?");
						ptst.setString(1, email);
						ResultSet rs=ptst.executeQuery();
						
						while(rs.next()){
							id= rs.getString("id");
							school= rs.getString("school");
							degree= rs.getString("degree");
							year= rs.getString("year");
							grade= rs.getString("grade");
							description= rs.getString("description");
					%>	
					
							<div class="row">
								<div class="col-md-2">
									<img alt="image" src="images/college.png" height="50px">
								</div>
								<div class="col-md-9">
									School :- <%=school %> <a href="edit-profile-education.jsp?id=<%=id%>"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a> <br>
									Degree :- <%=degree %> <br>
									Grade :- <%=grade %> <br> 
									Year :- <%=year %> <br> 
									Description :- <%=description %> <br> 
								</div>
							</div>
							
					<%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>					
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		
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
						<a href="">Build Resume</a>
					</div>
				</div>
			</div>
		</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>

					