<%@page import="java.io.PrintWriter"%>
<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PrintWriter pw = response.getWriter();
	Cookie ck[] = request.getCookies();
	if (!Resource.isSignIn(ck)) {
		Resource.createButton(pw, Resource.url_SignUp, Resource.text_SignUp);
		Resource.printSpaces(pw, 6);
		Resource.createButton(pw, Resource.url_SignIn, Resource.text_SignIn);
	} else {
		Resource.createSignOutButton(pw);
	}
%>