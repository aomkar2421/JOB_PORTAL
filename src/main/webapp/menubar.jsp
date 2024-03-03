<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/index.css">
		
		<%
		    String name= (String) session.getAttribute("sname");
			String email= (String) session.getAttribute("semail");
			String oname= (String) session.getAttribute("oname");
			String oemail= (String) session.getAttribute("oemail");
		%>
</head>
<body>
					<%
						if(email != null && !email.equals("") && email != ""){
							//EMPLOYEE CONTENT
						%>
							<div class="row menu-bar">
								<div class="col-md-6">
									<ul class="nav-bar">
										<li><a href="index.jsp">Home</a></li>
										<li><a href="">About Us</a></li>
										<li><a href="">Contact Us</a></li>
									</ul>
								</div>
								
								<div class="col-md-6">
									<ul class="nav-bar" >
										<li><a href="applied-jobs.jsp">Applied Jobs</a></li>
										<li><a href="SimpleJobSearch.jsp">Search Jobs</a></li>
										<li><a href="">Companies</a></li>
										<li><a href="profile.jsp">Profile</a></li>
									</ul>
								</div>
							</div>
						<%
							}else if(oemail != null && !oemail.equals("") && oemail != ""){
							//COMPANY CONTENT
							%>
							<div class="row menu-bar">
								<div class="col-md-6">
									<ul class="nav-bar">
										<li><a href="index.jsp">Home</a></li>
										<li><a href="">About Us</a></li>
										<li><a href="">Contact Us</a></li>
									</ul>
								</div>
								
								<div class="col-md-6">
									<ul class="nav-bar" >
										<li><a href="postjob.jsp">Post Jobs</a></li>
										<li><a href="alljobs.jsp">All Jobs</a></li>
										<li><a href="companyprofile.jsp">Profile</a></li>
									</ul>
								</div>
							</div>
						<%
							
						}else {
							//GENERAL CONTENT
						%>
							<div class="row menu-bar">
								<div class="col-md-6">
									<ul class="nav-bar">
										<li><a href="index.jsp">Home</a></li>
										<li><a href="">About Us</a></li>
										<li><a href="">Contact Us</a></li>
									</ul>
								</div>
								
								<div class="col-md-6">
									<ul class="nav-bar" >
										<li><a href="SimpleJobSearch.jsp">Search Jobs</a></li>
										<li><a href="">Companies</a></li>
										<li><a href="profile.jsp">Profile</a></li>
									</ul>
								</div>
							</div>
						<%
							
						}
					%>
</body>
</html>


<!-- 
<div class="row menu-bar">
				<div class="col-md-6">
					<ul class="nav-bar">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="">About Us</a></li>
						<li><a href="">Contact Us</a></li>
					</ul>
				</div>
				
				<div class="col-md-6">
					<ul class="nav-bar" >
					<% if(email==null || email=="" ||email.equals("")){
						}else{
					%>
						<li><a href="applied-jobs.jsp">Applied Jobs</a></li>
					<%		
						}
					%>
						<li><a href="SimpleJobSearch.jsp">Search Jobs</a></li>
						<li><a href="">Companies</a></li>
						<li><a href="profile.jsp">Profile</a></li>
					</ul>
				</div>
			</div>
 -->