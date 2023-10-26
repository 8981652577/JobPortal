<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function whichUser()
	{
		var flag=true;
		var confirm=document.confirmuser.clickuser.value;
		if(confirm=="")
		{
			alert("Please let me know Who Are You?");
			return flag=false;
		}
		
	}
</script>
</head>
<body>

		<div  class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6  register_div">
				<h3>Login</h3>
				<form method="post" name="confirmuser" onsubmit="return whichUser()" action="login" >
					<input type="radio" value="company" name="which" id="clickuser">Company<input type="radio" value="user" name="which" id="clickuser">Student<br><br>
					<input type="email" placeholder="enter email" name="email3" class="register_textfield "><br><br>
					<input type="password" placeholder="enter password" name="pass3" class="register_textfield "><br><br>
					<input type="checkbox" name="remem" value="remember1">Remember Me<br><br>
					<input type="submit" value="login" class="btn btn-primary">
					
				</form> 
			</div>
			<div class="col-md-3"></div>
		</div>

</body>
</html>