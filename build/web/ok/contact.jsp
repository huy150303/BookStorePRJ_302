<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
              <li class="nav-item ">

<div class="dropdown">
   <a class="nav-link" href="books?service=BooksPage">Books</a>
  <div class="dropdown-content">
      <c:forEach items="${requestScope.data1}" var="c">
          <a class="m-2"href="books?service=BooksPage&genreName=${c.genre_name}">${c.genre_name}</a>
      </c:forEach>
      
  </div>
</div>
             
              </li>

              <li class="nav-item active">
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



  <!-- contact section -->
  <section class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          Contact Us
        </h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            <form action="books?service=BooksPage">
              <div>
                <input type="text" placeholder="Your Name" />
              </div>
              <div>
                <input type="text" placeholder="Phone Number" />
              </div>
              <div>
                <input type="email" placeholder="Email" />
              </div>
              <div>
                <input type="text" class="message-box" placeholder="Message" />
              </div>
              <div class="btn_box">
                <button>
                  SEND
                </button>
              </div>
            </form>
          </div>
        </div>
          <div class="col-md-6">
              
     <style>
        /* Add your CSS styles here */
        .dbox {
            display: flex;
            align-items: center;
            margin-bottom: 50px; /* Adjust spacing between each section */
        }
        .icon {
            width: 40px; /* Adjust icon width as needed */
            height: 40px; /* Adjust icon height as needed */
            background-color: #f8f9fa; /* Set background color of icon */
            border-radius: 50%; /* Make the icon circular */
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px; /* Adjust spacing between icon and text */
            
        }

    </style>        
                    <div class="dbox w-100 d-flex align-items-start">
            <div class="icon">
                <span class="fa fa-map-marker"></span>
            </div>
            <div class="text pl-3">
                <p><span>Address:</span> 24T1-Hoàng Đạo Thúy, Cầu Giấy, Hà Nội</p>
            </div>
        </div>
        <div class="dbox w-100 d-flex align-items-center">
            <div class="icon">
                <span class="fa fa-phone"></span>
            </div>
            <div class="text pl-3">
                <p><span>Phone:</span> <a href="tel://0936080611">0936080611</a></p>
            </div>
        </div>
        <div class="dbox w-100 d-flex align-items-center">
            <div class="icon">
                <span class="fa fa-paper-plane"></span>
            </div>
            <div class="text pl-3">
                <p><span>Email:</span>huyphhe172063@fpt.edu.vn</p>
            </div>
        </div>
     </div>
        </div>
      </div>
    </div>
     
  </section>
  <!-- end contact section -->


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





</body>
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>


  <script type="text/javascript" src="js/bootstrap.js"></script>

  <script type="text/javascript" src="js/custom.js"></script>
</html>