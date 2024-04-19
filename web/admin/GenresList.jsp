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
    <style> .button-59 {
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
  
.row form input[type="text"],
.row form input[type="submit"] {
    display: inline-block;
    vertical-align: middle;

}

    </style>
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
                                    <a class="nav-link" href="admingenres?service=admingenres?service=admingenres">Genres</a>
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
        <c:if test="${not empty requestScope.Notification}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                ${requestScope.Notification}
            </div>
        </c:if>
<div class="container d-flex justify-content-center mt-4">
    <div class="container">
        <div class="row">
            <form action="admingenres" method="GET" class="d-flex">
                <input type="hidden" name="service" value="getGenresByName">
                <input type="text" name="name" placeholder="Enter genres name" class="form-control ml-2" required>
                <input type="submit" class="button-59 ml-2" value="Search" />
            </form>

            <form action="admingenres" method="GET" class="d-flex">
                <input type="hidden" name="service" value="adminGenresInsert">
                <input type="text" name="genreName" placeholder="Enter new genre name" class="form-control ml-2" required>
                <button type="submit" class="button-59 ml-2"><i class="material-icons">&#xE147;</i>Add</button>
            </form>
        </div>
    </div>
</div>



        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>genre id</th>
                    <th>genre name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach items="${requestScope.data}" var="c">

                    <tr>
                        <td>${c.genre_id}</td>
                        <td><a href="admingenres?service=GenresOfBooks&genreName=${c.genre_name}">${c.genre_name}</td>


                        <td>
                            <a class="btn btn-danger" href="admingenres?service=deleteGenres&id=${c.genre_id}" onclick="doDelete(${c.genre_id})" role="button">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-success" href="admingenres?service=getGenreById&id=${c.genre_id}" role="button">Update</a>
                        </td>

                    </tr>


                </c:forEach>
            <script>
                function doDelete(genreId) {
                    if (confirm("Are you sure you want to delete this genre?")) {
                        window.location.href = "admingenres?service=deleteGenres&id=" + genreId;
                    }
                }
            </script>
        </tbody>
    </table>




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