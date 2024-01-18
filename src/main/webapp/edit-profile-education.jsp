<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%
		String name= (String) session.getAttribute("sname");
		String email= (String) session.getAttribute("semail");

	    String id=request.getParameter("id"); 
	    String school="",degree="",year="",grade="",description="";
		try{
			Connection con=DBConnect.getConnect();
			PreparedStatement ptst=con.prepareStatement("select * from education where id=?");
			ptst.setString(1,id);
			
			ResultSet rs=ptst.executeQuery();
			while(rs.next()){
				school=rs.getString("school");
				degree=rs.getString("degree");
				year=rs.getString("year");
				grade=rs.getString("grade");
				description=rs.getString("description");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
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
						<h4>Edit Education Details</h4>
						<form action="EditEducation" method="post">
						<input type="hidden" value="<%=id %>" name="id1">
							<b><%=email %></b> <br><br>
							School :- <br><input type="text" value="<%=school %>" name="school1" style="margin-bottom: 5px"> <br>
							Degree :- <br><input type="text" value="<%=degree %>" name="degree1" placeholder="Eg. B.tech or 10th" style="margin-bottom: 5px"><br>
							Year :- <br><input type="text" value="<%=year %>" name="year1" placeholder="Eg. 2001-2004" style="margin-bottom: 5px"><br>
							Grade :- <br><input type="text" value="<%=grade %>" name="grade1" placeholder="Eg. 90" style="margin-bottom: 5px">%<br>
							Description :- <br><textarea value="" name="description1" placeholder="Your Certifications ,Activities etc." style="width: 300px; height: 100px"><%=description %></textarea> <br>
							<input type="submit" value="Update Education" class="btn btn-primary">
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



					