<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet" %>
   
   <jsp:scriptlet>
   		String name=(String)session.getAttribute("session_name");
   		String email=(String)session.getAttribute("session_email");
   		
   		if(email==null||email.equals(""))
   		{
   			response.sendRedirect("login.jsp");
   		}
   		String profilepic=(String)session.getAttribute("session_profilepic");
   		
   </jsp:scriptlet>
   
   <jsp:declaration>
  		String school="",degree="",year="",grade="",description="",id="",board=""; 
   </jsp:declaration>
    <jsp:scriptlet>
    
    	id=request.getParameter("id");
    	
    	Connection con=null;
    	try
    	{
    		con=DbConnect.getConnect();
    		
    		PreparedStatement ps=con.prepareStatement("select * from education where id=?");
    		
    		ps.setString(1,id);
    		
    		ResultSet rs=ps.executeQuery();
    		
    		while(rs.next())
    		{
    			school=rs.getString("school");
    			degree=rs.getString("degree");
    			year=rs.getString("year");
    			grade=rs.getString("grade");
    			description=rs.getString("description");
    			board=rs.getString("board");
    		}
    		
    	}
    	catch(Exception e)
		{
			
			out.println(e);
		}
		
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				out.println(e);
			}
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
	function submitFunction(val)
	{
		if(val=="update")
		{
			document.updel.action="editEducation";
			document.updel.submit();
		}
		var v="are you sure you want to delete?";
		
		if(val=="delete" && confirm(v)==true)
		{
			document.updel.action="deleteEducation";
			document.updel.submit();
		}
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
						<h3>Edit Education Details</h3>
						<form name="updel" method="post">
							<input type="hidden" name="id" value="<jsp:expression>id</jsp:expression>"><br>
							<jsp:expression>name</jsp:expression><b>(<jsp:expression>email</jsp:expression>)</b><br><br>
							<span>School/College:</span><br><input type="text" placeholder="enter school or college name" name="school1" class="textfield-design" value="<jsp:expression>school</jsp:expression>"><br><br>
							<span>Degree:</span><br><input type="text" placeholder="enter degree" name="degree1" class="textfield-design" value="<jsp:expression>degree</jsp:expression>"><br><br>
							<span>Year:</span><br><input type="text" placeholder="2000-2004" name="year1" class="textfield-design"  value="<jsp:expression>year</jsp:expression>"><br><br>
							<span>Grade:</span><br><input type="number" placeholder="Eg:90" name="grade1" class="textfield-design"  value="<jsp:expression>grade</jsp:expression>"><br><br>
							<span>Board/University</span><br><input type="text" placeholder="enter board/university name" name="board1" class="textfield-design" value="<jsp:expression>board</jsp:expression>"><br><br>
							<span>Description:</span><br><textarea placeholder="Achievement" class="textarea-style" name="description1"><jsp:expression>description</jsp:expression></textarea><br><br>
							<input type="submit" value="Update Education" class="btn btn-danger" onclick="submitFunction('update')">
							<input type="submit" value="Delete Education" class="btn btn-danger" onclick="submitFunction('delete')">
							
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