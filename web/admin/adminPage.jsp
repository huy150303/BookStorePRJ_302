<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="css/font-awesome.min.css" rel="stylesheet" />      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xr+M8k7qk+t8W1O8Yj4G2Gu0TIk8IAwKqlcvkCk5fIY1g9vp/+7KxnruPSfE0EHnjUFW0+R2etQZcxI2ZBv7qw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
    </head>

    <body class="sub_page">

        <div class="hero_area">

            <!-- header section strats -->
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="admin">
                            <span>
                                ADMIN
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  ">
                                <li class="nav-item active">
                                    <a class="nav-link" href="admin?service=admin">Books <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="admincus?service=admincus"> Customers</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="admingenres?service=admingenres">Genres</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="adminorder?service=admin">Orders</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="adminsuppliers?service=admin">Suppliers</a>
                                </li>
                            </ul>
                            <div class="user_optio_box">
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
        <c:if test="${not empty requestScope.Notification}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                ${requestScope.Notification}
            </div>
        </c:if>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="contact-items">
                        <div class="customer-care" style="border: 1px solid green;box-shadow: 0 15px 15px green;">
                            <div class="info">
                                <h4>Total customers</h4>
                                <p><b>${requestScope.user} <i class="fa fa-user" aria-hidden="true"></i></b></p>
                                <p>Total number of managed customers.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="contact-items">
                        <div class="customer-care" style="border: 1px solid #0EB5EE;box-shadow: 0 15px 15px #0EB5EE;">
                            <div class="info">
                                <h4>Total orders</h4>
                                <p><b>${requestScope.orders} <i class="fa fa-shopping-bag" aria-hidden="true"></i></b></p>
                                <p>Total orders in month.</p>
                                <a  href="admin?service=AllOrdersInTime">Show all</a>
                            </div>
                        </div>
                    </div>
                </div>
                                                <div class="col-md-3">
                    <div class="contact-items">
                        <div class="customer-care" style="border: 1px solid #0EB5EE;box-shadow: 0 15px 15px red;">
                            <div class="info">
                                <h4> About to run out of stock</h4>
                                <p><b>${requestScope.countBooksRunout} <i class="fa fa-warning" aria-hidden="true"></i></b></p>
                                <p>Product warning, need to get more.</p>
                                <a  href="admin?service=AllBooksRunOut">Show all</a>
                            </div>
                        </div>
                    </div>
                </div>
                                                               <div class="col-md-3">
                    <div class="contact-items">
                        <div class="customer-care" style="border: 1px solid #ffff66;box-shadow: 0 15px 15px yellow;">
                            <div class="info">
                                <h4> All products are manage</h4>
                                <p><b>${requestScope.booksCount} <i class="fa fa-book" aria-hidden="true"></i></b></p>
                                <p>Product you are manage.</p>
      
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- line -->
        <hr class="white-line">


        <div class="container d-flex justify-content-center mt-4">
            <div class="container">
                <div class="row">
                    <form class="mr-2" action="admin">
                        <input type="hidden" name="service" value="getBookByName">
                        <label class="mr-2">Search book:</label>
                        <input type="text" placeholder="Enter book name" name="name">
                        <input type="submit" class="button-59 ml-2" value="Search" />
                    </form>

                    <a href="#add" class="button-59 mr-2" data-toggle="modal"><i class="material-icons">&#xE147;</i> Add</a>

                    <div class="dropdown">
                        <button type="button" class="button-59 dropdown-toggle mr-2" data-toggle="dropdown">
                            Choose arrange
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="admin?service=admin&command=b.book_id">All books</a>
                            <a class="dropdown-item" href="admin?service=admin&command=b.title">A-Z</a>
                            <a class="dropdown-item" href="admin?service=admin&command=b.Unit_Price desc">price from high-low</a>
                            <a class="dropdown-item" href="admin?service=quantityBookSale">Get quantity have sale and profit</a>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>



        <c:if test="${not empty requestScope.data}">


            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Book id</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Publishing company</th>
                        <th>Supplier id</th>
                        <th>Quantity</th>
                        <th>Language</th>
                        <th>Unit price</th>
                        <th>Discount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                <script>
                    function doDelete(genreId) {
                        if (confirm("Are you sure you want to delete this book?")) {
                            window.location.href = "admin?service=deleteBooks&id=" + genreId;
                        }
                    }
                </script>
                <c:forEach items="${requestScope.data}" var="c">

                    <tr>
                        <td>${c.book_id}</td>
                        <td>${c.title}</td>
                        <td>${c.author}</td>
                        <td><img src="${c.image}" width="100px"></td>
                        <td>${c.description}</td>
                        <td>${c.publishing_company}</td>
                        <td>${c.getSupplier_id()}</td>
                        <td>${c.getQuantity()}</td>
                        <td>${c.language}</td>
                        <td>${c.getUnit_Price()}</td>
                        <td>${c.discount}</td>
                        <td>
                            <a class="btn btn-danger" href="admin?service=deleteBooks&id=${c.book_id}" onclick="doDelete(${c.book_id})" role="button">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-success" href="admin?service=getBookById&id=${c.book_id}" role="button">Update</a>
                        </td>

                    </tr>


                </c:forEach>
            </tbody>
        </table>
        <div class="container d-flex justify-content-center mt-4">
            <ul class="pagination">
                <c:if test="${tag != 1}">
                    <li><a class="page-link"  href="admin?service=admin&index=${tag-1}"><<</a></li>
                    </c:if>

                <c:forEach begin="1" end="${ePage}" var="c"> 

                    <li class="${tag==c?"active":""} page-item"><a class="page-link"  href="admin?service=admin&index=${c}">${c}</a></li>

                </c:forEach>
                <c:if test="${tag < ePage}">
                    <li><a class="page-link"  href="admin?service=admin&index=${tag+1}">>></a></li>
                    </c:if>
            </ul>
        </div>
    </c:if>   
            <c:if test="${not empty requestScope.bookRunOut}">
                <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Book id</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Publishing company</th>
                        <th>Supplier id</th>
                        <th>Quantity</th>
                        <th>Language</th>
                        <th>Unit price</th>
                        <th>Discount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                <script>
                    function doDelete(genreId) {
                        if (confirm("Are you sure you want to delete this book?")) {
                            window.location.href = "admin?service=deleteBooks&id=" + genreId;
                        }
                    }
                </script>
                <c:forEach items="${requestScope.bookRunOut}" var="c">

                    <tr>
                        <td>${c.book_id}</td>
                        <td>${c.title}</td>
                        <td>${c.author}</td>
                        <td><img src="${c.image}" width="100px"></td>
                        <td>${c.description}</td>
                        <td>${c.publishing_company}</td>
                        <td>${c.getSupplier_id()}</td>
                        <td>${c.getQuantity()}</td>
                        <td>${c.language}</td>
                        <td>${c.getUnit_Price()}</td>
                        <td>${c.discount}</td>
                        <td>
                            <a class="btn btn-danger" href="admin?service=deleteBooks&id=${c.book_id}" onclick="doDelete(${c.book_id})" role="button">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-success" href="admin?service=getBookById&id=${c.book_id}" role="button">Update</a>
                        </td>

                    </tr>


                </c:forEach>
            </tbody>
        </table>

            </c:if>
    <c:if test="${not empty requestScope.datac}">


        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Book id</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Total amount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

            <script>
                function doDelete(genreId) {
                    if (confirm("Are you sure you want to delete this book?")) {
                        window.location.href = "admin?service=deleteBooks&id=" + genreId;
                    }
                }
            </script>
            <c:set var="totalProfit" value="0" />
            <c:forEach items="${requestScope.datac}" var="c">
                <tr>
                    <td>${c.book_id}</td>
                    <td>${c.title}</td>
                    <td>${c.author}</td>
                    <td><img src="${c.image}" width="100px"></td>
                    <td>${c.quantity}</td>
                    <td>${c.total_price}</td>
                    <td>
                        <a class="btn btn-danger" href="admin?service=deleteBooks&id=${c.book_id}" onclick="doDelete(${c.book_id})" role="button">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="btn btn-success" href="admin?service=getBookById&id=${c.book_id}" role="button">Update</a>
                    </td>
                </tr>
                <c:set var="totalProfit" value="${totalProfit + c.total_price}" />
            </c:forEach>
            <tr>
                <td colspan="5"></td>
                <td><b>Total Profit:</b></td>
                <td><b>${totalProfit}</b></td>
            </tr>
        </tbody>
    </table>


</c:if>
<c:if test="${not empty requestScope.OrderInTime}">
    <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order id</th>
                    <th>Customer id</th>
                    <th>Address</th>
                    <th>Order date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.OrderInTime}" var="c">
                    <tr>
                        <td><a href="adminorderitem?service=orderItemPrint&OrderID=${c.order_id}">${c.order_id}</td>
                        <td>${c.cus_id}</td>
                        <td>${c.address}</td>
                        <td>${c.order_date}</td>

<td>
    <a class="btn btn-danger" href="adminorder?service=deleteOrder&id=${c.order_id}" onclick="doDelete(${c.order_id})" role="button">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
    <a class="btn btn-success" href="adminorder?service=getOrderById&id=${c.order_id}" role="button">Update</a>
</td>
                    </tr>
                </c:forEach>

        </table>
</c:if>
        
        
<div id="add" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="admin" method="GET">                                           
                <input type="hidden" name="service" value="adminBookInsert">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Book</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" class="form-control" name="title" required>
                    </div>
                    <div class="form-group">
                        <label>Author</label>
                        <input type="text" class="form-control" name="author" required>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input type="file" class="form-control" name="image" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input type="text" class="form-control" name="description" required>
                    </div>
                    <div class="form-group">
                        <label>Publishing company</label>
                        <input type="text" class="form-control" name="Publishing_company" required>
                    </div>
                    <div class="form-group">
                        <label>Supplier id</label>
                        <input type="number"  class="form-control" name="Supplier_id" required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number"  class="form-control" name="quantity" required>
                    </div>
                    <div class="form-group">
                        <label>Language</label>
                        <input type="text" class="form-control" name="Language" required>
                    </div>
                    <div class="form-group">
                        <label>Unit price</label>
                        <input type="number" step="0.01" class="form-control" name="Unit_Price" required>
                    </div>
                    <div class="form-group">
                        <label>Discount</label>
                        <input type="number" step="0.01" class="form-control" name="discount" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
                <p style="color: red;">${requestScope.messError}</p>
            </form>




        </div>
    </div>
</div>
<style>
    
    .btn-success i.material-icons {
                vertical-align: middle;
                margin-bottom: 5px;
            }
    .button-59 {
        align-items: center;
        background-color: #fff;
        border: 2px solid #000;
        box-sizing: border-box;
        color: #000;
        cursor: pointer;
        display: inline-flex;
        fill: #000;
        font-family: Inter,sans-serif;
        font-size: 12px;
        font-weight: 600;
        height: 30px;
        justify-content: center;
        letter-spacing: -.8px;
        line-height: 15px;
        min-width: 100px;
        outline: 0;
        padding: 0 10px;
        text-align: center;
        text-decoration: none;
        transition: all .3s;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
    }

    .button-59:focus {
        color: #171e29;
    }

    .button-59:hover {
        border-color: #06f;
        color: #06f;
        fill: #06f;
    }

    .button-59:active {
        border-color: #06f;
        color: #06f;
        fill: #06f;
    }

    @media (min-width: 768px) {
        .button-59 {
            min-width: 120px;
        }
    }
    .white-line {
        border: none;
        height: 1px;
        background-color: black;
    }
    .contact-items{
        display: flex;
        margin: 30px auto;
        flex-wrap: wrap;
        align-items: center;

    }
    .customer-care,.write-us,.sales-market{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 28%;
        margin: 30px auto;
        padding: 35px 15px;
        border-radius: 15px;
        text-align: center;
        min-width: 250px;

    }
    .customer-care{
        height: 250px;
        
    }
    .write-us{
        height: 250px;
        box-shadow: 0 15px 15px red;
        border: 1px solid red;
    }
    .sales-market{
        height: 250px;
        box-shadow: 0 15px 15px blue;
        border: 1px solid blue;
    }
</style>


<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<!-- bootstrap js -->
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- custom js -->
<script type="text/javascript" src="js/custom.js"></script>


</body>

</html>