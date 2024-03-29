<!-- duplicate entry,logout -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	String email=(String) session.getAttribute("semail");
	String oemail=(String) session.getAttribute("oemail");
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" href="images/ao.png">
		<title>Job Portal</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="css/list.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<script type="text/javascript">
		
		</script>
		
		<style type="text/css">
			.col-md-8{
			 background: rgba( 114, 67, 208, 0.05 );
			box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
			backdrop-filter: blur( 5px );
			-webkit-backdrop-filter: blur( 5px );
			border-radius: 10px;
			border: 1px solid rgba( 255, 255, 255, 0.18 );
			}
		</style>
		
	</head>
	<body>
	
		<div class="container-fluid">
		
			<jsp:include page="profileheader.jsp"></jsp:include>
		
			<jsp:include page="menubar.jsp"></jsp:include>
			
			<div class="row">
				<img alt="" src="images/banner-11.png" width="100%" height="250px">
			</div>
				
			<div class="row">
				<div class="col-md-2">
					
				</div>	
				
				<div class="col-md-8" style="text-align: center;box-shadow: 0 0 3px #F00, 0 0 5px #00F;margin-top: 20px;">
				<h3>Find your dream job now</h3>
				<h3>At India's No.1 Job Site</h3>
					<input type="text" placeholder="Enter Technology" class="tf-design">
					<input type="text" placeholder="Enter Location" class="tf-design">
					<input type="submit" value="search" class="btn btn-primary">
				</div>	
				
				<div class="col-md-2">
				</div>			
			</div>	
			
			
			<div class="row" style="list-style: none;" >
				<div class="col-md-2 jobs" style="list-style: none;">
				<h4>Categories</h4>
					<ul class="ull">
						<li class="lii">Remote</li>
						<li class="lii">MNC</li>
						<li class="lii">Marketing</li>
						<li class="lii">Supply Chain</li>
						<li class="lii">Banking</li>
						<li class="lii">Startup</li>
						<li class="lii">Analytics</li>
						<li class="lii">HR</li>
						<li class="lii">Sales</li>
						<li class="lii">Data Science</li>
						<li class="lii">Cyber Security</li>
						<li class="lii">Blockcahin</li>
						<li class="lii">Information</li>
					</ul>
				</div>
				
				<div class="col-md-8" style="margin-top: 30px; padding-top: 30px">
					<div class="row">
					
						<%
							String id="",jobprofile="",company="",experiance="",salary="",description="",skills="";
							try{
								Connection con=DBConnect.getConnect();
								PreparedStatement ptst=con.prepareStatement("select * from jobs");
								ResultSet rs=ptst.executeQuery();
								
								while(rs.next()){
									id=rs.getString("id");
									jobprofile=rs.getString("jobprofile");
									company=rs.getString("company");
									experiance=rs.getString("experiance");
									salary=rs.getString("salary");
									description=rs.getString("description");
									skills=rs.getString("skills");
									
									%>
										<div class="col-md-12 job-display">
											<b><%=jobprofile %></b>
											<div><b>Company</b> :-<%=company %></div>
											<div><b>Salary</b> :-<%=salary %></div>
											<div><b>Skills</b> :-<%=skills %></div>
											<div><b>Description</b> :-<%=description %></div>
											<a href="jobs-desc.jsp?jid=<%=id%>">See Full Details</a>
										</div>
									<%
								}
							}catch(Exception e){
								e.printStackTrace();
							}
						%>
												
					</div>
				</div>
				
				<div class="col-md-2 jobs" style="list-style: none;">
				<h4>Categories</h4>
					<ul class="ull">
						<li class="lii">Remote</li>
						<li class="lii">MNC</li>
						<li class="lii">Marketing</li>
						<li class="lii">Supply Chain</li>
						<li class="lii">Banking</li>
						<li class="lii">Startup</li>
						<li class="lii">Analytics</li>
						<li class="lii">HR</li>
						<li class="lii">Sales</li>
						<li class="lii">Data Science</li>
						<li class="lii">Cyber Security</li>
						<li class="lii">Blockcahin</li>
						<li class="lii">Information</li>
					</ul>
				</div>
			</div>
			
				
			<jsp:include page="footer.jsp"></jsp:include>	
			
		</div>
		
	</body>
</html>