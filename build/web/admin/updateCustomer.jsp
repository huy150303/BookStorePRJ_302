<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

</head>

<body class="sub_page">


  
<c:set var="c" value="${requestScope.customer}"/> 
<div class="modal-body">
    

<form action="admincus" method="post">
    <input type="hidden" name="id" value="${c.cus_id}" readonly/>
    Enter username: <input type="text" class="form-control" name="username" value="${c.username}" readonly/><br>
    Enter password: <input type="password" class="form-control" name="password" value="${c.password}"/><br>
    Enter name: <input type="text" class="form-control" name="cus_name" value="${c.cus_name}"/><br>
    Enter email: <input type="text" class="form-control" name="email" value="${c.email}"/><br>
    Enter date of birth: <input type="text" class="form-control" name="date_birth" value="${c.date_birth}"/><br>
    Enter phone: <input type="text" class="form-control" name="phone" value="${c.phone}"/><br>
    Is Admin: <br>
    <input type="radio" class="form-control" name="isAdmin" value="TRUE" ${c.isAdmin ? 'checked' : ''} disabled/> True<br>
<input type="radio" class="form-control" name="isAdmin" value="FALSE" ${!c.isAdmin ? 'checked' : ''} disabled/> False<br>

    <input type="submit" class="btn btn-outline-success" value="Update" />
</form>
</div>
</body>

</html>