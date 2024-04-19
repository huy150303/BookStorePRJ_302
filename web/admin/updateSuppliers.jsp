<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<body class="sub_page">


    <div class="modal-body">
<c:set var="c" value="${requestScope.data}"/> 
<form action="adminsuppliers" method="post">
    <input type="hidden" name="id" value="${c.supplier_id}" readonly/>
    Enter supplier name: <input type="text" class="form-control" name="name" value="${c.supplier_name}" readonly/><br>
    Enter address: <input type="text" class="form-control" name="address" value="${c.address}"/><br>
    Enter phone: <input type="text" class="form-control" name="phone" value="${c.phone}"/><br>
    Enter email: <input type="text" class="form-control" name="email" value="${c.email}"/><br>
    Enter HomePage: <input type="text" class="form-control" name="homepage" value="${c.getHomePage()}"/><br>
    
    <input type="submit" class="btn btn-outline-success" value="Update" />
</form>
</div>



    
    


</body>

</html>