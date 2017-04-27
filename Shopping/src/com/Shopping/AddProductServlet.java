package com.Shopping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddProductServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		// Resource.addAllProduct();
		String productName = req.getParameter("productName");
		String productPrice = req.getParameter("productPrice");
		System.out.println(productName + " , " + productPrice);
		PrintWriter out = resp.getWriter();
		Product product = new Product(productName, productPrice);
		try {
			Resource.insertData(product);
			Resource.alert(out, Resource.message_AddProductSuccess);
			Resource.redirectToHome(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
