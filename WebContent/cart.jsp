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
					
				</div>
				
			</nav>
		</div>
		<div class="row" style="margin-top: -200px; z-index: 0">
			<div class="col-xs-12">
				<img src="images/eva-unit-01.png" class="img-responsive" />
			</div>
		</div>
	</div>

<% String notEnough = (String)request.getAttribute("notEnough");
	String empty = (String)request.getAttribute("emptyCart");
%>


	<div class="container">
		<div class="row" style="margin-top: 10px;">
			<div class="col-xs-12">
				<div class="row">

					<br />
					
					
					<% if(notEnough != null){%>  
                    <div class="alert alert-warning">
                        Oops, some of the products don't have enough stock. Please update product quantity.</div>
                        
                        
                        <% }%> 
                     
                    <div id = "empty">   
                     <% if(empty != null){%>
                    <div class="alert alert-warning">Oops, your cart is empty. See if you can find what you like in the toyList and add them to cart.</div>
					<% } %>
					</div>
					
					
					<br /> <br />
					<div class="row">
						<div class="col-xs-8 ">
							<h4 style="margin-left: 70px;font-family: 'Black Ops One', cursive;">Products</h4>
						</div>
						<div class="col-xs-2" style="font-family: 'Black Ops One', cursive;">
							<h4>Price</h4>
						</div>
						<div class="col-xs-2" style="font-family: 'Black Ops One', cursive;">
							<h4>Qty</h4>
						</div>
					</div>
					<input type="hidden" value="${size}" id="cartsize">
					<!--**************** display products in cart ****************-->
					<c:forEach items="${cartItem}" var="cartItem">
					<div>
						<div class="row" id="r${cartItem.id}">

							<hr />
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
									<c:set var="stock" scope="session"
										value="${cartItem.toy.stickNumber}" />
									<c:if test="${stock > 10}">
										<p style="color: green;">In Stock</p>
									</c:if>
									<c:if test="${stock <= 10}">
										<p style="color: green;">
											Only <span>${cartItem.toy.stickNumber}</span> In Stock
										</p>
									</c:if>
									<c:if test="${stock == 0}">
										<p style="color: darkred;">Product Unavailable</p>
									</c:if>
									<button href="" id="d${cartItem.id}" class="delete">delete</button>
								</div>
							</div>

							<div class="col-xs-2">
								<h5 style="color: #db3208; font-size: large;">
									$ ${cartItem.toy.ourPrice}</h5>
							</div>

							<div class="col-xs-2" style="margin-top: 10px">
								<input type="number" class="qtychange" id="${cartItem.id}"
									value="${cartItem.qty}" min=1
									max="${cartItem.toy.stickNumber}">
							</div>

						</div>
						</div>
					</c:forEach>

					<div class="row">
						<hr />
						<h4 class="col-xs-12 text-right">
							<strong style="font-size: large;">Total Price (<span
								id="numberid">${totalqty}</span> items):
							</strong> <span style="color: #db3208; font-szie: large;">$ <span
								id="subtotal">${totalPrice}</span>
							</span>
						</h4>

					</div>

					<div class="row" style="margin-top: 40px">
						<div class="col-xs-6 text-left">
							<a class="btn btn-warning" href="toy">Continue Shopping </a>
						</div>
						<div class="col-xs-6 text-right">
							<a class="btn btn-primary" href="checkout">Check Out</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of container -->
	<div>
		<script src="toy/js/jquery.min.js"></script>
		<script src="toy/js/bootstrap.min.js"></script>

		

		<script>
			$(".qtychange").each(function(index) {
				$(this).on('change', function() {
					var qty = $(this).val();
					var id = $(this).attr('id');
					console.log(qty);
					console.log(id);
					$.ajax({
			             type:'POST',
			             data: {
			                 qty : qty,
			                 Cartid : id,  
			                 action: 'update'
			             },
			             url:'updatecart',
			             success : function(resp){
			          		var arr = resp.split(',');
			          		var totalqty = arr[0];
			          		var subtotal = arr[1];
			          		$('#numberid').text(totalqty);
			          		$('#subtotal').text(subtotal);
			             }
			         });
				});
			})
			
			$(".delete").each(function(index) {
				$(this).on('click', function() {
					
					var id = $(this).attr('id').substring(1);
					$.ajax({
						type:'POST',
						data: {
							Cartid : id,
							action: 'delete'
						},
						url:'updatecart',
			             success : function(resp){
			          		var arr = resp.split(',');
			          		var totalqty = arr[0];
			          		var subtotal = arr[1];
			          		var row = 'r'+id;
			          		$('#'+row).remove();
			          		$('#numberid').text(totalqty);
			          		$('#subtotal').text(subtotal);
			             }
			         });
				});
			})
			

		</script>


	</div>

</body>

</html>