<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.Resource"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PrintWriter pw = response.getWriter();
	String username = Resource.getUsername(request.getCookies());
	Resource.showOrders(pw, username);
%>
