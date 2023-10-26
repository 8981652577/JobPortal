<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="java.sql.Connection" %>
 <%@page import="java.sql.PreparedStatement" %>
 <%@page import="java.sql.ResultSet" %>
 
 <jsp:scriptlet>
 		String stu_email=(String)session.getAttribute("session_email");
 		String id=request.getParameter("jid");
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
						String job_profile="",company="",experience="",salary="",no_of_openings="",job_location="",time_venue="",description="",c_email="",c_person_name="",c_person_profile="",c_phone_no="",date1="",time1="";
						
						try
						{
							Connection con=DbConnect.getConnect();
							PreparedStatement ps=con.prepareStatement("select * from jobs where id=?");
							ps.setString(1,id);
							
							ResultSet rs=ps.executeQuery();
							if(rs.next())
							{
								job_profile=rs.getString("job_profile");
								company=rs.getString("company");
								experience=rs.getString("experience");
								salary=rs.getString("salary");
								no_of_openings=rs.getString("no_of_openings");
								job_location=rs.getString("job_location");
								time_venue=rs.getString("time_venue");
								description=rs.getString("description");
								c_email=rs.getString("c_email");
								c_person_name=rs.getString("c_person_name");
								c_person_profile=rs.getString("c_person_profile");
								c_phone_no=rs.getString("c_phone_no");
								date1=rs.getString("date1");
								time1=rs.getString("time1");
							}
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
					</jsp:scriptlet>
					
					<div class="row">
					<div class="col-md-12">
						<table class="table">
								<tr>
									<td></td>
									<td></td>
									<td><b><jsp:expression>job_profile</jsp:expression></b> <span style="float:right; font-size: small;"><jsp:expression>date1</jsp:expression>&nbsp&nbsp<jsp:expression>time1</jsp:expression></span></td>
								</tr>
								<tr>
									<td><i class="fa fa-industry"></i></td>
									<td>Company:</td>
									<td><jsp:expression>company</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-briefcase"></i></td>
									<td>Experience:</td>
									<td><jsp:expression>experience</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-address-card-o"></i></td>
									<td>Description:</td>
									<td><jsp:expression>description</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-inr"></i></td>
									<td>Salary:</td>
									<td><jsp:expression>salary</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-users"></i></td>
									<td>Vacancies:</td>
									<td><jsp:expression>no_of_openings</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-map-marker"></i></td>
									<td>Job Location:</td>
									<td><jsp:expression>job_location</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-paper-plane"></i></td>
									<td>Time</td>
									<td><jsp:expression>time_venue</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-envelope"></i></td>
									<td>HR Email:</td>
									<td><jsp:expression>c_email</jsp:expression></td>
								</tr>
								<tr>
									<td><i class="fa fa-user-circle"></i></td>
									<td>Name:</td>
									<td><jsp:expression>c_person_name</jsp:expression>(<jsp:expression>c_person_profile</jsp:expression>)</td>
								</tr>
								<tr>
									<td><i class="fa fa-phone"></i></td>
									<td>Phone No:</td>
									<td><jsp:expression>c_phone_no</jsp:expression></td>
								</tr>
						</table>
						
						<jsp:scriptlet>
						
						  if(stu_email==null || stu_email.equals(""))
						  {
							  </jsp:scriptlet>
							  
							  	<a href="login.jsp" class="btn btn-primary" style="float:right">Login To Apply</a>
							  <jsp:scriptlet>
						  }
						  else
						  {
							  try
							  {
								  Connection con=DbConnect.getConnect();
								  PreparedStatement ps=con.prepareStatement("select * from applied_jobs where email=? and job_id=?");
								  ps.setString(1,stu_email);
								  ps.setString(2,id);
								  
								  ResultSet rs=ps.executeQuery();
								  
								  if(rs.next())
								  {
									  </jsp:scriptlet>
									  
									  <strong style="color:red; float:right" >Already Applied</strong><br><br>
									  	<form action="DeleteApplied" method="post">
									  		<input type="hidden" value="<jsp:expression>id</jsp:expression>"name="job_id">
									  		<input type="submit" value="Delete Application" class="btn btn-danger" style="margin-left:200px">
									  	</form>
									  <jsp:scriptlet>
								  }
								  else
								  {
									  </jsp:scriptlet>
									  	<form action="jobApplied" method="post">
									  		<input type="hidden" name="jobid" value="<jsp:expression>id</jsp:expression>">
									  		<input type="submit"  value="Apply" class="btn btn-primary" style="float:right">
									  	</form>
									  <jsp:scriptlet>
								  }
							  }
							  catch(Exception e)
							  {
								  e.printStackTrace();
							  }
							 
						  }
						</jsp:scriptlet>
						
						
					</div>
					</div>
				</div>
				<div class="col-md-3">
					<ul>
						<li><a href="">Infosys</a></li>
						<li><a href="">Capgemini</a></li>
						<li><a href="">Cognizent</a></li>
						<li><a href="">TCS</a></li>
					</ul>
				</div>
			</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>