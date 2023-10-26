<%@page import="com.ayan.backend.jobportal.PathDetails"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.PreparedStatement" %>
   <%@page import="java.sql.ResultSet" %>
   <%@page import="java.io.File" %>
   
   
    <jsp:scriptlet>
    
    		String name=(String)session.getAttribute("session_name");
    		if(name==null||name.equals(""))
    		{
    			response.sendRedirect("login.jsp");
    		}
    		else
    		{
    			name=name.toUpperCase();
    		}
    		
    		
    		String email=(String)session.getAttribute("session_email");
    		String city=(String)session.getAttribute("session_city");
    		String gender=(String)session.getAttribute("session_gender");
    		String title=(String)session.getAttribute("session_title");
    		String skills=(String)session.getAttribute("session_skills");
    		String profilepic=(String)session.getAttribute("session_profilepic");
    		
    </jsp:scriptlet>
    
    <jsp:scriptlet>
    		
    		
    		
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
		
		<!-- ///////////////////////////////////////////  Profile Details starts///////////////////////////////////////// -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row profile_about_style ">
					<div class="col-md-2">
						<span><a href="updateProfilePic.jsp"><i class="fa fa-pencil" style="float:right;"></i></a></span>
						<img src="ProfilePictures/<jsp:expression>profilepic</jsp:expression>" width="100 px" style="border-radius:50px">
						
					</div>
					<div class="col-md-10">
						<h3><jsp:expression>name</jsp:expression><a href="editProfileAbout.jsp" style="font-size:80%; float:right;"><i class="fa fa-pencil"></i></a></h3>
						<span class="profile_about_header_style">Profile Title: </span><jsp:expression>title</jsp:expression><br><br>
						<span class="profile_about_header_style">Skills: </span><jsp:expression>skills</jsp:expression><br><br>
						<span class="profile_about_header_style">Gender: </span><jsp:expression>gender</jsp:expression><br><br>
						<span class="profile_about_header_style">City: </span><jsp:expression>city</jsp:expression>
					</div>
				</div><br><br>
				
				<!-- ///////////////////////////////////////////  Profile Details ends///////////////////////////////////////// -->
				
				<!-- ///////////////////////////////////////////  Education Details starts///////////////////////////////////////// -->
				<div class="row profile_about_style">
					<div class="col-md-12">
							<h5>Education Details<a href="addEducation.jsp" style="float:right; font-size:80%"><i class="fa fa-plus"></i></a></h5>
					</div>
					
					<jsp:declaration>
						String school="",degree="",year="",grade="",id="";
					</jsp:declaration>
					<jsp:scriptlet>
						
						Connection con=null;
						
						try
						{
							con=DbConnect.getConnect();
							
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
					</jsp:scriptlet>
					
						<div class="row " style="margin-bottom: 20px; ">
							<div class="col-md-2">
								<img src="images/collegePic.png" width="100px">
							</div>
							<div class="col-md-10 education_style">
									<i class="fa fa-university"></i>&nbsp<b><jsp:expression>school</jsp:expression></b><a href="editEducationDetails.jsp?id=<jsp:expression>id</jsp:expression>" style="float:right; font-size:100%; color:green;"><i class="fa fa-pencil"></i></a><br>
									<i class="fa fa-clock-o"></i>&nbsp<jsp:expression>year</jsp:expression><br>
									<i class="fa fa-graduation-cap"></i>&nbsp<jsp:expression>degree</jsp:expression><br>
									<i class="fa fa-file-text"></i>&nbsp<jsp:expression>grade</jsp:expression>%
							</div>
						</div>		
								<jsp:scriptlet>
										}
										
										
									}
						catch(Exception e)
						{
							out.println(e);
						}
						
						finally
						{
							try
							{
								con.close();
							}
							catch(Exception e)
							{
								out.println(e);
							}
						}
								</jsp:scriptlet>
						
					
				</div><br><br>
				
				<!-- ///////////////////////////////////////////  Education Details ends///////////////////////////////////////// -->
				
				<!-- ///////////////////////////////////////////  Experience Details starts///////////////////////////////////////// -->
				
				<div class="row profile_about_style">
					
					<div class="col-md-12">
						
							<h4>Experience Details<a href="addExperience.jsp" style="float:right; font-size:80%"><i class="fa fa-plus"></i></a></h4>
					</div>
					
					<jsp:declaration>
							String company1="",location1="",year1="",jobtitle1="",description1="",id1="";
					</jsp:declaration>
					
					<jsp:scriptlet>
						Connection con1=null;
						
						try
						{
							con1=DbConnect.getConnect();
							
							PreparedStatement ps=con1.prepareStatement("select * from experience where email=?");
							
							ps.setString(1,email);
							
							ResultSet rs1=ps.executeQuery();
							
							while(rs1.next())
							{
								id1=rs1.getString("id");
								company1=rs1.getString("company");
								location1=rs1.getString("location");
								year1=rs1.getString("year");
								jobtitle1=rs1.getString("jobtitle");
								description1=rs1.getString("description");
								
								
						</jsp:scriptlet>	
						
						
					<div class="row" style="margin-bottom:20px">
						<div class="col-md-2">
							<img src="images/workFieldPic.jpg" width="100px">
						</div>
						<div class="col-md-10 education_style">
							<b><i class="fa fa-industry"></i>&nbsp<jsp:expression>company1</jsp:expression></b><a href="editExperience.jsp?id=<jsp:expression>id1</jsp:expression>" style="float:right; font-size:100%; color:green;"><i class="fa fa-pencil"></i></a><br>
							<i class="fa fa-map-marker"></i>&nbsp<jsp:expression>location1</jsp:expression><br>
							<i class="fa fa-clock-o"></i>&nbsp<jsp:expression>year1</jsp:expression><br>
							<i class="fa fa-suitcase"></i>&nbsp<jsp:expression>jobtitle1</jsp:expression><br>
						</div>
					</div>
					
					
						<jsp:scriptlet>
							}
						}
						catch(Exception e)
						{
							
							out.println(e);
						}
						
						finally
						{
							try
							{
								con1.close();
							}
							catch(Exception e)
							{
								out.println(e);
							}
						}
					</jsp:scriptlet>
					
					
						
				</div><br><br>
				
				<!-- ///////////////////////////////////////Experience Details Ends////////////////////////////////////////// -->
				
				
				<!-- /////////////////////////////////////////Resume Details Starts/////////////////////////////////////////// -->
				
				<!-- ============================== Upload Resume and Download================================== -->
				<div class="row profile_about_style">
						<div class="col-md-12">
							<b>Resume Details</b>
							<div class="row">
								<div class="col-md-12" style="background-color:	rgb(255, 230, 255); margin-bottom:15px">
									<span><a href="updateResume.jsp"><i class="fa fa-plus"></i></a>Upload Resume</span>
									<jsp:scriptlet>
											try
											{
												Connection con2=DbConnect.getConnect();
												PreparedStatement ps=con2.prepareStatement("select * from resume where email=?");
												ps.setString(1,email);
												
												ResultSet rs=ps.executeQuery();
												
												if(rs.next())
												{
													String fn=rs.getString("file_name");
										</jsp:scriptlet>
											
												&nbsp&nbsp&nbsp&nbsp&nbsp<a href="DownloadResum?fn=<jsp:expression>fn</jsp:expression>" class="btn btn-success">Download Resume</a>
									<jsp:scriptlet>
												}
											}
											catch(Exception e)
											{
												e.printStackTrace();
											}
									</jsp:scriptlet>
								</div>
						<!-- ================================================================================================== -->
						
						
						<!-- ==========================================Create ResumeBuilder Pdf================================= -->			
								
									
									<div class="col-md-12" style="background-color:	rgb(255, 230, 255); margin-bottom:15px">
										<a href="resumeBuilder.jsp"><i class="fa fa-pencil"></i></a>ResumeBuilder
										
									<jsp:scriptlet>
									
										File file=new File(PathDetails.RESUME_BUILDER_PATH_UPLOAD+email+".pdf");
										String file_name=email+".pdf";
										if(file.exists())
										{
											</jsp:scriptlet>
											
											&nbsp&nbsp&nbsp<a href="DwnldResumeBuilder?fnrd=<jsp:expression>file_name</jsp:expression>" class="btn btn-success">Download Resume</a>		
											<jsp:scriptlet>
										}
									</jsp:scriptlet>
									
									</div>
							<!-- ====================================================================================================== -->
							</div>
						</div>
				</div>
				
				<!-- /////////////////////////////////////////Resume Details Ends/////////////////////////////////////////// -->
			
			</div>
			<div class="col-md-2"></div>
		</div>	
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>