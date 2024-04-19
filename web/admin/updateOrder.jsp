<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

</head>

<body class="sub_page">


    <div class="modal-body">
<c:set var="c" value="${requestScope.order}"/> 
<form action="adminorder" method="post">
    <input type="hidden" name="id" value="${c.order_id}" readonly/>
    <input type="hidden" name="cus_id" value="${c.cus_id}" readonly/>
    Enter address: <input type="text" class="form-control" name="address" value="${c.address}"/><br>
    Enter order date: <input type="date" class="form-control" name="order_date" value="${c.order_date}"/><br>
    <input type="submit" class="btn btn-outline-success" value="Update" />
</form>
</div>


</body>

</html>