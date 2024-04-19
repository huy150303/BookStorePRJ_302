<%-- 
    Document   : profile
    Created on : Feb 20, 2024, 7:31:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <title>JSP Page</title>
    </head>
    <body>

        <style>
            .purple-text {
                color: #fff;
                font-size: 25px;
            }
            a:hover {
                color: gray;

            }
        </style>
        <script>
            function doDelete(genreId) {
                if (confirm("Are you sure you want to delete this order?")) {
                    window.location.href = "adminorder?service=deleteOrder&id=" + genreId;
                }
            }

        </script>

        <section class="main_content_area">
            <div class="container">   
                <div class="account_dashboard">
                    <div class="row">


                        <!-- Nav tabs -->
                        <a href="books?service=topSale">
                            <i class="fa fa-home" style="color: #fff; font-size: 30px;margin-top: 50px;"></i>
                        </a>



                        <div class="col-sm-15 col-md-12 col-lg-12">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard_content">
                                <form action="books">

                                    <input type="hidden" name="service" value="newPassword">
                                    <input type="hidden" name="id" value="${sessionScope.user.cus_id}">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="profile-img" style="margin-top: 100px;">
                                                    <img src="images/profile.jpg" alt=""/>
                                                </div>




                                            </div>
                                            <div class="col-md-6">
                                                <div class="profile-head">
                                                    <h3 class="purple-text" style="margin-top: 130px;">
                                                        ${sessionScope.user.username}   
                                                    </h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-16 col-md-3 col-lg-3">
                                            <ul role="tablist" class="nav dashboard-list">
                                                <li><a href="#account-details" data-toggle="tab" class="nav-link purple-text">My account</a></li>

                                                <li><a href="#orders" data-toggle="tab" class="nav-link purple-text">Orders</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="orders">

                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th class="purple-text">Order id</th>
                                                        <th class="purple-text">Customer id</th>
                                                        <th class="purple-text">Address</th>
                                                        <th class="purple-text">Order date</th>
                                                        <th class="purple-text">Action</th>	 	 	 	
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.data}" var="o">
                                                        <tr>
                                                            <td class="purple-text">${o.order_id}</td>
                                                            <td class="purple-text">${o.cus_id}</td>
                                                            <td class="purple-text">${o.address}</td>
                                                            <td class="purple-text">${o.order_date}</td>
                                                            <td ><a class="btn btn-danger" href="books?service=orderDelete&id=${o.order_id}&cus_id=${sessionScope.user.cus_id}" onclick="doDelete(${c.order_id})" role="button"><span class="hover-icon fa fa-trash-o"></span></a> &nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade show active" id="account-details">                  
                                        <div class="row" >

                                            <div class="col-md-6"style="margin-left:400px">
                                                <div class="tab-content profile-tab" id="myTabContent">
                                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="purple-text">User Id</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="purple-text"> ${sessionScope.user.cus_id}</p>
                                                            </div>
                                                        </div>



                                                        <div class="row">
                                                            <div class="container">
                                                                <div class="form-group">
                                                                    <div class="checkbox">
                                                                        <label class="purple-text"data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                                            Change password <input type="checkbox"/> 
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="collapseOne" aria-expanded="false" class="collapse">

                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="purple-text">Enter old password</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="input-group">
                                                                                <input type="password" class="form-control" name="old_password" placeholder="Enter old password" />
                                                                                <div class="input-group-append">
                                                                                  
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="purple-text">Enter new password</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="input-group">
                                                                                <input type="password" class="form-control" name="password" placeholder="Enter new password" />
                                                                                <div class="input-group-append">
                                                                                    
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="purple-text">Repeat new password</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="input-group">
                                                                                <input type="password" class="form-control" name="repeatPassword" placeholder="Repeat new password" />
                                                                                <div class="input-group-append">
                                                               
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>



                                                                </div>
                                                            </div>
                                                        </div>





                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="purple-text">Name</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="purple-text">${sessionScope.user.cus_name}</p>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="purple-text">Email</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="purple-text">${sessionScope.user.email}</p>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="purple-text">Date birth</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="purple-text">${sessionScope.user.date_birth}</p>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="purple-text">Phone</label>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="purple-text">${sessionScope.user.phone}</p>
                                                            </div>
                                                        </div>
                                                        <p style="color: red;">${requestScope.messOldPassError}</p>
                                                        <p style="color: red;">${requestScope.messPassError}</p>
                                                        <p style="color: green;">${requestScope.successful}</p>
                                                        <div class="row">
                                                            <div class="col-md-8 text-center">
                                                                <div class="container-login100-form-btn m-t-32">
                                                                    <button type="submit"class="login100-form-btn ">
                                                                        Save
                                                                    </button>
                                                                </div>       
                                                            </div>  
                                                        </div>                     
                                                    </div>

                                                </div>
                                            </div>
                                        </div>         
                                    </div>
                                </form>


                            </div>
                        </div>
                    </div>
                </div>  
            </div>        	
        </section>
        <style>
            body{
                background: -webkit-linear-gradient(left, #0D47A1, #89CFF0);
            }
            .profile-img{
                text-align: center;
            }
            .profile-img img{
                width: 30%;
                height: 30%;
            }
            .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                background: #212529b8;
            }
            .profile-img .file input {
                position: absolute;
                opacity: 0;
                right: 0;
                top: 0;
            }
            .profile-head h5{
                color: #333;
            }
            .profile-head h6{
                color: #0062cc;
            }
            .profile-edit-btn{
                border: none;
                border-radius: 1.5rem;
                width: 70%;
                padding: 2%;
                font-weight: 600;
                color: #6c757d;
                cursor: pointer;
            }
            .proile-rating{
                font-size: 12px;
                color: #818182;
                margin-top: 5%;
            }
            .proile-rating span{
                color: #495057;
                font-size: 15px;
                font-weight: 600;
            }
            .profile-head .nav-tabs{
                margin-bottom:5%;
            }
            .profile-head .nav-tabs .nav-link{
                font-weight:600;
                border: none;
            }
            .profile-head .nav-tabs .nav-link.active{
                border: none;
                border-bottom:2px solid #0062cc;
            }



        </style>


        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>
    </body>
</html>
