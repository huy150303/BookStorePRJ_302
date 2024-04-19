
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login </title>
        <link rel="icon" type="image/png" href="images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   
        <style>
.icon-color {
    color: #d41872; 
    
}
a {
  color: #d41872;
}
a:hover {
  color: hotpink;
}
        </style>
    </head>
    <body>
    
       
       <div class="limiter">
    <div class="container-login100" style="background-image: url('images/background.avif');">
        <div class="wrap-login100 p-t-30 p-b-50">
            <span class="login100-form-title p-b-41">
                Account Login
            </span>
            <form action="books" class="login100-form validate-form p-b-33 p-t-5">
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="username" placeholder="Username">
                    
                    <span class="focus-input100"><i class="fas fa-user fa-2x icon-color" style="margin-top: 35px;margin-left: 20px;"></i></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100"><i class="fas fa-lock fa-2x icon-color" style="margin-top: 35px;margin-left: 20px;"></i></span>
                </div>
    <p style="color: red;">${requestScope.messError}</p>
                <div class="container-login100-form-btn m-t-32">
                    <button class="login100-form-btn">
                        Login
                    </button>
                </div>

                <h4 style="text-align: center; margin-bottom: 10px;">or</h4>
               
                <div class="container-login100-form-btn m-t-10" >
                 
                    <a href="register.jsp"  data-toggle="modal">Create an account</a>
                </div>
            </form>

        </div>
    </div>
</div>


        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>