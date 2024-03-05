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
					<h4 style="margin-left: 200px">Education Details <a href="add-profile-education.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
					
				<%
				String email= (String) session.getAttribute("semail");
				
				String school="",degree="",year="",grade="",description="",id="";
				Connection con=DBConnect.getConnect();
				try {
											
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
					PreparedStatement ptst=con.prepareStatement("select * from education where email=?");
					ptst.setString(1, email);
					ResultSet rs=ptst.executeQuery();
					
					while(rs.next()){
						id= rs.getString("id");
						school= rs.getString("school");
						degree= rs.getString("degree");
						year= rs.getString("year");
						grade= rs.getString("grade");
						description= rs.getString("description");
				%>	
				
						<div class="row">
							<div class="col-md-2">
								<img alt="image" src="images/college.png" height="50px">
							</div>
							<div class="col-md-9">
								School :- <%=school %> <a href="edit-profile-education.jsp?id=<%=id%>"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a> <br>
								Degree :- <%=degree %> <br>
								Grade :- <%=grade %> <br> 
								Year :- <%=year %> <br> 
								Description :- <%=description %> <br> 
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