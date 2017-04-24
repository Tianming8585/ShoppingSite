<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
</head>
<body>
	<jsp:include page="AddHomeButton.jsp" />
	<h2>Sign in</h2>
	<form action="servlet" method="POST">
		<h4>Username :</h4>
		<input type="text" name="username" />
		<h4>Passowrd :</h4>
		<input type="password" name="password" /> <br> <br> <input
			type="hidden" name="url" value="SignIn.jsp" /> <input type="submit"
			name="btnValue" value="Sign in" />
	</form>
</body>
</html>