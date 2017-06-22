package com.Shopping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
		if (url.equals(Resource.url_SignUp)) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			signUp(username, password);
			Resource.alert(out, Resource.message_SignUpSuccess);
			Resource.addCookie(resp, "username", username);
			Resource.addCookie(resp, "password", password);
			Resource.redirectToHome(resp);
		} else if (url.equals(Resource.url_AddProduct)) {
			String productName = req.getParameter("productName");
			String productPrice = req.getParameter("productPrice");
			addProduct(productName,productPrice);
		} else if (url.equals(Resource.url_Order)) {
			String username = "";
			String amount = req.getParameter("amount");
			String productID = req.getParameter("products");
			username = Resource.getUsername(req.getCookies());
			if (username.equals("")) {
				Resource.redirect(resp, Resource.url_SignIn);
			} else if (!Resource.isNumeric(amount)) {
				Resource.print(out, "color:red", Resource.message_ErrorAmount);
				Resource.redirect(resp, Resource.url_Order);
				return;
			} else {
				String IDListCK = Resource.getOrderList(req.getCookies());
				String amountListCK = Resource.getAmountList(req.getCookies());
				System.out.println("add product id " + productID);
				System.out.println("add product amount " + amount);
				System.out.println("cookie id list " + IDListCK);
				System.out.println("cookie amount list " + amountListCK);
				Resource.alert(out, Resource.message_OrderSuccess);
				if (!IDListCK.isEmpty()) {
					IDListCK += "_";
					amountListCK += "_";
				}
				Resource.addCookie(resp, "username", username);
				Resource.addCookie(resp, "orderList", IDListCK + productID);
				Resource.addCookie(resp, "amountList", amountListCK + amount);
				// Resource.redirect(req, resp, Resource.url_Order);
				Resource.redirect(resp, Resource.url_Order);
			}
		} else if (url.equals(Resource.url_Order_submit)) {
			String username = "";
			String IDListCK[] = Resource.getOrderList(req.getCookies()).split("_");
			String amountListCK[] = Resource.getAmountList(req.getCookies()).split("_");
			List<Long> productIDList = new ArrayList<Long>();
			List<Integer> amountList = new ArrayList<Integer>();
			for (int i = 0; i < IDListCK.length; i++) {
				if (IDListCK[i].isEmpty())
					break;
				productIDList.add(Long.parseLong(IDListCK[i].trim()));
				amountList.add(Integer.parseInt(amountListCK[i].trim()));
			}
			username = Resource.getUsername(req.getCookies());
			order(username, productIDList, amountList);
			Resource.clearOrder(req, resp);
			Resource.redirect(resp, Resource.url_ShowOrders);
		} else if (url.equals(Resource.url_SignOut)) {
			Resource.signOut(req, resp);
			Resource.redirectToHome(resp);
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
		if (url.equals(Resource.url_SignIn)) {
			signIn(username, password);
			Resource.addCookie(resp, "username", username);
			Resource.addCookie(resp, "password", password);
			Resource.redirectToHome(resp);
		} else if (url.equals(Resource.url_ShowOrders)) {
			if (Resource.isMember(username, password)) {
				Resource.showOrders(out, username);
				Resource.createButton(out, Resource.url_Home, Resource.text_Home);
			} else {
				Resource.redirect(resp, Resource.url_ShowOrders);
				Resource.alert(out, Resource.message_SignInFail);
			}
		} else if (url.equals(Resource.url_AdminModifyOrder)) {
			String orderID = req.getParameter("orderId");
			String orderStringList[] = req.getParameterValues("products");
			String amountStringList[] = req.getParameterValues("amount");
			System.out.println("amount length:" +amountStringList.length);
			System.out.println("product: "+req.getParameterValues("products"));
			int orderListSize = orderStringList.length;
			List<Long> orderLongList = new ArrayList<Long>();
			List<Integer> amountIntegerList = new ArrayList<Integer>();
			for (int i = 0; i < orderListSize; i++) {
				orderLongList.add(Long.parseLong(orderStringList[i]));
				amountIntegerList.add(Integer.parseInt(amountStringList[i]));
			}
			orderModify(Long.parseLong(orderID), username, orderLongList, amountIntegerList);
		} else if (url.equals(Resource.url_AdminModifyProduct)) {
			String productID = req.getParameter("productId");
			String productName = req.getParameter("productName");
			String price = req.getParameter("price");
			productModify(Long.parseLong(productID), productName, price);
		}
	}

	private void signUp(String username, String password) throws ServletException, IOException {
		Member member = new Member(username, password);
		Resource.insertData(member);
	}

	private boolean signIn(String username, String password) throws ServletException, IOException {
		if (!Resource.isMember(username, password)) {
			Resource.print(out, "color:red", Resource.message_ErrorUsernameOrPassword);
			Resource.redirect(resp, Resource.url_SignIn);
			return false;
		}
		return true;
	}

	// private void order(String username, String productID, String amount)
	// throws ServletException, IOException {
	// Product product = Resource.getProductByID(Long.parseLong(productID));
	// try {
	// Resource.insertData((new Order1(username, product.getProductName(),
	// product.getProductPrice(), amount)));
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	private void order(String username, List<Long> productID, List<Integer> amount)
			throws ServletException, IOException {
		// Product product = Resource.getProductByID(Long.parseLong(productID));
		try {
			Resource.insertData((new Order(username, productID, amount)));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void addProduct(String productName,String productPrice){
		System.out.println(productName + " , " + productPrice);
		Product product = new Product(productName, productPrice);
		try {
			Resource.insertData(product);
			Resource.alert(out, Resource.message_AddProductSuccess);
			Resource.redirect(resp,Resource.url_AdminShowProducts);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void orderModify(Long orderID, String username, List<Long> orderList, List<Integer> amountList)
			throws ServletException, IOException {
		Order order = Resource.getOrderByID(orderID);
		order.setUsername(username);
		order.setOrderList(orderList);
		order.setAmount(amountList);
		Resource.insertData(order);
		Resource.redirect(resp, Resource.url_AdminShowOrders);
	}

	private void productModify(Long productID, String productName, String price) throws ServletException, IOException {
		Product product = Resource.getProductByID(productID);
		product.setProductName(productName);
		product.setProductPrice(price);
		Resource.insertData(product);
		Resource.redirect(resp, Resource.url_AdminShowProducts);
	}
}
