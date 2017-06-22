<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.PMF"%>
<%@page import="com.Shopping.Product"%>
<%@page import="com.Shopping.Resource"%>
<%@page import="java.util.List"%>
<%@page import="javax.jdo.Query"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<jsp:include page="Link.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order</title>
</head>
<body>
	<%
		if (!Resource.isSignIn(request.getCookies())) {
			Resource.redirect(response, Resource.url_SignIn);
			return;
		}
	%>
	<jsp:include page="Cookie.jsp" />
	<h2 style="color: white;">Order</h2>
	<p></p>
	<form action="servlet" method="GET" id="orderForm">
		<jsp:include page="MakeProductMenu.jsp" />
		<h4 style="color: white;">Amount :</h4>
		<input type="text" class="form-control" name="amount" /> <input
			type="hidden" name="url" value="Order.jsp" />
		<p>
			<button type="submit" class="btn btn-primary value=" name="btnValue"
				value="Order">Add</button>
	</form>
	<br>
	<jsp:include page="ShowCurrentOrder.jsp" />
	<jsp:include page="AddHomeButton.jsp" />
</body>
</html>