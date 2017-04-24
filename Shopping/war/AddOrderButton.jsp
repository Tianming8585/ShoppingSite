<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PrintWriter pw = response.getWriter();
	Resource.createTopButton(pw, Resource.url_Order, Resource.text_Order);
%>