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
				<%
				String oemail=(String) session.getAttribute("oemail");
				String profile=(String) session.getAttribute("profile");
				String email= (String) session.getAttribute("oemail");
				%>
			<div class="row menu-bar">
				<div class="col-md-6">
					<ul class="nav-bar">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="">About Us</a></li>
						<li><a href="">Contact</a></li>
						<li><%=profile %></li>
						
					</ul>
				</div>
				
				<div class="col-md-6">
					<ul class="nav-bar" >
					
					<%
						if(oemail==null || oemail=="" ||oemail.equals("")){
							
						}else{
					%>
						<li><a href="post-jobs.jsp">Post Jobs</a></li>
					<%		
						}
					%>
					
						<li><a href="">Applications</a></li>
						<li><a href="companyprofile.jsp">Profile</a></li>
					</ul>
				</div>
			</div>
</body>
</html>