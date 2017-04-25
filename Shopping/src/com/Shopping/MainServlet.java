package com.Shopping;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainServlet extends HttpServlet {

	private HttpServletRequest req;
	private HttpServletResponse resp;
	private PrintWriter out;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req = req;
		this.resp = resp;
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		out = resp.getWriter();
		String url = req.getParameter("url");
		System.out.println(url);
		if (url.equals(Resource.url_SignUp)) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			signUp(username, password);
			Resource.alert(out, Resource.message_SignUpSuccess);
			Resource.addCookie(resp, "username", username);
			Resource.redirectToHome(req, resp);
		} else if (url.equals(Resource.url_Order)) {
			String username = "";
			String amount = req.getParameter("amount");
			String productID = req.getParameter("products");
			System.out.println("get productID " + productID);
			username = Resource.getUsername(req.getCookies());
			if (username.equals("")) {
				Resource.redirect(req, resp, Resource.url_SignIn);
			} else if (!Resource.isNumeric(amount)) {
				System.out.println("is not N");
				Resource.print(out, "color:red", Resource.message_ErrorAmount);
				Resource.redirect(req, resp, Resource.url_Order);
				return;
			} else {
				order(username, productID, amount);
				Resource.alert(out, Resource.message_OrderSuccess);
				Resource.addCookie(resp, "username", username);
				Resource.redirect(req, resp, Resource.url_Order);
			}
		} else if (url.equals(Resource.url_SignOut)) {
			Resource.SignOut(resp, req.getCookies());
			Resource.redirectToHome(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req = req;
		this.resp = resp;
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		out = resp.getWriter();
		String url = req.getParameter("url");
		System.out.println(url);
		if (url.equals(Resource.url_SignIn)) {
			signIn(username, password);
			Resource.addCookie(resp, "username", username);
			Resource.redirectToHome(req, resp);
		} else if (url.equals(Resource.url_ShowOrders)) {
			System.out.println("Show orders");
			System.out.println("input : " + username + " , " + password);
			if (Resource.isMember(username, password)) {
				Resource.showOrders(out, username);
				Resource.createButton(out, Resource.url_Home, Resource.text_Home);
			} else {
				Resource.redirect(resp, Resource.url_ShowOrders);
				Resource.alert(out, Resource.message_SignInFail);
			}
		}
	}

	private void signUp(String username, String password) throws ServletException, IOException {
		System.out.println("Sign up");
		System.out.println("input " + username + " , " + password);
		Member member = new Member(username, password);
		Resource.updateData(member);
	}

	private boolean signIn(String username, String password) throws ServletException, IOException {
		System.out.println("Sign in");
		System.out.println(username + " , " + password);
		if (!Resource.isMember(username, password)) {
			Resource.print(out, "color:red", Resource.message_ErrorUsernameOrPassword);
			Resource.redirect(req, resp, Resource.url_SignIn);
			return false;
		}
		return true;
	}

	private void order(String username, String productID, String amount) throws ServletException, IOException {
		System.out.println("Order");
		System.out.println(amount + " , " + productID);
		Product product = Resource.getProductByID(Long.parseLong(productID));
		System.out.println(product.getProductName() + "," + product.getProductPrice());
		try {
			Resource.updateData((new Order(username, product.getProductName(), product.getProductPrice(), amount)));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
