<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:scriptlet>
 			String email=(String)session.getAttribute("session_email");
 			if (email==null || email.equals(""))
 	    	{
 	    		response.sendRedirect("login.jsp");
 	    	}
 			String name=(String)session.getAttribute("session_name");
 			String picture=(String)session.getAttribute("session_profilepic");
    </jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="images/jobPortalLogo.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
							<img src="ProfilePictures/<jsp:expression>picture</jsp:expression>" width="100px" style="border-radius:50px">
						</div>
						<div class="col-md-10">
							<h3>Update Resume</h3>
							<b><jsp:expression>name</jsp:expression></b>(<jsp:expression>email</jsp:expression>)<br><br>
							<form action="uploadResume" method="post" enctype="multipart/form-data">
								<input type="file" name="uploadRes"><br><br>
								<input type="submit" value="Upload Resume" class="btn btn-danger">
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