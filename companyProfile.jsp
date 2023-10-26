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
					<div class="col-md-12">
						<h3>Add Companies<a href="addCompanies.jsp"><i class="fa fa-plus" style="float:right"></i></a></h3>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	
	</div>
</body>
</html>