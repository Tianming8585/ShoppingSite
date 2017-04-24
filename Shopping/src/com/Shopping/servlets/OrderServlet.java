package com.Shopping.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Shopping.Order;
import com.Shopping.PMF;
import com.Shopping.Product;
import com.Shopping.Resource;

public class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String amount = req.getParameter("amount");
		String productID = req.getParameter("products");
		System.out.println(username + " , " + amount + " , " + productID);
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = new PrintWriter(resp.getWriter());
		req.setCharacterEncoding("UTF-8");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Product product = pm.getObjectById(Product.class, Long.parseLong(productID));
		System.out.println(product.getProductName() + "," + product.getProductPrice());

		try {
			Resource.updateData((new Order(username, product.getProductName(), product.getProductPrice(), amount)));
			Resource.alert(out, Resource.message_OrderSuccess);
			out.println("<p>");
			out.println("You choose"+ product.getProductName() + ",  amount : " + product.getProductPrice());
			out.println("</p>");
			Resource.createButton(out, Resource.url_Order, Resource.text_Order);
			Resource.createButton(out, Resource.url_ShowOrders,Resource.text_ShowOrders);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
