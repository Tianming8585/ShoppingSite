<%@page import="java.io.PrintWriter"%>
<%@page import="com.Shopping.Resource"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<jsp:include page="Link.jsp" />
<title>Shopping</title>
<style type="text/css">
body {
	background-image:
		url("https://proto-space.s3.amazonaws.com/uploads/captured_image/name/555/poelugybvlmlvgrhstnp.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.div_right_bottom {
	width: 25px;
	float: right;
	position: fixed;
	right: 0px;
	bottom: 0px;
}

.centerdiv {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
}

.imges {
	position: absolute;
	right: 1px;
	top: 50%;
	width: 500px;
	max-width: 600px;
}

img {
	max-width: 100%;
	max-height: 100%;
	opacity: 0.4;
}

.title {
	display: block;
	text-align: center;
	font-size: 1000%;
	color: white;
	margin: 0px auto;
}

.titlediv {
	position: relative;
	top: 50%;
	transform: translateY(-70%);
	margin: 0px auto;
	width: 90%;
}

.contenerssd {
	position: relative;
	width: 100%;
	height: 100%
}
</style>
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">天價屋</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li><a href="Order.jsp">Order</a></li>
				<li><a href="ShowOrders.jsp">Show orders</a></li>
				<li><a href="ViewProducts.jsp">View all products</a></li>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<jsp:include page="Cookie.jsp" />

	<div class="contenerssd">
		<div class="imges">
			<img src='http://static.gigabyte.com/Product/2/5498/13177_big.png'>
		</div>
		<div class="titlediv">
			<h1 class="title">天價屋</h1>
		</div>

		<div class="centerdiv">
			<jsp:include page="SetHomeButtons.jsp" />
		</div>

	</div>
</body>
</html>
