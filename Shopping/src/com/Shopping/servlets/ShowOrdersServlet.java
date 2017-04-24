package com.Shopping.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Shopping.Member;
import com.Shopping.Order;
import com.Shopping.Resource;

public class ShowOrdersServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		Boolean isMember = false;
		System.out.println("input : " + username + " , " + password);
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		// Member member =
		// pm.getObjectById(Member.class,Long.parseLong("5271333621465088"));
		// out.println("<p>");
		// out.println(member.username +","+member.password);
		// out.println("</p>");

		Query memberQuery = Resource.sql_select(Member.class.getName());
		List<Member> allMembers = (List<Member>) memberQuery.execute();
		System.out.println(username + "," + password);
		for (Member m : allMembers) {
			String mUsername = m.getUsername();
			String mPassword = m.getPassword();
			// out.println("<p>");
			// out.println(mUsername + "," + mPassword);
			// out.println("</p>");
			System.out.println("DB : " + mUsername + "," + mPassword);
			if (username.equals(mUsername) && password.equals(mPassword)) {
				Resource.alert(out, Resource.message_SignInSuccess);
				isMember = true;
				break;
			}
		}
		if (isMember) {
			Query orderQuery = Resource.sql_select(Order.class.getName(), "username", username);

			List<Order> allOrders = (List<Order>) orderQuery.execute();
			if (allOrders.size() == 0) {
				out.println("<p>" + Resource.message_NoOrder + "</P>");
			}
			for (Order o : allOrders) {
				out.println("<p>");
				out.println(o.getProductName() + "," + o.getProductPrice() + ",   amount : " + o.getAmount());
				out.println("</p>");
				System.out.println(o.getProductName() + "," + o.getProductPrice() + "," + o.getAmount());

			}
			Resource.createButton(out, Resource.url_Home, Resource.text_Home);
		} else {
			resp.sendRedirect("ShowOrders.jsp");
			Resource.alert(out, Resource.message_SignInFail);
		}
	}

}
