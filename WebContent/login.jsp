<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="css/login/style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Akronim|Black+Ops+One" rel="stylesheet">
    <script src="main.js"></script>
    <style>
        .error {
            color: rgb(255, 42, 42);
        }
</style>
</head>

<body>
    <header class="site-navbar py-3 js-site-navbar site-navbar-target" role="banner" id="site-navbar">

        <div class="container">
            <div class="row align-items-center">

                <div class="col-11 col-xl-2 site-logo">
                    <h1 class="mb-0">
                        <a href="index.jsp" class="h1 mb-0" style="font-family: 'Akronim', cursive; color: rgb(175, 56, 243)">Toy ZenG</a>
                    </h1>
                </div>

            </div>

        </div>
        

    </header>
    
    <% String valid = (String)request.getAttribute("findname"); %>
    
    <div id="login">
        <div class="container" style="font-family: 'Black Ops One', cursive;">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="login" method="post">
                            <h3 class="text-center " style="font-family: 'Black Ops One', cursive;">Login</h3>
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <br>
                                <input type="text" name="username" id="username" class="form-control" value="${username}">
                                <% if(valid != null && valid.equals("no")){ %>
                                <p style="color: pink"><i class="fas fa-exclamation-triangle"></i>We cannot find an account with that username</p>
                                <%} %>
                            </div>
                            <div class="form-group" style="margin-top: 10px">
                                <label for="password">Password:</label>
                                <br>
                                <input type="password" name="password" id="password" class="form-control">
                                <% if(valid != null && valid.equals("yes")){ %>
                                <p style="color: pink"><i class="fas fa-exclamation-triangle"></i>Your password is incorrect </p>
                                <%} %>
                            </div>
                            <div class="form-group">
                                <label for="remember-me">
                                    <span>Remember me</span>
                                    <span>
                                        <input id="remember-me" name="remember-me" type="checkbox">
                                    </span>
                                </label>
                                <br>
                                <input type="submit" name="submit" class="btn btn-success" value="SIGN IN" style="margin-top: 20px;background-color: rgb(126, 255, 21);">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="register.jsp" style="color: rgb(253, 250, 87)">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="toy/js/jquery.min.js"></script>
		<script src="toy/js/bootstrap.min.js"></script>
		<script src="toy/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<script>
	
	
		$('#login-form').validate({
    rules:{
        username:{
        	required:true
        },
        password: {
            required: true,
            minlength: 6,
            maxlength: 10
        }
    },
    messages:{
        username:{
        	required:'Username can not be empty'	
        },
        password:{
        	required:'password length should between 6 and 10'
        }
    },

    errorPlacement: function(error, element) {

        // Get inputs with this name
        var obj = $('[name="'+element.attr('name')+'"]');

        // Are there multiple?
        if (obj.length > 1) {
            // Add error after whatever the parent element is of the last one
            error.insertAfter(obj.last().parent());
        } else {
            // Default, add error after the input
            error.insertAfter(obj);
        }
    }
});
		
</script>
</html>