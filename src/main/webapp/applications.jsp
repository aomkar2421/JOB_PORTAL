<!-- duplicate entry,logout -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	String email=(String) session.getAttribute("semail");
	String company=(String) session.getAttribute("oname");
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
		
			<jsp:include page="profileheader.jsp"></jsp:include>
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
						<h2 style="margin: auto; margin-bottom: 25px;">Applications Received</h2>
						<%
						String jobprofile="",uname="",uemail="",description="",openings="",skills="",location="",cemail="",cperson="",cprofile="",cphone="";                              
						int uid ;
						
							try{
								Connection con=DBConnect.getConnect();
								PreparedStatement ptst=con.prepareStatement("select * from applied_jobs a inner join jobs j inner join about_user u inner join register r on a.jid=j.id and u.email = a.email and u.email= r.email where  company = ?");
								ptst.setString(1,company);
								ResultSet rs=ptst.executeQuery();
								
								while(rs.next()){	
										uid = rs.getInt("u.id");
										uname=rs.getString("r.name");
										uemail=rs.getString("u.email");
										jobprofile=rs.getString("j.jobprofile");
										skills=rs.getString("u.skills");
										
										%>
											<div class="col-md-12 job-display">
												<b><%=jobprofile %></b>
												<b><%=uid %></b>
												<div><b>Applicant's Name</b> :-<%=uname %></div>
												<div><b>Applicant's Email</b> :-<%=uemail %></div>
												<div><b>Skills</b> :-<%=skills %></div>
												<div><a href="applicantdesc.jsp?uid=<%=uid%>">See Full Details</a></div>
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