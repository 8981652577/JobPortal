<%@page import="com.ayan.DbConnection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet"%>
    
    <jsp:declaration>
    	String company="",location="",year="",jobtitle="",description="";
    </jsp:declaration>
    <jsp:scriptlet>
    
    	String name=(String)session.getAttribute("session_name");
    	
    	String email=(String)session.getAttribute("session_email");
    	
    	String profilepic=(String)session.getAttribute("session_profilepic");
    	if(email==null||email.equals(""))
   		{
   			response.sendRedirect("login.jsp");
   		}
    	
    	String id=request.getParameter("id");
    	
    		Connection con=null;
    		
    		try
    		{
    			con=DbConnect.getConnect();
    			
    			PreparedStatement ps=con.prepareStatement("select * from experience where id=?");
    			
    			ps.setString(1,id);
    			
    			ResultSet rs=ps.executeQuery();
    			
    			while(rs.next())
    			{
    				company=rs.getString("company");
    				location=rs.getString("location");
    				year=rs.getString("year");
    				jobtitle=rs.getString("jobtitle");
    				description=rs.getString("description");
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
	function selectFunction(val)
	{
		if(val=="update")
		{
			document.updateDel.action="editExperience";
			document.updateDel.submit();
		}
		
		var v="are you sure you want to delete?"
				
		if(val=="delete" && confirm(v)==true)
		{
			document.updateDel.action="DeleteExperience";
			document.updateDel.submit();
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
								<h3>Edit Experience Details</h3><br><br>
								<jsp:expression>name</jsp:expression><b>(<jsp:expression>email</jsp:expression>)</b><br><br>
								<form name="updateDel" method="post">
									<input type="hidden" name="id2" value="<jsp:expression>id</jsp:expression>">
									<span>Company:<br></span><input type="text" placeholder="enter company name" class="textfield-design" value="<jsp:expression>company</jsp:expression>" name="company1"><br><br>
									<span>Location:<br></span><input type="text" placeholder="enter location"  class="textfield-design" value="<jsp:expression>location</jsp:expression>" name="location1"><br><br>
									<span>Year:<br></span><input type="text" placeholder="Eg.2000-2004"  class="textfield-design" value="<jsp:expression>year</jsp:expression>" name="year1"><br><br>
									<span>JobTitle:<br></span><input type="text" placeholder="enter what's your job role" class="textfield-design" value="<jsp:expression>jobtitle</jsp:expression>" name="jobtitle1"><br><br>
									<span>Description:<br></span><textarea placeholder="Job Describe" class="textarea-style" name="description1"><jsp:expression>description</jsp:expression></textarea><br><br>
									<input type="submit" value="Update Experience" class="btn btn-danger" onclick="selectFunction('update')">
									<input type="submit" value="Delete Experience" class="btn btn-danger" onclick="selectFunction('delete')">
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