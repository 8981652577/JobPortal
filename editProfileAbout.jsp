<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <jsp:scriptlet>
    
    	String name=(String)session.getAttribute("session_name");
    	String email=(String)session.getAttribute("session_email");
    	if (email==null || email.equals(""))
    	{
    		response.sendRedirect("login.jsp");
    	}
    	String gender=(String)session.getAttribute("session_gender");
    	String city=(String)session.getAttribute("session_city");
    	String title=(String)session.getAttribute("session_title");
    	String profilepic=(String)session.getAttribute("session_profilepic");
    	if(title==null || title.equals(""))
    	{
    		title="";
    	}
    	
    	String skills=(String)session.getAttribute("session_skills");
    	
    	if(skills==null || skills.equals(""))
    	{
    		skills="";
    	}
    	
    	
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



<script>
	function changeValue()
	{
		document.getElementById("changeGendertf").value=document.getElementById("changeGender").value;
		
		document.getElementById("changeCitytf").value=document.getElementById("changeCity").value;
	}
</script>
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
						<h3>Personal Details</h3><br>
						<jsp:expression>name</jsp:expression><b>(<jsp:expression>email</jsp:expression>)</b><br><br>
						<form  action="editAbout" method="post"  onchange="changeValue()">
							<input type="text" placeholder="enter name" value="<jsp:expression>name</jsp:expression>" class="textfield-design" name="name1"><br><br>
							<input type="text" placeholder="enter gender"  id="changeGendertf" value="<jsp:expression>gender</jsp:expression>" class="textfield-design" name="gender1" readonly="readonly">
							<select id="changeGender">
								<option disabled="disabled">SelectGender</option>
								<option>Male</option>
								<option>Female</option>
							</select>
							<br><br>
							<input type="text" placeholder="enter city" id="changeCitytf" value="<jsp:expression>city</jsp:expression>" class="textfield-design" name="city1" readonly="readonly">
							<select id="changeCity">
								<option disabled="disabled">Select City</option>
								<option>Kolkata</option>
								<option>Chennai</option>
								<option>Bangalore</option>
								<option>Punjab</option>
								<option>Gujrat</option>
							</select>
							<br><br>
							<input type="text" placeholder="enter profile title" value="<jsp:expression>title</jsp:expression>" class="textfield-design" name="title1"><br><br>
							<textarea placeholder="Skills" class="textarea-style" name="skills1"><jsp:expression>skills</jsp:expression></textarea><br><br>
							<input type="submit" value="Update" class="btn btn-danger">
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