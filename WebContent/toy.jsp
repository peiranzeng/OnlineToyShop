<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="toy/js/scripts.js"></script>

</head>

<body>

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



	<div class="container">
		<div class="row" style="margin-top: 60px;">
			<div class="col-xs-3">
				<h4>
					<label for="category"
						style="color: rgb(143, 135, 135); margin-top: 25px; font-size: 40px; font-family: 'Akronim', cursive; color: #9e35ff">HotBrand</label>
				</h4>
				<div class="list-group" id="categroy">
					<a class="list-group-item" id="All" style="color:white; background-color:#9e35ff">All</a> <a
						 class="list-group-item" id="Bandai">Bandai</a> <a
						 class="list-group-item" id="Kaiyodo">Kaiyodo</a> <a
						 class="list-group-item" id="CYRAN">CYRAN</a> <a
						 class="list-group-item" id="Medicos">Medicos</a> <a
						 class="list-group-item" id="Sega">Sega</a>
				</div>
			</div>
			<div class="col-xs-9">
			
				<div>
					<h5 style="color: #ffffff">-</h5>
				</div>

<div id = "table">
				<table border="0" id="toyList" style="color: #423f3f">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${toys}" var="toy">
							<tr>
								<td>
									<div>
										<div class="row" style="margin-bottom: 50px;">
											<div class="col-xs-3">
												<a href="toyDetail?id=${toy.id}"> <img
													class="img-responsive" src="${toy.imageUrl}" />
												</a>
											</div>
											<div class="col-xs-9">
												<a href="toyDetail?id=${toy.id}">
													<h4>${toy.productName}</h4>
												</a> <span>Published On ${toy.publishDate}</span>
												<p>By ${toy.category}</p>
												<br /> <a href="toyDetail?id=${toy.id}"> <span
													style="font-size: x-large; color: #db3208;">$ <span>${toy.ourPrice}</span>
												</span>
												</a> <span style="text-decoration: line-through;">$ <span>${toy.listPrice}</span>
												</span>

												<p>FREE Shipping by ToyZenG</p>

											</div>

										</div>

									</div>

								</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				</div>
				</div>
			</div>
		</div>
	<!-- end of container -->
	<div>
		<script src="toy/js/jquery.min.js"></script>
		<script src="toy/js/bootstrap.min.js"></script>

		

		<script src="toy/js/jquery.dataTables.min.js"></script>
		<script src="toy/js/dataTables.bootstrap.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 




	</div>


	<script>
		$(document).ready(function() {
			$('#toyList').DataTable();

			$("#toyList").on('page.dt', function() {
				$('html, body').animate({
					scrollTop : $('#toyList').offset().top
				}, 200);
			});
		});
		
		$(".list-group-item").each(function(index) {
			$(this).on('click', function() {
				$(".list-group-item").css("background-color","white");
				$(".list-group-item").css("color","#555");
				$(this).css("background-color","#9e35ff");
				$(this).css("color","white");
				
				var id = $(this).attr('id');
				$.ajax({
					type:'GET',
					data: {
						category : id,
					},
					url:'choice',
		             success : function(resp){
		          		var arr = jQuery.parseJSON(resp);
		          		console.log(arr);
		          		$("#table").empty();
		          		var t = '<table border="0" id="toyList" style="color: #423f3f"><thead><tr><th></th></tr></thead><tbody></tbody></table>';
		          		$("#table").append(t);
		          		
		          		$.each(arr, function(i, toy){
		          			var row = '<tr><td><div><div class="row" style="margin-bottom: 50px;"><div class="col-xs-3"><a href="toyDetail?id=' 
		          				+ toy.id +'"> <img class="img-responsive shelf-book" src="' + toy.imageUrl 
		          				+ '" /></a></div><div class="col-xs-9"><a href="toyDetail?id=' +toy.id +'"><h4>' + toy.productName 
		          				+ '</h4></a> <span>Published On ' + toy.publishDate + '</span><p>By ' + toy.category + '</p><br /> <a href="toyDetail?id='+toy.id
		          				+ '"> <span style="font-size: x-large; color: #db3208;">$ <span>'+toy.ourPrice+' </span></span></a> <span style="text-decoration: line-through;">$ <span>'
		          				+ toy.listPrice + '</span></span><p>FREE Shipping by ToyZenG</p></div></div></div></td></tr>';
		                    $("tbody").append(row);
		                });
		          		
		          		(function() {
		        			$('#toyList').DataTable();
							console.log('a');
		        			$("#toyList").on('page.dt', function() {
		        				$('html, body').animate({
		        					scrollTop : $('#toyList').offset().top
		        				}, 200);
		        			});
		        		})()
		          		
		             }
		         });
			});
		})
		
		$(document).ready(function(){
    $(".naitem").mouseover(function() {
    	console.log("1");
         $(this).animate({ color:'rgb(255, 152, 35)'},300);
    }).mouseout(function() {
        $(this).animate({ color:'white'},300);
    });       
});
		
		
	</script>
</body>

</html>