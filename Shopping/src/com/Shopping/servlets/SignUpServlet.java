package com.Shopping.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Shopping.Member;
import com.Shopping.PMF;
import com.Shopping.Resource;


public class SignUpServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username + " , " + password);
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		Member member = new Member(username, password);
		try {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			pm.makePersistent(member);
			Resource.alert(out,Resource.message_SignUpSuccess);
			Resource.redirectToHome(req,resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
