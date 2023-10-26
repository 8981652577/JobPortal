<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:scriptlet>
	String email="";
	
	Cookie[] ck=request.getCookies();
	
	if(ck!=null)
	{
		for(Cookie cookie:ck)
		{
			if(cookie.getName().equals("cookie_email"))
			{
				email=cookie.getValue();
				</jsp:scriptlet>
				<form method="post" action="CheckCookie">
					<input type="text" name="cookiemail" value="<jsp:expression>email</jsp:expression>">
					<input type="submit">
				</form>
				<jsp:scriptlet>
				//System.out.println(email);
				
			}
		}
	}
	else
	{
		RequestDispatcher rd=request.getRequestDispatcher("GetUserData");
		rd.include(request, response);
	}
	</jsp:scriptlet>
</body>
</html>