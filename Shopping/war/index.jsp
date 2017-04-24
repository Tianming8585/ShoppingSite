<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.Resource"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Shopping</title>
</head>

<body>
	<jsp:include page="Cookie.jsp" />
	<jsp:include page="SetHomeButtons.jsp" />
	<p>
		<a href="Order.jsp">Order</a>
	</p>
	<p>
		<a href="ShowOrders.jsp">Show orders</a>
	</p>
	<p>
		<a href="ViewProducts.jsp">View all products</a>
	</p>
</body>
</html>
