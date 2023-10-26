<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:scriptlet>
    	String stu_email=(String)session.getAttribute("session_email");
    </jsp:scriptlet>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="row menubar-bg">
			<div class="col-md-7" id="mynavbar">
				<ul>
					<li><a href="Index.jsp">Home</a></li>
					<li><a href="simpleJobsSearch.jsp">Search Jobs</a></li>
					<li><a href="">Companies</a></li>
					<jsp:scriptlet>
						
						if(stu_email==null || stu_email.equals(""))
						{
							
						}
						else
						{
							</jsp:scriptlet>
							<li><a href="myAppliedJobs.jsp">My Applied Jobs</a></li>
							<jsp:scriptlet>
						}
						
					
					</jsp:scriptlet>
				</ul>
			</div>
			<div class="col-md-5" id="mynavbar">
				<ul>
					<li><a href="">About Us</a></li>
					<li><a href="">Contact Us</a></li>
				</ul>
			</div>
	</div>
</body>
</html>