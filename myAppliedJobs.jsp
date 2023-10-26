<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    
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
</head>
<body>
	
	<div class="container-fluid">
		<jsp:include page="profileLogin.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		<div class="row">
			<div class="col-md-3">
				<ul>
					<li><a href="">Infosys</a></li>
					<li><a href="">Capgemini</a></li>
					<li><a href="">Cognizent</a></li>
					<li><a href="">TCS</a></li>
				</ul>
			</div>
			<div class="col-md-6 jobDescrip">
				<h3>My Applied Jobs</h3><br>
			<jsp:declaration>
				String job_profile="",company="",experience="",salary="",job_location="",no_of_openings="",date1="",time1="";
			</jsp:declaration>
			
				<jsp:scriptlet>
					
						try
						{
							Connection con=DbConnect.getConnect();
							PreparedStatement ps=con.prepareStatement("select * from applied_jobs where email=?");
							ps.setString(1,stu_email);
							
							ResultSet rs=ps.executeQuery();
							
							while(rs.next())
							{
								String job_id=rs.getString("job_id");
								String applied_date=rs.getString("date1");
								String applied_time=rs.getString("time1");
								
								PreparedStatement ps2=con.prepareStatement("select * from jobs where id=?");
								
								ps2.setString(1,job_id);
								
								ResultSet rs2=ps2.executeQuery();
								
								while(rs2.next())
								{
									job_profile=rs2.getString("job_profile");
									company=rs2.getString("company");
									experience=rs2.getString("experience");
									salary=rs2.getString("salary");
									job_location=rs2.getString("job_location");
									no_of_openings=rs2.getString("no_of_openings");
									
									
									</jsp:scriptlet>
										
										<div class="row" style="border:2px solid black; border-radius:10px">
											<div class="col-md-12">	
												<b><jsp:expression>job_profile</jsp:expression></b><span style="float:right">Applied time:<jsp:expression>applied_date</jsp:expression>(<jsp:expression>applied_time</jsp:expression>)</span><br>
												<i class="fa fa-industry"></i><jsp:expression>company</jsp:expression><br>
												<i class="fa fa-briefcase"></i><jsp:expression>experience</jsp:expression><br>
												<i class="fa fa-inr"></i><jsp:expression>salary</jsp:expression><br>
												<i class="fa fa-map-marker"></i><jsp:expression>job_location</jsp:expression><br>
												<i class="fa fa-users"></i><jsp:expression>no_of_openings</jsp:expression><br>
												<a href="jobdescription.jsp?jid=<jsp:expression>job_id</jsp:expression>">See Full Details</a>
											</div>
										</div><br><br>	
									<jsp:scriptlet>
								}
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