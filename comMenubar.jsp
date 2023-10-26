<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:scriptlet>
    	String com_email=(String)session.getAttribute("session_com_email");
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
					<li><a href="comIndex.jsp">Home</a></li>
					<li><a href="">About Us</a></li>
					<li><a href="">Contact Us</a></li>
				</ul>
			</div>
			<div class="col-md-5" id="mynavbar">
				<ul>
					<li><a href="">Search Jobs</a></li>
					<li><a href="">Companies</a></li>
				</ul>
			</div>
	</div>
</body>
</html>