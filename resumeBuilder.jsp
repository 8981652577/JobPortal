<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet"%>
    
    <jsp:scriptlet>
 			 String profilepic=(String)session.getAttribute("session_profilepic");  
 			 String name=(String)session.getAttribute("session_name");
 			if(name==null||name.equals(""))
    		{
    			response.sendRedirect("login.jsp");
    		}
 			 String email=(String)session.getAttribute("session_email");
 			 
    </jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row profile_about_style">
				<div class="col-md-2">
					<img src="ProfilePictures/<jsp:expression>profilepic</jsp:expression>" width="100px" style="border-radius:50px">
				</div>
				<div class="col-md-10">
						<h3>Resume Builder Details</h3><br>
						<form action="resumebuilder" method="post">
							<input type="text" placeholder="enter name" name="name1" value="<jsp:expression>name</jsp:expression>" class="textfield-design" readonly="readonly">&nbsp<a href="editProfileAbout.jsp"><i class="fa fa-pencil"></i></a><br><br>
							<input type="text" placeholder="enter email" name="email1" value="<jsp:expression>email</jsp:expression>" class="textfield-design" readonly="readonly"><br><br>
							<textarea name="address1" placeholder="Address" class="textarea-style"></textarea>
							<textarea name="career1" placeholder="career objectives" class="textarea-style"></textarea><br><br>
							<b>Education Details:-</b><br>
							<table class="table table-bordered table-hover">
								<tr>
									<th>school/college</th>
									<th>degree</th>
									<th>year</th>
									<th>marks</th>
									<th>board</th>
									<th></th>
								</tr>
							
							<jsp:scriptlet>
								String school="",degree="",year="",grade="",board="",id="";
								try
								{
									Connection con=DbConnect.getConnect();
									PreparedStatement ps=con.prepareStatement("select * from education where email=?");
									ps.setString(1,email);
									ResultSet rs=ps.executeQuery();
									while(rs.next())
									{
										id=rs.getString("id");
										school=rs.getString("school");
										degree=rs.getString("degree");
										year=rs.getString("year");
										grade=rs.getString("grade");
										board=rs.getString("board");
										
								</jsp:scriptlet>
								<tr>
									<td><jsp:expression>school</jsp:expression></td>
									<td><jsp:expression>degree</jsp:expression></td>
									<td><jsp:expression>year</jsp:expression></td>
									<td><jsp:expression>grade</jsp:expression></td>
									<td><jsp:expression>board</jsp:expression></td>
									<td><a href="editEducationDetails.jsp?id=<jsp:expression>id</jsp:expression>"><i class="fa fa-pencil"></i></a></td>
								</tr>
								
								<jsp:scriptlet>
									}
								}
								catch(Exception e)
								{
									e.printStackTrace();
								}
							</jsp:scriptlet>
							</table><br>
							
							<b>Experience Details:-</b><br>
							<table class="table table-bordered table-hover">
								<tr>
									<th>company</th>
									<th>location</th>
									<th>year</th>
									<th>jobtitle</th>
									<th>description</th>
									<th></th>
								</tr>
							<jsp:scriptlet>
								
								String company="",location="",yearr="",jobtitle="",description="",exid=""; 
								try
								{
									Connection con=DbConnect.getConnect();
									PreparedStatement ps=con.prepareStatement("select * from experience where email=?");
									ps.setString(1,email);
									
									ResultSet rs=ps.executeQuery();
									while(rs.next())
									{
										exid=rs.getString("id");
										company=rs.getString("company");
										location=rs.getString("location");
										yearr=rs.getString("year");
										jobtitle=rs.getString("jobtitle");
										description=rs.getString("description");
								</jsp:scriptlet>
										
								<tr>
									<td><jsp:expression>company</jsp:expression></td>
									<td><jsp:expression>location</jsp:expression></td>
									<td><jsp:expression>yearr</jsp:expression></td>
									<td><jsp:expression>jobtitle</jsp:expression></td>
									<td><jsp:expression>description</jsp:expression></td>
									<td><a href="editExperience.jsp?id=<jsp:expression>exid</jsp:expression>"><i class="fa fa-pencil"></i></a></td>
								</tr>	
								<jsp:scriptlet>		
									}
									
								}
								catch(Exception e)
								{
									e.printStackTrace();
								}
							
							</jsp:scriptlet>
							</table><br>
							<textarea placeholder="Hobbies" class="textarea-style" name="hobbies"></textarea><br><br>
							<b>Personal Information:-</b><br>
							<input type="date" class="textfield-design" name="date1"><br><br>
							<input type="text" class="textfield-design" placeholder="Gender/Marital Status" name="gendermarital1"><br><br>
							<input type="text" placeholder="Language Proficiency" name="language1" class="textfield-design"><br><br>
							<input type="submit" value="Resume Builder" class="btn btn-success">
						</form>
				</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>