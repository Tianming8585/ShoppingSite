<%@page import="java.util.List"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.Shopping.*"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify product</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/style.css" />
</head>
<body>
	<%
	if (!Resource.isAdmin(request.getCookies())) {
		Resource.redirect(response, Resource.url_AdminSignIn);
		return;
	}
		String productID = request.getParameter("productId");
		Product product = Resource.getProductByID(Long.parseLong(productID));
	%>
	<form action="servlet" method="post">
		<div>
			<label for="productName">ProductName</label> <input type="text"
				name="productName" id="productName"
				value="<%=product.getProductName()%>" /> <Br /> <BR /> Price: <input
				type="text" name="price" id="price"
				value="<%=product.getProductPrice()%>" /> <BR /> <input
				type="hidden" name="url" value="ProductModifyQq.jsp" /><input
				type="submit" value="Update product" /> <input type="hidden"
				name="productId" id="productId" value="<%=product.getId()%>">
		</div>
	</form>

</body>
</html>