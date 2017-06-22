<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (!Resource.isAdmin(request.getCookies())) {
		Resource.redirect(response, Resource.url_AdminSignIn);
		return;
	}
	Resource.createSignOutButton(response.getWriter());
%>