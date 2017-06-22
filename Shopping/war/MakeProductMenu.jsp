<%@page import="java.util.List"%>
<%@page import="com.Shopping.Product"%>
<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Product> allProducts = (List<Product>) Resource.sql_select(Product.class.getName()).execute();
%>
<h4 style="color:white;">Product :</h4>
<p>
	<select id="disabledSelect" class="form-control" name="products"
		form="orderForm">
		<%
			for (Product p : allProducts) {
		%>
		<option value="<%=p.getId()%>">
			<%=p.getProductName() + "," + p.getProductPrice()%>
		</option>
		<%
			}
		%>
	</select>
</p>