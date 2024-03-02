<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
		String name= (String) session.getAttribute("oname");
		String email= (String) session.getAttribute("oemail");
		String pass= (String) session.getAttribute("opass");
		String city= (String) session.getAttribute("ocity");		
	%>
    
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Welcome <%=name %> </title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/index.css">
</head>
<body>
			<div class="row header-bg" >
				<div class="col-md-4 logo">
						<a href="index.jsp"><img alt="" src="images/ao.png" style="height: 35px"> <span class="logot">Job Hub</span></a>
						
				</div>
				
				<div class="col-md-4">
					<span style="color: white;">COMPANY Welcome <%=name %></span>
				</div>
				
				<div class="col-md-4">
			  <a href="Logout" class="hlinks">Logout</a>    
					
				<!--	<form action="Logout">
						<input type="submit">
					</form>
					 -->	
				</div>
				
			</div>
</body>
</html>