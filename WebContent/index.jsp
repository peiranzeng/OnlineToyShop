<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ToyZenG</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Free-Template.co" />


    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">



    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Akronim|Black+Ops+One" rel="stylesheet">
    
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">
  
  <!-- <div class="site-wrap"> -->

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    
    <%@ page import="javax.servlet.http.HttpSession" %>
    
    <% HttpSession cursession = request.getSession(true); 
       Integer curId = (Integer)cursession.getAttribute("KeyId");	
    %>
    
    <header class="site-navbar py-3 js-site-navbar site-navbar-target" role="banner" id="site-navbar">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-11 col-xl-2 site-logo">
            <h1 class="mb-0"><a href="index.html" class="text-white h1 mb-0" style="font-family: 'Akronim', cursive">Toy ZenG</a></h1>
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block" style="font-family: 'Black Ops One', cursive;">
                <li><a href="#section-home" class="nav-link">HOME</a></li>
                <li><a href="#section-about" class="nav-link">ABOUT US</a></li>
                <% if(curId == null){ %>
                <li><a href="login.jsp" class="nav-link">SIGN IN</a></li>
                <% }else{ %>
                
         		<li><a href="signout" class="nav-link">SIGN OUT</a></li>
         		
                <% }%>
                <% if(curId == null){%>
                <li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
                <% }%>
              </ul>
            </nav>
          </div>


          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>
      
    </header>

  

    <div class="site-blocks-cover overlay" style="background-image: url(images/eva-unit-01.png);" data-aos="fade" data-stellar-background-ratio="0.5" id="section-home">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            
 
            <h1 style="font-family: 'Akronim', cursive" data-aos="fade-up">We Sell Hottest Toys</h1>
            <p class="mb-5" data-aos="fade-up" data-aos-delay="100">An online toy store</p>
            <p data-aos="fade-up" data-aos-delay="200"><a href="toy" class="btn btn-primary py-3 px-5 text-white">Get your toy</a></p>

          </div>
        </div>
      </div>
    </div>  

    <div class="site-section" id="section-about" style="font-family: 'Black Ops One', cursive;">
      <div class="container">
        <div class="row mb-5">
          
          <div class="col-md-5 ml-auto mb-5 order-md-2" data-aos="fade-up" data-aos-delay="100">
            <img src="images/toysample.png" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-md-6 order-md-1" data-aos="fade-up">
            <div class="text-left pb-1 border-primary mb-4">
              <h2 class="text-primary" style="font-family: 'Akronim', cursive">About Us</h2>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis deleniti reprehenderit animi est eaque corporis! Nisi, asperiores nam amet doloribus, soluta ut reiciendis. Consequatur modi rem, vero eos ipsam voluptas.</p>
            <p class="mb-5">Error minus sint nobis dolor laborum architecto, quaerat. Voluptatum porro expedita labore esse velit veniam laborum quo obcaecati similique iusto delectus quasi!</p>
            
            <ul class="ul-check list-unstyled success">
              <li>Error minus sint nobis dolor</li>
              <li>Voluptatum porro expedita labore esse</li>
              <li>Voluptas unde sit pariatur earum</li>
            </ul>
            
          </div>
          
        </div>
      </div>
    </div>
  
    
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-5 mr-auto">
                <h2 class="footer-heading mb-4" style="font-family: 'Akronim', cursive">About Us</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam iure deserunt ut architecto dolores quo beatae laborum aliquam ipsam rem impedit obcaecati ea consequatur.</p>
              </div>
              
              <div class="col-md-3">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">Testimonials</a></li>
                  <li><a href="#">Contact Us</a></li>
                </ul>
              </div>
              <div class="col-md-3">
                <h2 class="footer-heading mb-4">Follow Us</h2>
                <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
            <form action="#" method="post">
              <div class="input-group mb-3">
                <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-primary text-white" type="button" id="button-addon2">Send</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <p>
              <small class="block">&copy; <script>document.write(new Date().getFullYear());</script> Designed &amp; Developed by ToyZenG</small> 
              </p>
            </div>
          </div>
          
        </div>
      </div>
    </footer>
  <!-- </div> -->

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>