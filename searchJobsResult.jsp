<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    
    <jsp:scriptlet>
    		String stu_email=(String)session.getAttribute("session_email");
    		String job_tech=request.getParameter("tech1");
    		String job_loca=request.getParameter("local1");
    		
    </jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Job Portal</title>
<link rel="icon" href="images/jobPortalLogo.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="stylee.css">
</head>
<body>
	<div class="container-fluid">
		<jsp:scriptlet>
			if(stu_email==null || stu_email.equals(""))
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
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12 findJobBorder">
							<h3>Find a Job at India's No1 Job Site</h3><br>
							<form action="searchJobsResult.jsp" method="post">
								<input type="text" name="tech1" placeholder="Technology...." class="textfield-design">
								<input type="text" name="local1" placeholder="Location..." class="textfield-design">
								<input type="submit" value="search" class="btn btn-primary">
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
				
				<div class="col-md-3">
					<ul>
						<li><a href="">Infosys</a></li>
						<li><a href="">Capgemini</a></li>
						<li><a href="">Cognizent</a></li>
						<li><a href="">TCS</a></li>
					</ul>
				</div>
				<div class="col-md-6 jobDescrip">
					<jsp:scriptlet>
						String job_profile="",company="",experience="",salary="",location="",vacancies="",date1="",id="";
						
						Connection con=null;
						try
						{
							con=DbConnect.getConnect();
							PreparedStatement ps=con.prepareStatement("select * from jobs where job_profile Like '%"+job_tech+"%' AND job_location Like '%"+job_loca+"%'");
							
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
								date1=rs.getString("date1");
								
								
								</jsp:scriptlet>
								<div class="row">
									<div class="col-md-12" style="border:2px solid black; border-radius:10px">
										<b><jsp:expression>job_profile</jsp:expression></b><span style="float:right"><jsp:expression>date1</jsp:expression></span><br>
										<i class="fa fa-industry"></i><jsp:expression>company</jsp:expression><br>
										<i class="fa fa-briefcase"></i><jsp:expression>experience</jsp:expression><br>
										<i class="fa fa-inr"></i><jsp:expression>salary</jsp:expression><br>
										<i class="fa fa-map-marker"></i><jsp:expression>location</jsp:expression><br>
										<i class="fa fa-users"></i><jsp:expression>vacancies</jsp:expression>persons<br><br>
										<a href="jobdescription.jsp?jid=<jsp:expression>id</jsp:expression>">See Full Details</a>
									</div>			
								</div><br><br>
						<jsp:scriptlet>
							}
						}
						catch(Exception e)
						{
							e.printStackTrace();
							
						}
						finally
						{
							try
							{
								con.close();
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}
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