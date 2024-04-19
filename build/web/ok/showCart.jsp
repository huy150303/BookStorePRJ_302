<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <script src="https://cdn.tailwindcss.com/3.1.4"></script>
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
</head>

<body class="sub_page"> 
    
    <style>
        a.button {
    display: inline-block;
    padding: 8px 12px;
    text-decoration: none;
    color: #000; 
    background-color: #eee; 
    border: 1px solid #ccc; 
    border-radius: 4px;
}

a.button:hover {
    background-color: #ddd; 
}
.hover-icon:hover {
    color: red; 
}
    .dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}

        </style>

        <div class="hero_area">
    <!-- header section strats -->
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
                <a href="books?service=logout">
  <i class="fa fa-sign-out" aria-hidden="true"></i>
</a>
                                             

            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

        
<div class="bg-gray-100 h-screen py-8">
    <div class="container mx-auto px-4">
        <h1 class="text-2xl font-semibold mb-4">Shopping Cart</h1>
        <div class="flex flex-col md:flex-row gap-4">
            <div class="md:w-3/4">
                <div class="bg-white rounded-lg shadow-md p-6 mb-4">
                    
                    <table class="w-full">
                        <thead>
                            <tr>
                                <th class="text-left font-semibold">ID</th>
                                <th class="text-left font-semibold">Product</th>
                                <th class="text-left font-semibold">Price</th>
                                <th class="text-left font-semibold">Quantity</th>
                                <th class="text-left font-semibold">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="id" items="${sessionScope.keySet()}">
    <c:if test="${id ne 'user'}">
        <tr>
            <td class="py-4">
                <div class="flex items-center">
                    <span class="font-semibold">${id}</span>
                </div>
            </td>
            <td class="py-4">
                <div class="flex items-center">
                    <img class="h-16 w-16 mr-4" src="${sessionScope[id].image}">
                    <span class="font-semibold">${sessionScope[id].title}</span>
                </div>
                    <div style="color: red">${sessionScope[id].getError()}</div>
            </td>
            <td class="py-4">${sessionScope[id].getUnit_Price()}</td>
            <td class="py-4">
                <div class="flex items-center">
    <form action="cart" method="GET">
        <input type="hidden" name="service" value="minusCart">
        <input type="hidden" name="id" value="${id}">
        <button type="submit" class="border rounded-md py-2 px-3 mr-2">-</button>
    </form>
    <span class="text-center w-8">${sessionScope[id].orderItem.getQuantity()}</span>
    
    
    
    <form action="cart" method="GET">
        <input type="hidden" name="service" value="addCart">
        <input type="hidden" name="id" value="${id}">
        <button type="submit" class="border rounded-md py-2 px-3 ml-2">+</button>
    </form>
</div>
            </td>
            <td class="py-4">${sessionScope[id].orderItem.getQuantity()*sessionScope[id].getUnit_Price()}</td>
           
            <td>
    <a href="cart?service=deleteItem&id=${id}" style="font-size: 36px; color: black; text-decoration: none;">
        <span class="hover-icon fa fa-trash-o"></span>
    </a>
</td>
        </tr>
    </c:if>
        
        
</c:forEach>
             <c:forEach var="id" items="${sessionScope.keySet()}">
                 <c:if test="${id ne 'user'}">   
                     
                            <c:set var="totalPrice"  value="${sessionScope[id].orderItem.getQuantity()*(sessionScope[id].getUnit_Price()-sessionScope[id].getDiscount())}" />
                            <c:set var="grandTotal" value="${grandTotal + totalPrice}" />
                           <c:set var="totalDiscount" value="${totalDiscount +sessionScope[id].orderItem.getQuantity()* sessionScope[id].getDiscount()}" />
                            </c:if>
                 
                   </c:forEach>
               
        
                         <c:if test="${empty grandTotal or grandTotal eq 0}">
                
                         <td colspan="5"class="col-md-12 text-center">No products in the cart</td>
                    
 
</c:if>  
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="md:w-1/4">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-lg font-semibold mb-4">Summary</h2>
                    <div class="flex justify-between mb-2">
                        <span>Subtotal</span>
                        
                        <span>${grandTotal}</span>
                    </div>
                    <div class="flex justify-between mb-2">
                        <span>Discount</span>
                        <span>${totalDiscount}</span>
                    </div>
                    

                    <hr class="my-2">
                    <div class="flex justify-between mb-2">
                        <span class="font-semibold">Total</span>
                        <span class="font-semibold"> ${grandTotal}</span>
                    </div>
                   <p style="color: red;">${requestScope.messError}</p>
                   <br>
                    <a href="cart?service=checkOut" data-toggle="modal" class="bg-blue-500 text-white py-2 px-4 rounded-lg mt-4 w-full">Checkout</a>
                </div>
            </div>
        </div>
    </div>
              
</div>
                        





    <script type="text/javascript" src="js/bootstrap.js"></script>

    <script type="text/javascript" src="js/custom.js"></script>
</body>
</html>