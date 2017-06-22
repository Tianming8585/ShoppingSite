package com.Shopping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BackServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out=resp.getWriter();
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		if(Resource.isAdmin(username, password)){
			Resource.addCookie(resp, "username", username);
			Resource.addCookie(resp, "password", password);
			Resource.redirect(resp,Resource.url_AdminManage);
			return;
		}else{
			Resource.print(out, "color:red", Resource.message_ErrorUsernameOrPassword);
			Resource.redirect(resp, Resource.url_AdminSignIn);
			return;
		}
	}
}
