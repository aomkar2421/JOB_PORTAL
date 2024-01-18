<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/index.css">
</head>
<body>
			<div class="row menu-bar">
				<div class="col-md-6">
					<ul class="nav-bar">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="">About Us</a></li>
						<li><a href="">Contact Us</a></li>

					</ul>
				</div>
				
				<%
				String email=(String) session.getAttribute("semail");
				%>
				
				<div class="col-md-6">
					<ul class="nav-bar" >
					
					<%
						if(email==null || email=="" ||email.equals("")){
							
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
</body>
</html>