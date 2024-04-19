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
                                <li class="nav-item ">
                                    <a class="nav-link" href="admin?service=admin">Books <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="admincus?service=admincus"> Customers</a>
                                </li>
                                <li class="nav-item active">
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

        </div>
        <!-- general -->
        <c:if test="${not empty requestScope.Notification}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                ${requestScope.Notification}
            </div>
        </c:if>
        <form action="admingenres" method="GET">
            <input type="hidden" name="service" value="InsertGenresOfBooks">
            <input type="hidden" name="genreName" value="${param.genreName}">
            <input type="number" name="book_id" placeholder="Enter book id" required>
            <button type="submit" class="button-59">Add</button>
        </form>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Book id</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Publishing company</th>
                    <th>Supplier name</th>
                    <th>Language</th>
                    <th>Unit price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <script>
                function doDelete(genreId) {
                    if (confirm("Are you sure you want to delete this genre?")) {
                        window.location.href = "admin?service=deleteGenres&id=" + genreId;
                    }
                }
            </script>
            <c:forEach items="${requestScope.data}" var="c">

                <tr>
                    <td>${c.book_id}</td>
                    <td>${c.title}</td>
                    <td>${c.author}</td>
                    <td><img src="${c.image}" alt="Product Image" width="100px"></td>
                    <td>${c.description}</td>
                    <td>${c.publishing_company}</td>
                    <td>${c.getSupplier_id()}</td>
                    <td>${c.language}</td>
                    <td>${c.getUnit_Price()}</td>
                    <td>
                        <a class="btn btn-danger" href="admingenres?service=deleteBookOfGenres&id=${c.book_id}&genreName=${param.genreName}" onclick="doDelete(${c.book_id})" role="button">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;

                    </td>

                </tr>


            </c:forEach>

        </tbody>
    </table>

    <style>
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
    </style>


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