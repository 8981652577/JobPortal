<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:scriptlet>
    	
    	String name=(String)session.getAttribute("session_name");
    	String email=(String)session.getAttribute("session_email");
    	
    	if(email==null||email.equals(""))
   		{
   			response.sendRedirect("login.jsp");
   		}
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
							<h3>Add Experience Details</h3><br><br>
							<jsp:expression>name</jsp:expression><b>(<jsp:expression>email</jsp:expression>)</b><br><br>
							<form action="addExp" method="post">
								<span>Company:<br></span><input type="text" placeholder="enter company name" name="company1" class="textfield-design"><br><br>
								<span>Location:<br></span><input type="text" placeholder="enter location" name="location1" class="textfield-design"><br><br>
								<span>Year:<br></span><input type="text" placeholder="Eg:2000-2004" name="year1" class="textfield-design"><br><br>
								<span>JobTitle:<br></span><input type="text" placeholder="Job roles" name="jobtitle1" class="textfield-design"><br><br>
								<span>Description:<br></span><textarea placeholder="describe your position what you know?" name="description1" class="textarea-style"></textarea><br><br>
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