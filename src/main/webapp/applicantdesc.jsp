<!-- duplicate entry,logout -->

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	String email=(String) session.getAttribute("oemail");
	String name=(String) session.getAttribute("oname");
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" href="images/ao.png">
		<title>Job Portal</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/jobs.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	</head>
	<body>
	
		<div class="container-fluid">
		
			<jsp:include page="profileheader.jsp"></jsp:include>	
			<jsp:include page="menubar.jsp"></jsp:include>
			
			<div class="row">
				<div class="col-md-2 jobs" style="list-style: none;">
	
				</div>
				
				<div class="col-md-8" style="background-color: #f3f1f48f; margin-top: 10px">
					<div class="row">
					
					   <%
							String projectname="", uemail="",uname="", uid="",gender="",city="",jobprofile="",company="",experiance="",salary="",about="",skills="",openings="",location="",cemail="",cperson="",cprofile="",cphone="";                              
							uid=request.getParameter("uid");
							
							Connection con=DBConnect.getConnect();

							try{		
								PreparedStatement ptst=con.prepareStatement("select * from about_user a inner join register r on a.email=r.email where a.id=?");
								ptst.setString(1,uid);
								ResultSet rs=ptst.executeQuery();
								
								while(rs.next()){
									uname=rs.getString("r.name");
									uemail=rs.getString("r.email");
									gender=rs.getString("r.gender");
									city=rs.getString("r.city");
									about=rs.getString("a.title");
									skills=rs.getString("a.skills");
						%>
										<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black; ">
											<div class="col-md-4" style="display: flex; flex-direction: column; justify-content: center;">
												<a href="edit-profile-pic.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px;float: right;"></span></a>
												<img alt="" src="images/profile pic.jpg" height="100px" width="100px">
												<div style="margin-top: 20px;">
													<h6>Gender : <%=gender %></h6>
													<h6>City : <%=city %></h6>
												</div>
											</div>
											<div class="col-md-8">
												<h3>Name :- <%=uname %><a href="edit-profile-about.jsp"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a></h3>  <br> <br>
												<h4>About :</h4> <%=about %> <br>
												<h4>skills :</h4> <%=skills %> <br><br>
											</div>
										</div>
						<%
								}
								}catch(Exception e){
									e.printStackTrace();
								}
						%>
					</div>
				</div>
				
				<div class="col-md-2" style="list-style: none;">
				</div>
			</div>
			
			
			
			<!-- ============Education section========= -->
			
			<div class="row">
				<div class="col-md-2">
				</div>
				
				<div class="col-md-8"  style="background-color: #f3f1f48f;">
					<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black;">
						<div class="col-md-12">
							<h4 style="margin-left: 200px">Education Details <a href="add-profile-education.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
							
						<%
						String school="",degree="",year="",grade="",description="",id="";
						try {													
							PreparedStatement ptst=con.prepareStatement("select * from education where email=?");
							ptst.setString(1, uemail);
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
										School :- <%=school %>
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
			
			<div class="row">
				<div class="col-md-2">
				</div>
				
				<div class="col-md-8">
					<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black;">
						<div class="col-md-12">
							<h4 style="margin-left: 200px">Project Details <a href="add-profile-project.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
							
						<%
						
						try {
													
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
							PreparedStatement ptst=con.prepareStatement("select * from project where email=?");
							ptst.setString(1, uemail);
							ResultSet rs=ptst.executeQuery();
							
							while(rs.next()){
								id = rs.getString("id");
								projectname= rs.getString("projectname");
								skills= rs.getString("skills");
								description= rs.getString("description");
						 %>	
						
								<div class="row">
									<div class="col-md-2">
										<img alt="image" src="images/college.png" height="50px">
									</div>
									<div class="col-md-9">
										<b>Project Name :-</b> <br> <%=projectname %> <a href="edit-profile-project.jsp?id=<%=id%>"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a> <br>
										<b>Skills:- </b> <br> <%=skills %> <br>
										<b>Description:-</b> <br> <%=description %> <br>  
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
		
			<div class="row">
				<div class="col-md-2">
				</div>
				
				<div class="col-md-8">
					<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black;">
						<div class="col-md-12">
							<h4 style="margin-left: 200px">Experiance Details <a href="add-profile-experiance.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
							
						<%
	
						String company1="",location1="",year1="",title1="",description1="",id1="";
						try {
												
							PreparedStatement ptst=con.prepareStatement("select * from experiance where email=?");
							ptst.setString(1, uemail);
							ResultSet rs=ptst.executeQuery();
							
							while(rs.next()){
								id1= rs.getString("id");
								company1= rs.getString("company");
								location1= rs.getString("location");
								year1= rs.getString("year");
								title1= rs.getString("title");
								description1= rs.getString("description");
								System.out.println(id1);
						%>	
								<div class="row">
									<div class="col-md-2">
										<img alt="image" src="images/company.png" height="50px">
									</div>
									<div class="col-md-9">
										<input type="hidden" value="<%=id1 %>" name="id1">
										Company :- <%=company1 %> <a href="edit-profile-experiance.jsp?id_exp=<%=id1%>"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a> <br>
										Location :- <%=location1 %> <br>                          <!-- details are displayed only when name provided here in url (id) mathches name acceesed through getParameter("id") method so be carefull -->
										Title :- <%=title1 %> <br> 
										Year :- <%=year1 %> <br> 
										Description :- <%=description1 %> <br> 
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
		
			
				
			<jsp:include page="footer.jsp"></jsp:include>	
			
		</div>
		
	</body>
</html>