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