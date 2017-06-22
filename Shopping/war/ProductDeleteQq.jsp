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
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/style.css" />
</head>
<body>
	<%
		String productID = request.getParameter("productId");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Product product = Resource.getProductByID(pm, Long.parseLong(productID));
		try {
			pm.deletePersistent(product);
		} catch (Exception e) {

		} finally {
			pm.close();
		}
		response.sendRedirect("ShowProductsQq.jsp");
	%>

</body>
</html>