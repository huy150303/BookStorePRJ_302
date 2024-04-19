<%-- 
    Document   : newjsp
    Created on : Feb 19, 2024, 2:52:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>JSP Page</title>
    </head>
    <body>
<section class="vh-100 bg-image">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-3">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

             <form action="books" method="GET">                                           
    <input type="hidden" name="service" value="adminCustomerRegister">

                <div class="modal-body">					
                        <div class="form-group">
                            <label>Userame</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                    <p style="color: red;">${requestScope.messError}</p>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                  <div class="form-group">
                                        <label>Repeat password</label>
                                        <input type="password" class="form-control"  name="repeatPassword" required>
                                        <span id="passwordError" style="color: red; display: none;">Passwords do not match!</span>
                                    </div>
                        <p style="color: red;">${requestScope.messPassError}</p>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class="form-control" name="email" required>
                        </div>
                        <div class="form-group">
                            <label>Date of birth</label>
                            <input type="date" class="form-control" name="dob" required>
                        </div>
                        <div class="form-group">
                            
                            <input type="hidden" step="0.01" class="form-control" name="money" value="0.00" required>
                        </div>

                        <div class="form-group">
                            <label>Phone</label>
                            <input type="tel" class="form-control" name="phone" required>
                        </div>
            
                    </div>
<div class="modal-footer d-flex justify-content-center">
    <input type="submit" class="login100-form-btn" style="color: white; border-color: #d41872;" value="Create an account">
</div>



                <p class="text-center text-muted mt-5 mb-0">Have already an account? 
                    <a href="login.jsp"  data-toggle="modal">login</a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <style>
        
body {
            background-image: url('images/bsg2.png');
            background-size: cover; 
            background-repeat: no-repeat;

        }
a {
  color: #d41872;
}
a:hover {
  color: hotpink;
}
    </style>
</section>

    </body>
</html>
