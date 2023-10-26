<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet" %>
    
    <jsp:scriptlet>
    	String stu_email=(String)session.getAttribute("session_email");
    </jsp:scriptlet>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Portal</title>
<link rel="icon" href="images/jobPortalLogo.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="stylee.css">


<script>

      
      function technology(tech)
      {
      	var xhttp=new XMLHttpRequest();
      	
      	xhttp.onreadystatechange=function(){
      		
      		if(this.readystate==4 || this.status==200)
      		{
      			//alert("456");
      			
      			document.getElementById("demo").innerHTML=this.responseText
      		}
      	}
      	
      	xhttp.open("Post","JobsSearchByTechnology?company="+tech,true);
      	
      	xhttp.send();
      }
		
      
      function searchLocation(area)
      {
    	  //alert(area);
    	  
    	  var xhttp=new XMLHttpRequest();
    	  
    	  xhttp.onreadystatechange=function(){
    		  if(this.readystate==4 || this.status==200)
    			{
    			  	
    			  	document.getElementById("demo").innerHTML=this.responseText;
    			}
    	  }
    	  xhttp.open("Post","JobsSearchByLocation?local="+area,true);
    	  
    	  xhttp.send();
      }
</script>
</head>
<body>
	<div class="container-fluid">
		<jsp:scriptlet>
			if(stu_email==null||stu_email.equals(""))
			{
				</jsp:scriptlet>
				
				<jsp:include page="header.jsp"></jsp:include>
				
				<jsp:scriptlet>
			}
			else
			{
				</jsp:scriptlet>
					<jsp:include page="profileLogin.jsp"></jsp:include>
				<jsp:scriptlet>
			}
		</jsp:scriptlet>
	
		<jsp:include page="menubar.jsp"></jsp:include>
			<div class="row">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8 findJobBorder">
						<h3>Find A Job At India's No-1 Site</h3><br>
						<input type="text"  placeholder="search by Technologies" class="textfield-design" onkeyup="technology(this.value)"><br>
						OR<br>
						<input type="text" placeholder="search by location.." class="textfield-design" onkeyup="searchLocation(this.value)"><br>
						
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="col-md-3">
					<ul>
					<li><a href="">Infosys</a></li>
					<li><a href="">Capgemini</a></li>
					<li><a href="">Cognizent</a></li>
					<li><a href="">TCS</a></li>
				</ul>
				</div>
				<div class="col-md-6 jobDescrip">
					<div class="row">
					<div class="col-md-12">
						<span id="demo" ></span>
					</div>	
					</div>
				</div>
				<div class="col-md-3">
					<ul>
					<li><a href="">Google</a></li>
					<li><a href="">Microsoft</a></li>
					<li><a href="">Uber</a></li>
					<li><a href="">Amazon</a></li>
				</ul>
				</div>
			</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>