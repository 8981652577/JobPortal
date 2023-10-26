<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:scriptlet>
 	String com_email=(String)session.getAttribute("session_com_email");
	String stu_email=(String)session.getAttribute("session_email");
    </jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="icon" href="images/jobPortalLogo.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="stylee.css">
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		
		<jsp:scriptlet>
		
		if(stu_email==null||stu_email.equals(""))
		{
			</jsp:scriptlet>
				<jsp:include page="menubar.jsp"></jsp:include>
			<jsp:scriptlet>
		}
		else
		{
			</jsp:scriptlet>
			<jsp:include page="menubar.jsp"></jsp:include>
		<jsp:scriptlet>
		}
		</jsp:scriptlet>
		
		
		<jsp:include page="logindiv.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>