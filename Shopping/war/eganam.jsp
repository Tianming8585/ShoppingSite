<%@ page import="com.Shopping.Resource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Page</title>
</head>
	<%
		if (!Resource.isAdmin(request.getCookies())) {
			Resource.redirect(response, Resource.url_AdminSignIn);
			return;
		}
	%>
<body>
	<a href="ShowOrdersQq.jsp" style="font-size: 100px; text-decoration: none" >manage orders</a>
	<p>
	<a href="ShowProductsQq.jsp" style="font-size: 100px; text-decoration: none">manage products</a>
</body>
</html>