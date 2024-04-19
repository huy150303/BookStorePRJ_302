<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
        <title>Bond books</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
    </head>
    <style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fff; 
    border-radius: 4px; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); 
    padding: 16px; 
    z-index: 1;
    grid-template-columns: repeat(6, 1fr); /* chia cot */
    gap: 16px; 
    max-width: 400px; 
    left: -200px;
}

.dropdown:hover .dropdown-content {
    display: grid;
}

.dropdown-content a {
    display: block;
    padding: 12px 0; 
    font-size: 16px; 
    color: #333; 
    text-decoration: none;
    transition: 0.2s; 
}

.dropdown-content a:hover {
    background-color: #f0f0f0;
}

        .dropdown-content {
            min-width: 800px;

        }
        .search-box {
            position: absolute;
            top: 50%;
            left: 95%;
            display: flex;
            align-items: center;
            transform: translate(-100%, -50%);
            padding: 10px;
            border-radius: 40px;
            height: 40px;
            background: #fff;
        }

        .search-box:hover .search-txt {
            width: 190px;
            padding: 0 6px;

        }

        .search-box:hover .search-btn {
            background: #fff;
        }

        .search-txt {
            border: none;
            background: none;
            outline: none;
            padding: 0;
            color: #000;
            transition: 0.5s;
            font-size: 1rem;
            width: 0px;
        }

        .search-btn {
            color: #8019c8;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: 0.5s;
            border: none;
            background: none;
            cursor: pointer;
        }

    </style>

    <body class="sub_page">

        <div class="hero_area">
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="admin">
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
                                    <a class="nav-link" href="books?service=topSale">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="books?service=about"> About</a>
                                </li>
                                <li class="nav-item active">

                                    <div class="dropdown">
                                        <a class="nav-link" href="books?service=BooksPage">Books</a>
                                        <div class="dropdown-content">
                                            <c:forEach items="${requestScope.data1}" var="c">
                                                <a class="m-2"href="books?service=BooksPage&genreName=${c.genre_name}">${c.genre_name}</a>
                                            </c:forEach>

                                        </div>
                                    </div>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="books?service=contact">Contact Us</a>
                                </li>
                            </ul>

                            <div class="user_optio_box">



                                <c:if test="${sessionScope.user!=null}">
                                    <div class="search-box">
                                        <form action="books" method="get" style="display: flex; align-items: center;">
                                            <input type="hidden" name="service" value="getBookByName">
                                            <input type="text" class="search-txt" name="name" value="" placeholder="Enter book's name" style="flex: 1;">
                                            <button type="submit" class="search-btn">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </div>
                                    <a href="books?service=profile&id=${sessionScope.user.cus_id}">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </a>
                                    <a href="showCart.jsp">
                                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    </a>
                                    <a href="books?service=logout">
                                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.user==null}">
                                    <a href="login.jsp">
                                        login <i class="fa fa-lock" aria-hidden="true"></i>
                                    </a> 
                                    <a href="register.jsp">
                                        register<i class="fa fa-user-plus" aria-hidden="true"></i>
                                    </a>

                                </c:if>

                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
        </div>

        <!-- product section -->
        <c:if test="${not empty requestScope.errorStock}">
            <div class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                ${requestScope.errorStock}
            </div>
        </c:if>
        <c:if test="${not empty requestScope.successful}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Successful!</strong>  ${requestScope.successful}
            </div>
        </c:if>


        <section class="product_section ">
            <div class="container">


                <c:if test="${empty requestScope.data}">
                    <h1
                        >Book not found</h1>
                </c:if>

                <div class="product_container">

                    <c:forEach items="${requestScope.data}" var="c">
                        <c:set var="id" value="${c.book_id}" />
                        <div class="box">
                            <div class="box-content">
                                <div class="img-box">
                                    <img src="${c.image}" alt="">
                                </div>

                                <div class="text">
                                    <h6>
                                        ${c.title}

                                    </h6>
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

                                </div>


                                <div class="btn-box">

                                    <a href="books?service=details&book_id=${c.book_id}" style="background-color: green; color: white; padding: 10px 20px; border-radius: 5px; margin-right: 10px">Details</a>

                                    <a href="cart?service=addToCart&id=${c.book_id}">
                                        Add To Cart
                                    </a>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    <div class="container d-flex justify-content-center mt-4">
                        <ul class="pagination">
       <c:if test="${tag != 1 && not empty requestScope.data && requestScope.data.size() >  tag}">
    <li><a class="page-link" href="books?service=BooksPage&index=${tag-1}"><<</a></li>
</c:if>


                            <c:forEach begin="1" end="${ePage}" var="c"> 

                                <li class="${tag==c?"active":""} page-item"><a class="page-link"  href="books?service=BooksPage&index=${c}">${c}</a></li>

                            </c:forEach>
                            <c:if test="${tag < ePage}">
                                <li><a class="page-link"  href="books?service=BooksPage&index=${tag+1}">>></a></li>
                                </c:if>

                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- end product section -->


        <!-- product section -->



        <!-- end product section -->

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

        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>
    </body>

</html>