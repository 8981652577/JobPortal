<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<jsp:include page="comProfileHeader.jsp"></jsp:include>
		<jsp:include page="comMenubar.jsp"></jsp:include>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row profile_about_style">
				<div class="col-md-3">
					<img src="images/CompanyPngPic.png" width="200">
				</div>
					<div class="col-md-9">
						<h3>Add Companies Details</h3>
						
						<form action="addCompany" method="post">
							<input type="text" name="jobprofile" placeholder="Enter Job Profile" class="textfield-design"><br><br>
							<input type="text" name="c_name" placeholder="enter company name" class="textfield-design"><br><br>
							<textarea name="experience" placeholder="enter experience"  class="textarea-style"></textarea><br><br>
							<input type="text" name="salary" placeholder="enter salary package" class="textfield-design"><br><br>
							<input type="number" name="seat" placeholder="Enter no of openings" class="textfield-design"><br><br>
							<input type="text" placeholder="enter job location" name="location" class="textfield-design"><br><br>
							<input type="text" placeholder="enter time venue" name="time" class="textfield-design"><br><br>
							<textarea name="desc" placeholder="description"  class="textarea-style"></textarea><br><br>
							<input type="email" placeholder="enter Contact Person email" name="c_email" class="textfield-design"><br><br>
							<input type="text" placeholder="enter Contact person name" name="c_person_name" class="textfield-design"><br><br>
							<input type="text" placeholder="enter Contact person profile" name="c_person_profile" class="textfield-design"><br><br>
							<input type="number" placeholder="enter Contact person mobile no" name="phone" class="textfield-design"><br><br>
							<input type="text" name="date1" placeholder="enter date " class="textfield-design"><br><br>
							<input type="text" name="time1" placeholder="enter which time" class="textfield-design"><br><br>  
							<input type="submit" value="Add Company" class="btn btn-danger">
						</form>
						</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	
	</div>
</body>
</html>