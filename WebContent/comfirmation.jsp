<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />


<title></title>

<!-- Bootstrap core CSS -->
<link href="toy/css/bootstrap.min.css" rel="stylesheet" />

<link href="toy/css/non-responsive.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="toy/css/style.css" rel="stylesheet" />


<!-- data table -->
<link href="toy/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="toy/css/dataTables.bootstrap.min.css" rel="stylesheet" />

<link href="toy/css/font-awesome.min.css" rel="stylesheet" />

<link
	href="https://fonts.googleapis.com/css?family=Akronim|Black+Ops+One"
	rel="stylesheet">


</head>

<body style="color: #474646">

	<div class="container">
		<div>
			<div class="page-top"
				style="width: 100%; height: 20px; background-color: #ffffff00;"></div>

			<!-- Static navbar -->
			<nav class="navbar navbar-default"
				style="background-color: #fafafa00; border-color: #fcfcfc00; z-index: 1;">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp"
							style="font-size: 40px; font-family: 'Akronim', cursive; color: #9e35ff">ToyZenG</a>
					</div>
					<%@ page import="javax.servlet.http.HttpSession"%>

					<%
						HttpSession cursession = request.getSession(true);
						Integer curId = (Integer) cursession.getAttribute("KeyId");
					%>
					<div id="navbar">
						<ul class="nav navbar-nav navbar-right"
							style="font-family: 'Black Ops One', cursive;">
							<li><a href="/learning" style="color: #ffffff" class="naitem">GO TO
									HOME PAGE</a></li>
							<li><a href="shoppingCart" style="color: #ffffff" class="naitem">SHOPPING
									CART</a></li>
							<% if(curId == null){ %>
							<li><a href="login.jsp" style="color: #ffffff" class="naitem">SIGN IN</a></li>
							<% }else{ %>
							<li><a href="signout" style="color: #ffffff" class="naitem">SIGN OUT</a></li>
							<% } %>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid -->
			</nav>
		</div>
		<div class="row" style="margin-top: -200px; z-index: 0">
			<div class="col-xs-12">
				<img src="images/eva-unit-01.png" class="img-responsive" />
			</div>
		</div>
	</div>



	<div class="container">
		<div class="row" style="margin-top: 10px;">
			<div class="col-xs-12">
				<div class="alert alert-success">
					<h3>
						<i class="fa fa-check" aria-hidden="true"
							style="color: limegreen;"></i> Thank you, your order has been
						placed.
					</h3>
					<h4 style="margin-left: 35px">
						The estimated delivery date is <span>${deliver}</span>
					</h4>
				</div>
				
				
				<div class="row" style="margin-top: 10px;">
				<div class="col-xs-6 text-left">
					<h1
					style="margin-top: 30px; margin-left: 20px; font-size: 40px; font-family: 'Akronim', cursive; color: #9e35ff">List
					of Items</h1>
				</div>
				<div class="col-xs-6 text-right">
					<a href = "toy";
					style="margin-top: 40px; margin-left: 20px; font-size: 50px; font-family: 'Akronim', cursive; color: #9e35ff;text-decoration:none">Keep Shopping</a>
				</div>
				</div>

				<div style="margin-top: 50px">
					<c:forEach items="${cartItem}" var="cartItem">
						<div class="row" style="margin-top: 20px">


							<div class="col-xs-2">

								<a href="toyDetail?id=${cartItem.toy.id}"> <img
									style="width: 130px;"
									class="img-responsive center-block"
									src="${cartItem.toy.imageUrl}" />
								</a>
							</div>
							<div class="col-xs-6">
								<div style="margin-left: 50px;">
									<a href="toyDetail?id=${cartItem.toy.id}">
										<h4>${cartItem.toy.productName}</h4>
									</a>
									<p>By ${cartItem.toy.category}</p>
									<p>FREE Shipping by ToyZenG</p>
								</div>
							</div>

							<div class="col-xs-2">
								<h5 style="color: #db3208; font-size: large; margin-left: 20px"
									id="priceid">$ ${cartItem.toy.ourPrice}</h5>
							</div>
							<div class="col-xs-2">
								<h4>x ${cartItem.qty}</h4>
							</div>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>
	</div>
	<!-- end of container -->
	<div>
		<script src="toy/js/jquery.min.js"></script>
		<script src="toy/js/bootstrap.min.js"></script>

		
		
		
		

	</div>
	<script>
		
		</script>

</body>