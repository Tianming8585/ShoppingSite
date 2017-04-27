<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Link.jsp" />
<style type="text/css">
body {
	background-image:
		url("https://proto-space.s3.amazonaws.com/uploads/captured_image/name/555/poelugybvlmlvgrhstnp.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	color: white;
	'
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up</title>
</head>
<body>

	<div class="container-fluid">
		<section class="container">
		<div class="container-page">
			<div class="col-md-6">
				<h3 class="dark-grey">Registration</h3>
				<form action="servlet" method="GET">
					<div class="form-group col-lg-12">
						<label>Username</label> <input type="text" name="username"
							class="form-control" id="" value="">
					</div>

					<div class="form-group col-lg-12">
						<label>Password</label> <input type="password" name="password"
							class="form-control" id="" value="">
					</div>

					<input type="hidden" name="url" value="SignUp.jsp" />
					<button type="submit" class="btn btn-primary value="Signup" >Sign
						up</button>
				</form>
				<br>
				<jsp:include page="AddHomeButton.jsp" />
			</div>

			<div class="col-md-6">
				<h3 class="dark-grey">歡迎來到天價屋</h3>
				<p>By clicking on "Register" you agree to The Company's' Terms
					and Conditions</p>
				<p>While rare, prices are subject to change based on exchange
					rate fluctuations - should such a fluctuation happen, we may
					request an additional payment. You have the option to request a
					full refund or to pay the new price. (Paragraph 13.5.8)</p>
				<p>Should there be an error in the description or pricing of a
					product, we will provide you with a full refund (Paragraph 13.5.6)
				</p>
				<p>Acceptance of an order by us is dependent on our suppliers
					ability to provide the product. (Paragraph 13.5.6)</p>


			</div>
		</div>
		</section>
	</div>

</body>
</html>