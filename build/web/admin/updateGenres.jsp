<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

</head>

<body class="sub_page">

    <div class="modal-body">
<c:set var="c" value="${requestScope.genres}"/> 
<form action="admingenres" method="post">
    <input type="hidden" name="id" value="${c.genre_id}" readonly/>
    Enter genre name: <input type="text" class="form-control" name="genre_name" value="${c.genre_name}"/><br>
    <input type="submit" class="btn btn-outline-success" value="Update" />
</form>
</div>
</body>

</html>