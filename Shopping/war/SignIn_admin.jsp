<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="Link.jsp"/>
<style type="text/css">
body{
 background-image: url("https://proto-space.s3.amazonaws.com/uploads/captured_image/name/555/poelugybvlmlvgrhstnp.jpg");
  background-size: cover;                      
      background-repeat: no-repeat;
    color:white;'
}
</style>
<title>Admin sign in</title>
</head>
<body>

	
	
	<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-4 col-md-offset-4">
				<h3 class="dark-grey">Sign in</h3>
				<form action="kcab" method="POST">	
				<div class="form-group col-lg-12">
					<label>Username</label>
					<input type="text" name="username" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-12">
					<label>Password</label>
					<input type="password" name="password" class="form-control" id="" value="">
				</div>
				
		 <input type="hidden" name="url" value="SignIn.jsp" /> <button class="btn btn-primary" type="submit" name="btnValue" value="Sign in" >Sign In</button>
			</form>
			<br>
				<jsp:include page="AddHomeButton.jsp" />
			</div>
		
			
		</div>
	</section>
</div>
	
</body>
</html>