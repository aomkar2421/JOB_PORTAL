<!-- duplicate entry,logout -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	String email=(String) session.getAttribute("oemail");
	String name=(String) session.getAttribute("oname");
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" href="images/ao.png">
		<title>Job Portal</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/jobs.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	</head>
	<body>
	
		<div class="container-fluid">
		
			<jsp:include page="profileheader.jsp"></jsp:include>	
			<jsp:include page="menubar.jsp"></jsp:include>
			
			<div class="row">
			
				<div class="col-md-2 jobs" style="list-style: none;">
				</div>
				
				<div class="col-md-8" style="background-color: #f3f1f48f; margin-top: 10px">
					<div class="row">
					
						<%
							String jobid="",jobprofile="",company="",experiance="",salary="",description="",skills="",openings="",location="",cemail="",cperson="",cprofile="",cphone="";                              
							jobid=request.getParameter("jid");
							try{
								Connection con=DBConnect.getConnect();
								PreparedStatement ptst=con.prepareStatement("select * from jobs where id=?");
								ptst.setString(1,jobid);
								ResultSet rs=ptst.executeQuery();
								
								while(rs.next()){
									jobid=rs.getString("id");
									jobprofile=rs.getString("jobprofile");
									company=rs.getString("company");
									experiance=rs.getString("experiance");
									salary=rs.getString("salary");
									openings=rs.getString("openings");
									location=rs.getString("location");
									cemail=rs.getString("cemail");
									cphone=rs.getString("cphone");
									description=rs.getString("description");
									skills=rs.getString("skills");
									
									%>
										<div class="col-md-12 job-display">
											<b><%=jobprofile %></b>
											<div><span class="jt">Company</span> :-<%=company %></div>
											<div><span class="jt">Salary</span> :-<%=salary %> <span class="jt">| Experiance</span> :-<%=experiance %> <span class="jt">| Openings</span> :-<%=openings %></div>
											<div><span class="jt">Skills</span> :-<%=skills %></div>
											<div><span class="jt">Location</span> :-<%=location %></div>
											<br> <div>Contact <br>
											<span class="jt">Company Email</span> :-<%=cemail %></div>
											<div><span class="jt">Phone No</span> :-<%=cphone %></div> <br>
											<div><span class="jt">Description</span> :-<%=description %></div>
											<br>
										</div>
									<%
										}
										}catch(Exception e){
													e.printStackTrace();
												}
								%>					
						</div>
					</div>
				
				<div class="col-md-2" style="list-style: none;">
				</div>
				
			</div>
			
				
			<jsp:include page="footer.jsp"></jsp:include>	
			
		</div>
		
	</body>
</html>