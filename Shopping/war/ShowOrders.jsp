<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show orders</title>
<jsp:include page="Link.jsp" />
<style type="text/css">
body {
	background-image:
		url("https://proto-space.s3.amazonaws.com/uploads/captured_image/name/555/poelugybvlmlvgrhstnp.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	color: white;
	padding: 5px;
}
</style>
</head>
<body>
	<%
		if (!Resource.isSignIn(request.getCookies())) {
			Resource.redirect(response, Resource.url_SignIn);
			return;
		}
	%>
	<jsp:include page="Cookie.jsp" />
	<jsp:include page="AddOrderButton.jsp" />
	<jsp:include page="ShowUserOrders.jsp" />
	<jsp:include page="AddHomeButton.jsp" />
</body>
</html>