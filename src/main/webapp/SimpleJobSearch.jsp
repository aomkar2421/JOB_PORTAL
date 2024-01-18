<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	String email=(String) session.getAttribute("semail");
    %>
    <%
		if(email==null || email=="" || email.equals("")){
		%> <jsp:include page="header.jsp"></jsp:include> <%	
		}else{
		%> <jsp:include page="profileheader.jsp"></jsp:include> <%	
		}
	%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="icon" href="images/ao.png">
		<title>Job Portal</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/index.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		
		<script type="text/javascript">
		
			//1.Create XMLHttpRequest object
			function val(tech) {
				var obj;
				if (new window.XMLHttpRequest()) {
					obj = new XMLHttpRequest();
				}				
				else{
					obj = new ActiveXObject("Microsoft.XMLHTTP")
				}
				
			//2.specify reqquest
			obj.open("POST", "SimpleJobSearch?technology="+tech, true)
				
			//3.Sends request to server
			obj.send()
				
			//4.Calls the function onreadystatechange()
			obj.onreadystatechange = function () {
				if (obj.readystate === 4 && obj.status === 200) {
					alert("1")
					document.getElementById("responseGenerated").innerHtml=obj.responseText;
				}
			};
				
				 
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="menubar.jsp"></jsp:include>
			<div class="row">
				<div class="col-md-2"></div>	
				
				<div class="col-md-8" style="text-align: center;box-shadow: 0 0 3px #F00, 0 0 5px #00F;margin-top: 20px;">
					<h3>Search Jobs</h3>
					<input type="text" placeholder="Enter Technology" class="tf-design" onkeyup="val(this.value)">
					<input type="text" placeholder="Enter Location" class="tf-design">
				</div>	
				
				<div class="col-md-2"></div>			
			</div>	
			
			<div class="row">
				<div class="col-md-3 jobs" style="list-style: none;"></div>
				
				<div class="col-md-6" style="background-color: #f9f8f9; margin-top: 10px">
                        <div class="row">
                            <div class="col-md-12">
                                <span id="respgenerated"> No Result Found </span>
                            </div>
                        </div>
                    </div>
				
				<div class="col-md-3" style="list-style: none;"></div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>	
		</div>
	</body>
</html>