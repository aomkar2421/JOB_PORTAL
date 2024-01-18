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
	</head>
	<body>
		<%
		String name= (String) session.getAttribute("sname");
		String email= (String) session.getAttribute("semail");
		String pass= (String) session.getAttribute("spass");
		String gender= (String) session.getAttribute("sgender");
		String field= (String) session.getAttribute("sfield");
		String city= (String) session.getAttribute("scity");		
		%>
		
		<%
		//to prevent loading of profile page after logging out
		if(name==null || name.equals("")){
			response.sendRedirect("login.jsp");
		}
		%>
		
		
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<img alt="" src="images/ao.png" height="100px">
					</div>
					<div class="col-md-9">
					
						<table>
							<tr>
								<td>Name :-</td>
								<td><input type="text" value=" <%=name.toUpperCase() %>"></td>
							</tr>
							<tr>
								<td>Email :-</td>
								<td><input type="text" value="<%=email %>"></td>
							</tr>
							<tr>
								<td>Gender :-</td>
								<td><input type="text" value="<%=gender %>"></td>
							</tr>
							<tr>
								<td>Field :-</td>
								<td><input type="text" value="<%=field %>"></td>
							</tr>
							<tr>
								<td>City :-</td>
								<td><input type="text" value="<%=city %>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Update" class="btn btn-primary"></td>
							</tr>
							
						</table>
					
						<br>
						<br>
						
						
						<h4>Education Details </h4>
						
						<table>
							  <tr>
							    <td>School :- </td>
							    <td><input type="text" value=""></td>
							  </tr>
							  <tr>
							    <td>Year :- </td>
							    <td><input type="text" value=""></td>
							  </tr>
							  <tr>
							    <td>College :- </td>
							    <td><input type="text" value=""></td>
							  </tr>
							  <tr>
							    <td>Passing Year :- </td>
							    <td><input type="text" value=""></td>
							  </tr>
							  <tr>
							    <td>Experiance :- </td>
							    <td><input type="text" value=""></td>
							  </tr>
							  <tr>
								<td></td>
								<td><input type="submit" value="Update" class="btn btn-primary"></td>
							</tr>							  
						</table>

						
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>