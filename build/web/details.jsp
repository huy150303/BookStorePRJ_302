<%-- 
    Document   : list
    Created on : Sep 26, 2023, 2:50:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
    </head>
    <style>
        .flex {
            display: flex;
            align-items: center;
        }

    </style>   
    <body class="sub_page">


        <div class="hero_area">
            <!-- header section strats -->
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.html">
                            <span>
                                Bond books
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  ">
                                <li class="nav-item ">
                                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="books?service=about"> About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="books?service=BooksPage">Books</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="books?service=contact">Contact Us</a>
                                </li>
                            </ul>
                            <div class="user_optio_box">
                                <a href="books?service=profile&id=${sessionScope.user.cus_id}">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <a href="showCart.jsp">
                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
        </div>
        <c:forEach items="${requestScope.data}" var="c">


            <div class="row">
                <div class="col-md-6">
                    <img src="${c.image}" alt="Product Image" style=" max-width: 100%; max-height: 100%;" />

                </div>
                <div class="col-md-6">
                    <section class="about_section layout_padding">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="detail-box">
                                        <h2>${c.title}-${c.author}</h2>
                                        <p>${c.description}</p>
                                        Publishing company:<span>${c.publishing_company}</span>
                                        <br>
                                        Supplier name: <span>${c.supplier_name}</span>
                                        <br>

                                        Genres:
                                        <c:forEach items="${requestScope.data1}" var="genre" varStatus="loop">
                                            <span>${genre.genre_name}</span>
                                            <c:if test="${not loop.last}">, </c:if>
                                        </c:forEach>

                                        <br>
                                        Language: <span>${c.language}</span>
                                        <br>

                                        <h5>
                                            <c:if test="${c.getDiscount()==0}">
                                                <h5>
                                                    <span>$${c.getUnit_Price()}</span>
                                                </h5>
                                            </c:if>
                                            <c:if test="${c.getDiscount()!=0}">

                                                <h5>
                                                    <span style="text-decoration: line-through; color: gray">$${c.getUnit_Price()}</span>
                                                    <span>$${c.getUnit_Price()-c.getDiscount()}</span>
                                                </h5>
                                            </c:if>

                                            <br>
                                            <a href="cart?service=addToCart&id=${c.book_id}">
                                                Add To Cart
                                            </a>


                                        </h5>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>

        </c:forEach>


        <!-- info section -->
        <section class="info_section layout_padding2">
            <div class="container">
                <div class="info_logo">
                    <h2>
                        Bond books
                    </h2>
                </div>
                <div class="row">

                    <div class="col-md-3">
                        <div class="info_contact">
                            <h5>
                                About Shop
                            </h5>
                            <div>
                                <div class="img-box">
                                    <img src="images/location-white.png" width="18px" alt="">
                                </div>
                                <p>
                                    Address: 24T1-Hoàng Đạo Thúy, Cầu Giấy, Hà Nội
                                </p>
                            </div>
                            <div>
                                <div class="img-box">
                                    <img src="images/telephone-white.png" width="12px" alt="">
                                </div>
                                <p>
                                    0936080611
                                </p>
                            </div>
                            <div>
                                <div class="img-box">
                                    <img src="images/envelope-white.png" width="18px" alt="">
                                </div>
                                <p>
                                    huyphhe172063@fpt.edu.vn
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="info_info">
                            <h5>
                                Informations
                            </h5>
                            <p>
                                We sell books
                            </p>
                        </div>
                    </div>



                    <div class="col-md-3">
                        <div class="info_form ">
                            <h5>
                                Newsletter
                            </h5>
                            <form action="">
                                <input type="email" placeholder="Enter your email">
                                <button>
                                    Subscribe
                                </button>
                            </form>
                            <div class="social_box">
                                <a href="">
                                    <img src="images/fb.png" alt="">
                                </a>
                                <a href="">
                                    <img src="images/twitter.png" alt="">
                                </a>
                                <a href="">
                                    <img src="images/linkedin.png" alt="">
                                </a>
                                <a href="">
                                    <img src="images/youtube.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end info_section -->

        <!-- footer section -->
        <section class="footer_section">
            <div class="container">
                <p>
                    &copy; <span id="displayYear"></span> All Rights Reserved By
                    <a href="https://html.design/">Free Html Templates</a>
                </p>
            </div>
        </section>
        <!-- footer section -->

        <!-- jQery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script type="text/javascript" src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
        </script>
        <!-- End Google Map -->

    </body>

</html>
