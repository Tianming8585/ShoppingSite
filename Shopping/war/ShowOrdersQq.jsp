<%@page import="com.Shopping.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.Shopping.Product"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show orders</title>
<jsp:include page="Link.jsp" />
<style type="text/css">
body {
	background-image: url("http://i.imgur.com/uz78Z4i.jpg");
	background-filter: blur(5px);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	padding: 5px;
}

a {
	color: #FFFFF0;
}
</style>
</head>
<body>
	<%
		if (!Resource.isAdmin(request.getCookies())) {
			Resource.redirect(response, Resource.url_AdminSignIn);
			return;
		}
		PrintWriter pw = response.getWriter();
		List<Order> allOrders = (List<Order>) Resource.sql_select_desc(Order.class.getName(), "date").execute();
		if (allOrders.size() == 0) {
	%>
	<p style="color: white;"><%=Resource.message_NoOrder%></p>
	<%
		return;
		}
	%>
	<h3 style="color: white;">Manage orders</h3>
	<table class="table table-bordered"
		style="color: white; border: 3px #000000 solid; padding: 5px; width: 100%;"
		rules="all">
		<tr>
			<th>Username</th>
			<th>Date</th>
			<th>Product Name</th>
			<th>Product Price</th>
			<th>Amount</th>
			<th>Total</th>
			<th>Action</th>
		</tr>
		<%
			for (int i = 0; i < allOrders.size(); i++) {
				int orderTotal = 0;
				List<Long> orderList = allOrders.get(i).getOrderList();
				List<Integer> amountList = allOrders.get(i).getAmount();
				int orderListSize = orderList.size();
				boolean isFirst = true;
				for (int j = 0; j < orderListSize; j++) {
					Product p = (Product) Resource.getProductByID(orderList.get(j));
					int price = Integer.parseInt(p.getProductPrice());
					int amount = amountList.get(j);
					int productOrder = price * amount;
		%>
		<tr>
			<%
				if (isFirst) {
			%>
			<td rowspan=" <%=orderListSize%>"><%=allOrders.get(i).getUsername()%></td>
			<td rowspan=" <%=orderListSize%>"><%=allOrders.get(i).getDate()%></td>
			<%
				}
			%>
			<td><%=p.getProductName()%></td>
			<td><%=price%></td>
			<td align="center"><%=amount%></td>
			<td align="center"><%=productOrder%></td>
			<%
				if (isFirst) {
			%>
			<td rowspan=" <%=(orderListSize + 1)%>">
			<a class="btn btn-primary" href="OrderModifyQq.jsp?orderId=<%=allOrders.get(i).getId()%>">Modify</a>
				<a class="btn btn-primary" href="OrderDeleteQq.jsp?orderId=<%=allOrders.get(i).getId()%>">Delete</a>
				<%
					isFirst = false;
							}
				%>
		</tr>
		<%
			orderTotal += productOrder;
				}
		%>
		<tr>
			<td colspan="5">總共</td>
			<td align="center"><%=orderTotal%></td>
		</tr>
		<%
			}
		%>
	</table>

	<jsp:include page="AddManageHomeButton.jsp"></jsp:include>
</body>
</html>