<%@page import="com.Shopping.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="com.Shopping.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Manage products</title>	
<jsp:include page="Link.jsp" />
<style type="text/css">
body {
	background-image: url("http://i.imgur.com/uz78Z4i.jpg");
	background-filter: blur(5px);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	color:white;
	padding: 5px;
}
</style>
<jsp:include page="AddManageHomeButton.jsp"></jsp:include>
<body>
<%
	if (!Resource.isAdmin(request.getCookies())) {
		Resource.redirect(response, Resource.url_AdminSignIn);
		return;
	}
	List<Product> allProducts = (List<Product>) Resource.sql_select(Product.class.getName()).execute();
%>
<h2>Manage products</h2>
<a class="btn btn-primary" href="<%=Resource.url_AddProduct%>">add products</a>
<table class="table table-bordered"
	style="border: 3px #000000 solid; padding: 5px; width: 100%;"
	rules="all">
	<tr>
		<th>Product Name</th>
		<th>Product Price</th>
		<th>Action</th>
	</tr>
	<%
		for (Product product : allProducts) {
	%>
	<tr>
		<td><%=product.getProductName()%></td>
		<td align="center"><%=product.getProductPrice()%></td>
		<td><a class="btn btn-primary" href="ProductModifyQq.jsp?productId=<%=product.getId()%>">Modify</a>
			<a class="btn btn-primary" href="ProductDeleteQq.jsp?productId=<%=product.getId()%>">Delete</a>
	</tr>
	<%
		}
	%>
</table>
</body>