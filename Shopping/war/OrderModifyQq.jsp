<%@page import="java.util.List"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.Shopping.*"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify order</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/style.css" />
</head>
<body>
	<%
		if (!Resource.isAdmin(request.getCookies())) {
			Resource.redirect(response, Resource.url_AdminSignIn);
			return;
		}
		String orderId = request.getParameter("orderId");
		Order order = Resource.getOrderByID(Long.parseLong(orderId));
		List<Long> orderList = order.getOrderList();
		List<Integer> amountList = order.getAmount();
		int orderSize = orderList.size();
	%>
	<form action="servlet" method="post" id="modifyOrderForm">
		<div>
			Username: <input type="text" name="username" id="username"
				value="<%=order.getUsername()%>" /> <BR />
			<%
				for (int i = 0; i < orderSize; i++) {
					List<Product> allProducts = (List<Product>) Resource.sql_select(Product.class.getName()).execute();
			%>

			<p>
				<label for="productName">ProductName</label> <select
					id="disabledSelect" class="form-control" name="products"
					form="modifyOrderForm">
					<%
						for (Product p : allProducts) {
								Long PID = p.getId();
					%>
					<option value="<%=PID%>" <%if (PID.equals(orderList.get(i))) {%>
						selected="selected" <%}%>><%=p.getProductName() + "," + p.getProductPrice()%></option>
					<%
						}
					%>
				</select>
			</p>

			Amount: <input type="text" name="amount" id="amount"
				value="<%=amountList.get(i)%>" />
			<%
				}
			%>
			<p>
				<input type="submit" value="Update order" /> <input type="hidden"
					name="url" value="OrderModifyQq.jsp" /> <input type="hidden"
					name="orderId" id="orderId" value="<%=order.getId()%>">
		</div>
	</form>

</body>
</html>