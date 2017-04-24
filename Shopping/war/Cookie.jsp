<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.Resource"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PrintWriter pw = response.getWriter();
	Cookie ck[] = request.getCookies();
	Resource.print(pw, ck);
%>