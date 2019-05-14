<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

    <link href="https://fonts.googleapis.com/css?family=Akronim|Black+Ops+One" rel="stylesheet">


</head>

<body>

    <div class="container">
        <div>
            <div class="page-top" style="width: 100%; height: 20px; background-color: #ffffff00;"></div>

            <!-- Static navbar -->
            <nav class="navbar navbar-default" style="background-color: #fafafa00; border-color: #fcfcfc00; z-index: 1;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.jsp" style="font-size: 40px; font-family: 'Akronim', cursive; color: #9e35ff">ToyZenG</a>
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
        <form action="addtocart" method="post">
            <input hidden="hidden" name="toyId" value="${toy.id}"/>
            <div class="row" style="margin-top: 120px;">
                <div class="col-xs-3">
                    <a href="toy" style="font-size: 40px; font-family: 'Akronim', cursive; color: #9e35ff; text-decoration:none" id="back">Back to Toy list</a>
                    <br/>
                    <img class="img-responsive" src="${toy.imageUrl}" />
                </div>
                
                <% 
                   String add = (String)request.getAttribute("addSuccess"); 
                   String no = (String)request.getAttribute("notEnoughStock");	
                %>

                <div class="col-xs-9">
                  	<% if(add != null){ %>
                    <h3>
                        <span style="color: forestgreen">
                            <i class="fa fa-check" aria-hidden="true" style="color: forestgreen"></i>Added to cart.</span>
                    </h3>
                    <%} if(no != null){ %>
                    <h3>
                        <span style="color: red">Oops, only
                            <span>${toy.stickNumber}</span> In Stock.</span>
                    </h3>
                    <% } %>
                
                    <h3>${toy.productName}</h3>
                    <div class="row">
                        <div class="col-xs-5">
                            <p>
                                <strong>Brand: </strong>
                                <span>${toy.category}</span>
                            </p>
                            <p>
                                <strong>Publication Date: </strong>
                                <span>${toy.publishDate}</span>
                            </p>
                            <p>
                                <strong>Shipping: </strong>
                                <span>Free Shipping by ToyZenG</span>
                        </div>
						
						<%@ page import="com.toyshop.domain.Toy"%>
						<%@ page import="java.math.BigDecimal"%>
						<% Toy toy = (Toy)request.getAttribute("toy");%>
						
						
                        <div class="col-xs-7">
                            <div class="panel panel-default" style="border-width: 5px; margin-top: 20px;">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h4>Our Price:
                                                <span style="color:rgb(255, 70, 70);">$
                                                    <span>${toy.ourPrice}</span>
                                                </span>
                                            </h4>
                                            <p>List Price:
                                                <span style="text-decoration: line-through">$
                                                    <span>${toy.listPrice}</span>
                                                </span>
                                            </p>
                                            <% double f = toy.getListPrice() - toy.getOurPrice();
                                               BigDecimal bg = new BigDecimal(f);
                                            %>
                                            <p>You save: $
                                                <span><%= bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()%></span>
                                            </p>
                                            <span>Qty: </span>
                                            <select name="qty">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-6">
                                        	<% if(toy.getStickNumber() > 10){ %>
                                            <h4 style="color: green">In Stock</h4>
                                            
                                            <%} if(toy.getStickNumber() <= 10 && toy.getStickNumber() > 0){ %>
                                            <h4 style="color: green">Only
                                                <span>${toy.stickNumber}</span> In Stock</h4>
                                            <% } %>
                                            
                                       		<% if(toy.getStickNumber() == 0){ %>
                                            <h4 style="color:rgb(255, 70, 70);">Unavailable</h4>
                                            <% } %>
                                            <button type="submit" id="addcart" class="btn btn-warning" style="color:rgb(71, 71, 71);border:1px solid rgb(255, 175, 2); padding: 10px 40px 10px 40px;">Add to Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>
                    <p style="font-family: 'Black Ops One', cursive;">
                    Do your action figures marvel and wow your friends and fellow collectors and make you the object of their
                        envy? Would you like them to? And, what's your favorite action figure? Is it Batman and his Batmobile
                        that get your motor running, or do action figures of Spider-Man make you tingle with excitement?
                        Do you choose a certain one or two superhero action figures when you celebrate Take Your Action Figure
                        to Work Day? People have to weigh many preferences and considerations when it comes to what they
                        want as part of their action figure and toy figure collection, and the variations and specific character
                        choices are nearly endless. But whether you're a devout collector, a casual fan, or there's just
                        one line or character you're looking for, ToyZenG has the amazing
                        new action figures you need!</p>
                </div>
            </div>
        </form>
    </div>
    <!-- end of container -->
    <div>
        <script src="toy/js/jquery.min.js"></script>
        <script src="toy/js/bootstrap.min.js"></script>

        

        <script src="toy/js/jquery.dataTables.min.js"></script>
        <script src="toy/js/dataTables.bootstrap.min.js"></script>
		
    </div>
    <script>
    
		</script>

</body>

</html>