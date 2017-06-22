<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.Resource"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PrintWriter pw = response.getWriter();
	Cookie ck[] = request.getCookies();
	String IDList = Resource.getOrderList(ck);
	String amountList = Resource.getAmountList(ck);
	Resource.showOrders(pw, IDList, amountList);
%>
<form action="servlet" method="GET" id="orderSubmitForm">
	<input type="hidden" name="url" value="Order_submit" />
	<p>
		<button type="submit" class="btn btn-primary value=" name="btnValue"
			value="Order">Order</button>
</form>
