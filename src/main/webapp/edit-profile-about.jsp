<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-2">
			</div>
			
			<div class="col-md-8">
				<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black; ">
					<div class="col-md-3">
						<img alt="" src="images/ao.png" height="100px">
					</div>
					<div class="col-md-9">
						<form action="EPA" method="post">
							<b><%=email %></b> <br><br>
							<input type="text" value="<%=name %>" name="name1" style="margin-bottom: 5px"> <br>
							<input type="text" value="<%=gender %>" name="gender1" style="margin-bottom: 5px"><br>
							<input type="text" value="<%=city %>" name="city1" style="margin-bottom: 5px"><br>
							<textarea placeholder="title" name="title1" style="width: 500px; height: 100px" style="margin-bottom: 5px"><%=title %></textarea> <br>
							<textarea placeholder="skills" name="skills1" style="width: 300px; height: 100px"><%=skills %></textarea> <br>
							<input type="submit" value="Update" class="btn btn-primary">
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
</html>



				<!-- 	<h6>Email :-<%=email %></h6>
						<h6>Gender :-<%=gender %></h6>
						<h6>Field :-<%=field %></h6>
						<h6>City :-<%=city %></h6>    -->	
					