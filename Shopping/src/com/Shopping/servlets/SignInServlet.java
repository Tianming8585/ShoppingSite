package com.Shopping.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Shopping.Resource;

public class SignInServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username + " , " + password);
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		if (Resource.isMember(username, password)) {
			Resource.alert(out, Resource.message_SignInSuccess);
//			Resource.jumpToHome(out);
			out.println("qq");
			out.println("<SCRIPT LANGUAGE='JavaScript'>");
			out.println("<!--");
			out.println("window.location.href('" + Resource.url_Home + "')");
			out.println("//-->");
			out.println("</SCRIPT>");
		} else {
			out.print("<p style=\"color:red\">" + Resource.message_ErrorUsernameOrPassword + "</p>");
			RequestDispatcher rd = req.getRequestDispatcher("SignIn.jsp");
			rd.include(req, resp);
		}
	}

}
