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
<META HTTP-EQUIV="refresh" CONTENT="15; url=/Order.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order</title>
</head>
<body>
	<jsp:include page="AddHomeButton.jsp" />
	<jsp:include page="Cookie.jsp" />
	<jsp:include page="CheckSignInStatus.jsp" />
	<h2>Order</h2>
	<p></p>
	<form action="servlet" method="GET" id="orderForm">
		<jsp:include page="MakeProductMenu.jsp" />
		<h4>Amount :</h4>
		<input type="text" name="amount" /> <input type="hidden" name="url"
			value="Order.jsp" />
		<p>
			<input type="submit" name="btnValue" value="Order" />
	</form>
	<br>
	<jsp:include page="ShowUserOrders.jsp" />
</body>
</html>