<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/register.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/fonts.css">
</head>
<body>
	<div class="row">
		<div class="col-md-2">
		</div>
		
		<div class="col-md-8">
			<div class="row" style="border: 1px solid gray; border-radius: 3px;box-shadow: 2px 2px 8px black;">
				<div class="col-md-12">
					<h4 style="margin-left: 200px">Project Details <a href="add-profile-project.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
					
				<%
				String email= (String) session.getAttribute("semail");
				
				String id="", projectname="",skills="",description="";
				Connection con=DBConnect.getConnect();
				try {
											
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
					PreparedStatement ptst=con.prepareStatement("select * from project where email=?");
					ptst.setString(1, email);
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
</body>
</html>