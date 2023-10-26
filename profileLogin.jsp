<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
     <jsp:scriptlet>
    
    		String name=(String)session.getAttribute("session_name");
    		String profilepic=(String)session.getAttribute("session_profilepic");
    </jsp:scriptlet>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row header-bg">
			<div class="col-md-5">
					<img src="images/jobPortalLogo.jpg" height=50px>
					<span class="logo-text-design">JobPortal</span>
			</div>
			<div class="col-md-5">
					<h3><img src="ProfilePictures/<jsp:expression>profilepic</jsp:expression>" width="40px" style="margin-right:10px;border-radius:20px"><a href="profile.jsp" style="text-decoration:none;"><jsp:expression>name</jsp:expression></a></h3>
			</div>
			<div class="col-md-2">
					<a href="logout" class="hyperlink-design">Logout</a>
			</div>
	</div>
</body>
</html>