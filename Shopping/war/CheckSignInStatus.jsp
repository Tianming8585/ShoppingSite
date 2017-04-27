<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (!Resource.isSignIn(request.getCookies())) {
		Resource.redirect(request, response, Resource.url_SignIn);
		return;
	}
	Resource.createSignOutButton(response.getWriter());
%>