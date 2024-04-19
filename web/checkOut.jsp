<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com/3.1.4"></script>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>

        <form action="cart" >                                           
            <input type="hidden" name="service" value="OrderInsert">
            <div class="modal-header">						
                <h2 class="modal-title">Check out</h2>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <c:forEach var="id" items="${sessionScope.keySet()}">
                
                <c:if test="${id ne 'user'}"> 
                    <input type="hidden" name="proid" value="${id}" />
                    <input type="hidden" name="quantity" value="${sessionScope[id].orderItem.getQuantity()}" />
                    <input type="hidden" name="price" value="${sessionScope[id].orderItem.getQuantity()*sessionScope[id].getUnit_Price()-sessionScope[id].getDiscount()}" />
                </c:if>
            </c:forEach>
            <input type="hidden" class="form-control" name="id"value="${sessionScope.user.cus_id}" >
            <div class="modal-body">					
                <div class="row">
                    <div class="col-md-6"> <!-- Adjusted to col-md-6 for two inputs in one row -->
                        <div class="form-group">
                            <label>Userame</label>
                            <input type="text" class="form-control" name="username"value="${sessionScope.user.username}" readonly>
                        </div>
                    </div>
                    <div class="col-md-6"> <!-- Adjusted to col-md-6 for two inputs in one row -->

                        <label>Name</label>
                        <input type="text" class="form-control" name="name" value="${sessionScope.user.cus_name}" required>

                    </div>

                </div>

                <label>Address</label>
                <input type="text" class="form-control" name="address" value="" required>


                <label>Email</label>
                <input type="text" class="form-control" name="email" value="${sessionScope.user.email}" required>


                <label>Phone</label>
                <input type="tel" class="form-control" name="phone" value="${sessionScope.user.phone}" required>



                <h3>Payment</h3>


                <div class="container">

                    <div class="panel-group" id="accordion">
                        <div class="panel ">

                            Pay by cash
                            <input type="radio" data-toggle="collapse" data-parent="#accordion" href="#collapse1" />
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body">Pay when get product</div>
                            </div>
                        </div>
                        <div class="panel">
                            Accepted Cards
                            <input type="radio" data-toggle="collapse" data-parent="#accordion" href="#collapse2" />
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="well">
                                        <div class="row">
                                            <div class="icon-container">
                                                <i class="fa fa-cc-visa" style="color:navy;"></i>
                                                <i class="fa fa-cc-amex" style="color:blue;"></i>
                                                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                                <i class="fa fa-cc-discover" style="color:orange;"></i>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cname">Name on Card</label>
                                                    <input type="text" class="form-control"id="cname" name="cardname" placeholder="PHAM HAI HUY"  oninput="this.value = this.value.toUpperCase()">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="ccnum">Credit card number</label>
                                                    <input type="text" id="ccnum" class="form-control" placeholder="1111-2222-3333-4444">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="expmonth">Exp Month</label>
                                                    <input type="text" id="expmonth" class="form-control" placeholder="September">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="expyear">Exp Year</label>
                                                    <input type="text" id="expyear" class="form-control"  placeholder="2018">

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cvv">CVV</label>
                                                    <input type="text" id="cvv" class="form-control"  placeholder="352">
                                                </div>
                                            </div>     

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="panel ">
                            Online banking
                            <input type="radio" data-toggle="collapse" data-parent="#accordion" href="#collapse3" />
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body d-flex justify-content-center">
  <img src="images/bank.jpg" alt="Bank Image">
</div>
                            </div>
                        </div>
                    </div> 
                </div> 
            </div>


            <div class="modal-footer">

                <input type="submit" class="bg-blue-500 text-white py-2 px-4 rounded-lg  "   value="pay bill">
            </div>
            <p style="color: red;">${requestScope.messError}</p>
        </form>

</body>
</html>
