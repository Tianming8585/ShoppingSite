<%@page import="com.Shopping.PMF"%>
<%@page import="com.Shopping.Resource"%>
<%@page import="java.util.List"%>
<%@page import="com.Shopping.Product"%>
<%@page import="javax.jdo.Query"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Link.jsp" />
<style type="text/css">
body {
	background-image:
		url("https://proto-space.s3.amazonaws.com/uploads/captured_image/name/555/poelugybvlmlvgrhstnp.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	color: white;
	'
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show all products</title>
</head>
<body>
	<jsp:include page="AddHomeButton.jsp" />
	<jsp:include page="Cookie.jsp" />
	<jsp:include page="AddOrderButton.jsp" />
	<jsp:include page="ShowProducts.jsp" />
</body>
</html>