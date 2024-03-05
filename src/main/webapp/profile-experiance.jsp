<%@page import="connection.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
						<h4 style="margin-left: 200px">Experiance Details <a href="add-profile-experiance.jsp"><span class="glyphicon glyphicon-plus" style="font-size: 15px; margin-left: 5px"></span></a></h4>
						
					<%
					String email= (String) session.getAttribute("semail");

					String company1="",location1="",year1="",title1="",description1="",id1="";
					Connection con=DBConnect.getConnect();
					try {
											
						PreparedStatement ptst=con.prepareStatement("select * from experiance where email=?");
						ptst.setString(1, email);
						ResultSet rs=ptst.executeQuery();
						
						while(rs.next()){
							id1= rs.getString("id");
							company1= rs.getString("company");
							location1= rs.getString("location");
							year1= rs.getString("year");
							title1= rs.getString("title");
							description1= rs.getString("description");
							System.out.println(id1);
					%>	
							<div class="row">
								<div class="col-md-2">
									<img alt="image" src="images/company.png" height="50px">
								</div>
								<div class="col-md-9">
									<input type="hidden" value="<%=id1 %>" name="id1">
									Company :- <%=company1 %> <a href="edit-profile-experiance.jsp?id_exp=<%=id1%>"><span class="glyphicon glyphicon-pencil" style="font-size: 15px; margin-left: 5px"></span></a> <br>
									Location :- <%=location1 %> <br>                          <!-- details are displayed only when name provided here in url (id) mathches name acceesed through getParameter("id") method so be carefull -->
									Title :- <%=title1 %> <br> 
									Year :- <%=year1 %> <br> 
									Description :- <%=description1 %> <br> 
								</div>
							</div>
					<%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					finally {
						try {
							con.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
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