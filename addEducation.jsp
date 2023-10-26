<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <jsp:scriptlet>
    
		String email=(String)session.getAttribute("session_email");
		if(email==null||email.equals(""))
   		{
   			response.sendRedirect("login.jsp");
   		}
    	String name=(String)session.getAttribute("session_name");
    	
    	String profilepic=(String)session.getAttribute("session_profilepic");
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
				<div class="row profile_about_style ">
					<div class="col-md-2">
						<img src="ProfilePictures/<jsp:expression>profilepic</jsp:expression>" width="100px" style="border-radius:50px">
					</div>
					<div class="col-md-10">
						<h3>Add Education Details</h3><br>
						<jsp:expression> name</jsp:expression><b>(<jsp:expression>email</jsp:expression>)</b><br><br>
						<form action="addEducation" method="post">
							<span>School:</span><br><input type="text" placeholder="enter school name" class="textfield-design" name="school1"><br><br>
							<span>Degree:</span><br><input type="text" class="textfield-design" placeholder="Eg. B.tech,Masters,phd" name="degree1"><br><br>
							<span>Year:</span><br><input type="text" placeholder="Eg:2000-2004" class="textfield-design" name="year1"><br><br>
							<span>Grade:</span><br><input type="number" placeholder="Eg:90" class="textfield-design" name="grade1">%<br><br>
							<span>Board/University</span><br><input type="text" placeholder="enter board name" class="textfield-design" name="board1"><br><br>
							<span>Description:</span><br><textarea placeholder="Activity,Participates" class="textarea-style" name="description1"></textarea><br><br>
							<input type="submit" value="Add Education" class="btn btn-danger"> 
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