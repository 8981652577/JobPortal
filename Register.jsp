<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="icon" href="images/jobPortalLogo.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="stylee.css">


<script>
	function val(v)
	{
		document.getElementById(v).innerHTML="";
	}
	
	function validation()
	{
		var flag=true;
		
		var name2=document.regform.name1.value;
		var email2=document.regform.email1.value;
		var password2=document.regform.pass1.value;
		var gender2=document.regform.gender1.value;
		var fields2=document.regform.field1.value;
		var city2=document.regform.city1.value;
		
		
		
		var name_pattern=/^[a-zA-Z ]{3,30}$/;
		
		var email_pattern=/^([a-zA-Z0-9])(([a-zA-Z0-9])*([\.])*([a-zA-Z0-9])*)@([a-z]*(\.)([a-z]){2,3})$/;
		
		var password_pattern=/^(?=.*[0-9])(?=.*[\!\#\$\@\%\^\*\&])([a-zA-Z0-9!@#$%^&*]{6,16})$/;
		
		
		if(!name2.match(name_pattern))
		{
			document.getElementById("name_error").innerHTML="Name is not properly write";
			flag=false;
		}
		
		if(name2==="")
		{
			document.getElementById("name_error").innerHTML="Name can not be empty";
			flag= false;
		}
		
		if(!email2.match(email_pattern))
		{
			document.getElementById("email_error").innerHTML="email is not properly write";
			flag= false;
		}
		if(email2==="")
		{
			document.getElementById("email_error").innerHTML="email cannot be empty";
			flag= false;
		}
		
		if(!password2.match(password_pattern))
		{
			document.getElementById("pass_error").innerHTML="you must use atleast 6 character with one special character and one number";
			flag= false;
		}	
		if(password2==="")
		{
			document.getElementById("pass_error").innerHTML="password cannot be empty";
			flag= false;
		}
		if(gender2==="")
		{
			document.getElementById("gender_error").innerHTML="gender cannot be empty";
			flag= false;
		}
		if(city2==="Select City")
		{
			document.getElementById("city_error").innerHTML="city cannot be empty";
			flag= false;
		}	
		return flag;
	}
	
</script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 register_div">
					<h3>Register Here</h3>
					<form method="post" name="regform" onsubmit="return validation()" action="reg">
						<input type="text" name="name1" placeholder="enter name" class="register_textfield" onkeyup="val('name_error')"><br><span id="name_error" style="color:red"></span><br><br>
						<input type="email" name="email1" placeholder="enter email" class="register_textfield" onkeyup="val('email_error')"><br><span id="email_error" style="color:red"></span><br><br>
						<input type="password" name="pass1" placeholder="enter password" class="register_textfield" onkeyup="val('pass_error')"><br><span id="pass_error" style="color:red"></span><br><br>
						<b>Select Gender:</b><input type="radio" name="gender1" value="male" onclick="val('gender_error')">Male<input type="radio" name="gender1" value="female" onclick="val('gender_error')">Female<br><span id="gender_error" style="color:red"></span><br><br>
						<b>Select Fields:</b><input type="checkbox" name="field1" value="Information Technology">Information Technology<input type="checkbox" name="field1" value="Marketing">Marketing<input type="checkbox" name="field1" value="finance">Finance<br><br>
						<select class="register_textfield " name="city1" onclick="val('city_error')">
							<option>Select City</option>
							<option>Kolkata</option>
							<option>Chennai</option>
							<option>Bangalore</option>
							<option>Punjab</option>
							<option>Gujrat</option>
						</select><br><span id="city_error" style="color:red"></span><br><br>
						<input type="submit" value="register" class="btn btn-primary">
					</form>
			</div>
			<div class="col-md-3"></div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>