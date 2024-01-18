<!-- duplicate entry,logout -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	String email=(String) session.getAttribute("semail");
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" href="images/ao.png">
		<title>Job Portal</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/index.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	</head>
	<body>
	
		<div class="container-fluid">
		
			<%
				if(email==null || email=="" || email.equals("")){
				%> <jsp:include page="header.jsp"></jsp:include> <%	
				}else{
				%> <jsp:include page="profileheader.jsp"></jsp:include> <%	
				}
			%>
		
			<jsp:include page="menubar.jsp"></jsp:include>
				
			
			
			<div class="row">
				<div class="col-md-2 jobs" style="list-style: none;">
					<ul>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
					</ul>
				</div>
				
				<div class="col-md-8" style="background-color: #f3f1f48f; margin-top: 10px">
					<div class="row">
					
						<%
						String jid="", jobid="",job_profile="",company="",experiance="",salary="",description="",openings="",location="",c_email="",contact_person="",contact_profile="",contact_phone="";                              

						
							try{
								Connection con=DBConnect.getConnect();
								PreparedStatement ptst=con.prepareStatement("select * from applied_jobs where email=?");
								ptst.setString(1,email);
								ResultSet rs=ptst.executeQuery();
								
								while(rs.next()){
									jid=rs.getString("jid");
									
									PreparedStatement ptst2=con.prepareStatement("select * from jobs where id=?");
									ptst2.setString(1,jid);
									ResultSet rs2= ptst2.executeQuery();
									while(rs2.next()){
										job_profile=rs2.getString("job_profile");
										company=rs2.getString("company");
										experiance=rs2.getString("experiance");
										salary=rs2.getString("salary");
										description=rs2.getString("description");
										
										%>
											<div class="col-md-12 job-display">
												<b><%=job_profile %></b>
												<div><b>Company</b> :-<%=company %></div>
												<div><b>Salary</b> :-<%=salary %></div>
												<div><b>Description</b> :-<%=description %></div>
												<div><a href="jobs-desc.jsp?jid=<%=jid%>">See Full Details</a></div>
											</div>
										<%
									}
									
								}
								
							}catch(Exception e){
								e.printStackTrace();
							}
						
						%>
												
					</div>
				</div>
				
				<div class="col-md-2" style="list-style: none;">
					<ul>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
						<li><a href="">Accenture</a></li>
					</ul>
				</div>
			</div>
			
				
			<jsp:include page="footer.jsp"></jsp:include>	
			
		</div>
		
	</body>
</html>