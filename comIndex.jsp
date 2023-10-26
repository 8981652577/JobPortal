<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet" %>
    
    <jsp:scriptlet>
    	String com_email=(String)session.getAttribute("session_com_email");
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
</head>
<body>
	
	<div class="container-fluid">
		<jsp:scriptlet>
			
		if(com_email==null || com_email.equals(""))
		{
			</jsp:scriptlet>
			
			<jsp:include page="header.jsp"></jsp:include>
			
			<jsp:scriptlet>
		}
		else
		{
			</jsp:scriptlet>
			<jsp:include page="comHeader.jsp"></jsp:include>
			
			<jsp:scriptlet>
		}
		
		</jsp:scriptlet>
		
		<jsp:include page="comMenubar.jsp"></jsp:include>
		<div class="row">
			<img src="images/jobBackground.jpg" class="background-pic ">
		</div><br><br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 findJobBorder">
				<h3>Find a Job at India's No1 Job Site</h3><br>
				<input type="text" placeholder="Technology...." class="textfield-design">
				<input type="text" placeholder="Location..." class="textfield-design">
				<input type="submit" value="Search" class="btn btn-primary">
			</div>
			<div class="col-md-2"></div>
		</div><br><br>
		<div class="row">
			<div class="col-md-3">
				<ul>
					<li><a href="">Infosys</a></li>
					<li><a href="">Capgemini</a></li>
					<li><a href="">Cognizent</a></li>
					<li><a href="">TCS</a></li>
				</ul>
			</div>
			<div class="col-md-6 jobDescrip" >
			
			
			<jsp:scriptlet>
					String job_profile="",company="",experience="",salary="",location="",vacancies="",post="",id="";
					
					try
					{
						Connection con=DbConnect.getConnect();
						PreparedStatement ps=con.prepareStatement("select * from jobs");
						ResultSet rs=ps.executeQuery();
						
						while(rs.next())
						{
							id=rs.getString("id");
							job_profile=rs.getString("job_profile");
							company=rs.getString("company");
							experience=rs.getString("experience");
							salary=rs.getString("salary");
							location=rs.getString("job_location");
							vacancies=rs.getString("no_of_openings");
							post=rs.getString("time_venue");
							
						</jsp:scriptlet>
						<div class="row" style="border:2px solid black; border-radius:10px">
							<div class="col-md-12">
								<b><jsp:expression>job_profile</jsp:expression></b><span style="float:right"><jsp:expression>post</jsp:expression></span><br>
								<i class="fa fa-industry"></i><jsp:expression>company</jsp:expression><br>
								<i class="fa fa-briefcase"></i><jsp:expression>experience</jsp:expression><br>
								<i class="fa fa-inr"></i><jsp:expression>salary</jsp:expression><br>
								<i class="fa fa-map-marker"></i><jsp:expression>location</jsp:expression><br>
								<i class="fa fa-users"></i><jsp:expression>vacancies</jsp:expression>persons<br><br>
								<a href="comJobDescription.jsp?jid=<jsp:expression>id</jsp:expression>">See Full Details</a>
							</div>			
						</div><br><br>
						
						<jsp:scriptlet>
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
			</jsp:scriptlet>
				
			
				
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