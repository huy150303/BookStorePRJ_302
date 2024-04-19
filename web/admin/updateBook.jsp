<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    
  <!-- Basic -->
  <meta charset="utf-8" />

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
</head>

<body class="sub_page">


    <c:forEach items="${requestScope.book}" var="c">
        
<div class="modal-body">
    <form action="admin" method="post">
        <input type="hidden" name="book_id" value="${c.book_id}" readonly/>
        Enter title: <input type="text" class="form-control" name="title" value="${c.title}"/><br>
        Enter author: <input type="text" class="form-control" name="author" value="${c.author}"/><br>
        Enter image: <input type="file" class="form-control" name="image"/><br>
        <input type="hidden" name="old_image" value="${c.image}"/>
        <img src="${c.image}" alt="Old Image"/><br>
        Enter description: <textarea type="text" class="form-control" name="description" >${c.description}</textarea><br>
        Enter publishing company: <input type="text" class="form-control" name="Publishing_company" value="${c.publishing_company}"/><br>
        Enter supplier id: <input type="number" class="form-control" name="Supplier_id" value="${c.getSupplier_id()}"/><br>
        Enter quantity: <input type="text" class="form-control" name="quantity" value="${c.getQuantity()}"/><br>
        Enter Language: <input type="text" class="form-control" name="Language" value="${c.language}"/><br>
        Enter unit price: <input type="number" class="form-control" step="0.01" name="Unit_Price" value="${c.getUnit_Price()}"/><br>
        Enter discount: <input type="number" class="form-control" step="0.01" name="discount" value="${c.getDiscount()}"/><br>
        <input type="submit" class="btn btn-outline-success" value="Update" />
    </form>
</div>
	
    </c:forEach>    

</body>

</html>