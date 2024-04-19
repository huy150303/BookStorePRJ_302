<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
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

.slider_bg_box img.logo {
    width: 100%;
    height: 100%;
}

</style>
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
              <li class="nav-item active">
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
  
<section class="slider_section ">
      <div class="slider_bg_box">
        <img src="images/logo.jpeg" alt="" class="logo">
      </div>
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
          
        <div class="carousel-inner">
          <div class="carousel-item active">
              
            <div class="container ">
              <div class="row">
                <div class="col-md-7">
                  <div class="detail-box">
                    <h1>
                      Welcome to Bond books
                    </h1>
                    <p>
                     The world of knowledge is at your fingertips.

Rich book treasure, discover dozens of books of all genres from literature, horror, science books, comics,...
Continuously updated, always updated with the newest and hottest books on the market.
Competitive prices with preferential prices and many attractive promotions.
                    </p>
                    <div class="btn-box">
                      <a href="books?service=contact" class="btn1">
                        Contact Us
                      </a>
                      <a href="books?service=about" class="btn2">
                        About Us
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-7">
                  <div class="detail-box">
                    <h1>
                      Watch our books
                    </h1>
                    <p>
                        "Are you looking for a book to help you entertain yourself after stressful studying hours?"<br>
                        "Do you want to learn more about Vietnamese history?"<br>
                        "Do you want to improve your cooking skills for your family?"<br>
                        "Discover the rich book treasure at Bond books"<br>
                    </p>
                    <div class="btn-box">
                      <a href="books?service=BooksPage" class="btn1">
                        Let's go
                      </a>
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-7">
                  <div class="detail-box">
                    <h1>
                      PRJ302-Assignment
                    </h1>
                      
                    <p>
                      Pham Hai Huy - HE172063
                    </p>

                  </div>
                </div>
              </div>
            </div>
          </div>
          
          
        </div>
        <ol class="carousel-indicators">
          <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
          <li data-target="#customCarousel1" data-slide-to="1"></li>
          <li data-target="#customCarousel1" data-slide-to="2"></li>

        </ol>
      </div>

    </section>
    
</div>
  <section class="product_section ">
      <br>
    <div class="container">
          <div class="product_heading">
        <h2>
          Popular Books
        </h2>
      </div>
        
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
                  <h5>
                    <span>$</span>${c.getUnit_Price()}
                  </h5>
 
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
   
      </div>
    </div>
  </section>

  <!-- end product section -->


  <!-- new -->

  <section class="product_section ">
    <div class="container">
          <div class="product_heading">
        <h2>
          New Arrivals
        </h2>
      </div>
        
      <div class="product_container">
  
        <c:forEach items="${requestScope.newb}" var="a">
          <c:set var="id" value="${a.book_id}" />
          <div class="box">
            <div class="box-content">
              <div class="img-box">
                <img src="${a.image}" alt="">
              </div>
              
                <div class="text">
                  <h6>
                    ${a.title}

                  </h6>
                  <h5>
                    <span>$</span>${a.getUnit_Price()}
                  </h5>
 
                </div>

                
            <div class="btn-box">
                
             <a href="books?service=details&book_id=${a.book_id}" style="background-color: green; color: white; padding: 10px 20px; border-radius: 5px; margin-right: 10px">Details</a>

              <a href="cart?service=addToCart&id=${a.book_id}">
                Add To Cart
              </a>
            </div>
            </div>
          </div>

        </c:forEach>
   
      </div>
    </div>
  </section>
<section class="product_section ">
      <br>
    <div class="container">
          <div class="product_heading">
        <h2>
          Discount Books
        </h2>
      </div>
        
      <div class="product_container">
  
        <c:forEach items="${requestScope.newc}" var="c">
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
   
      </div>
    </div>
  </section>




  <!-- client section -->
  <section class="client_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Testimonial
        </h2>
      </div>
    </div>
    <div id="customCarousel2" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="container">
            <div class="row">
              <div class="col-md-10 mx-auto">
                <div class="box">
                                      <div class="img-box" style=" width: 100%; 
  height: 100%; 
  position: relative; 
  overflow: hidden;">
                    <img src="images/Ken03.png" alt="">
                  </div>
                  <div class="detail-box">
                    <div class="client_info">
                      <div class="client_name">
                        <h5>
                          Ken03
                        </h5>
                        <h6>
                          Customer
                        </h6>
                      </div>
                      <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </div>
                    <p>
                      "Reading books on criminal psychology has opened a new window into how children operate in the shadow of crime. These books not only provide insight into the psychology of criminals but also help It helps me better understand the basis of their behavior and the reasons behind their actions. Reading books about criminal psychology is not only an academic experience but also a good way to strengthen your social awareness. society and people."
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="container">
            <div class="row">
              <div class="col-md-10 mx-auto">
                <div class="box">
                                     <div class="img-box" style=" width: 100%; 
  height: 100%; 
  position: relative; 
  overflow: hidden;">
                    <img src="images/Mac07.png" alt="">
                  </div>
                  <div class="detail-box">
                    <div class="client_info">
                      <div class="client_name">
                        <h5>
                          Mac007
                        </h5>
                        <h6>
                          Customer
                        </h6>
                      </div>
                      <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </div>
                    <p>
                     "The book 'Origin of Species' is not only a fascinating science book but also a magical journey to discover the diversity of life on our planet. From the smallest details about species to major discoveries about evolution and biological relationships, this book provides an in-depth overview of the development of species on Earth. Reading 'The Origin of Species' is not just a educational experience but also a meaningful spiritual adventure."
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="container">
            <div class="row">
              <div class="col-md-10 mx-auto">
                <div class="box">
                    <div class="img-box" style=" width: 100%; 
  height: 100%; 
  position: relative; 
  overflow: hidden;">
                      <img src="images/Nhim.png" alt="">
                  </div>
                  <div class="detail-box">
                    <div class="client_info">
                      <div class="client_name">
                        <h5>
                          Nhim
                        </h5>
                        <h6>
                          Customer
                        </h6>
                      </div>
                      <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </div>
                    <p>
                      "The book 'Forensic Notes' is an invaluable resource for those interested in the field of medicine. From basic information about body structure to the latest research on pathology and treatment methods." treatment, this book provides a comprehensive and detailed picture of medicine. Reading the book has helped me better understand how the human body works and how diseases affect health. I very grateful and recommend everyone to read this book to expand their knowledge and awareness of medicine."
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <ol class="carousel-indicators">
        <li data-target="#customCarousel2" data-slide-to="0" class="active"></li>
        <li data-target="#customCarousel2" data-slide-to="1"></li>
        <li data-target="#customCarousel2" data-slide-to="2"></li>
      </ol>
    </div>
  </section>

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
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/custom.js"></script>


</body>

</html>