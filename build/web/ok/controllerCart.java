/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BooksDAO;
import DAO.OrderDAO;
import DAO.OrderItemsDAO;
import entity.Books;
import entity.Cart;
import entity.OrderItem;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "controllerCart", urlPatterns = {"/cart"})
public class controllerCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
                BooksDAO b = new BooksDAO();
            String service = request.getParameter("service");
            if (service == null) {
                service = "showCart";
            }
            if (service.equals("showCart")) {
    response.sendRedirect("showCart.jsp");
            }
   if (service.equals("addToCart")) {
    String bid = request.getParameter("id");


    Books book = (Books) session.getAttribute(bid);
    int bid2 =Integer.parseInt(bid);
    List<Books> list = (List<Books>) b.getBookById(bid2); 
    if (book == null ) {
        Cart od = new Cart(1);
        
        int id = list.get(0).getBook_id(); 
        String Title = list.get(0).getTitle(); 
        String image = list.get(0).getImage();
        double price = list.get(0).getUnit_Price();
        double discount = list.get(0).getDiscount();
        String error = list.get(0).getError();
        book = new Books(id, Title, price,image,discount, od,error);
        int quantity = list.get(0).getQuantity();
         if (quantity > 0 && book.getQuantity() < quantity-1) {  
             session.setAttribute(bid, book);
         }else{
             request.setAttribute("error", "We're out of stock of: "+Title);
             request.getRequestDispatcher("books?service=BooksPage").forward(request, response);
         }
        
        
    } else {
        int quantity = list.get(0).getQuantity();
        if (quantity > 0 && book.getQuantity() < quantity-1) {
           Cart od = book.getOrderItem();
        od.setQuantity(od.getQuantity() + 1);
        book.setQuantity(book.getQuantity() + 1);
        book.setOrderItem(od); 
        }else{
            request.setAttribute("error", "We're out of stock of: "+book.getTitle()+" ");
            request.getRequestDispatcher("books?service=BooksPage").forward(request, response);
        }
        
    }


   request.getRequestDispatcher("showCart.jsp").forward(request, response);
  
}
           if (service.equals("addCart")) {
    String proID = request.getParameter("id");
    Books pro = (Books) session.getAttribute(proID);
    int id = Integer.parseInt(proID);
    
    
    List<Books> list = (List<Books>) b.getBookById(id);
    
    if (!list.isEmpty()) {

        int quantity = list.get(0).getQuantity();

        if (quantity > 0 && pro.getQuantity() < quantity-1) {

            Cart od = pro.getOrderItem();
            od.setQuantity(od.getQuantity() + 1);
            pro.setOrderItem(od);
            pro.setQuantity(pro.getQuantity() + 1);
        } else {

            pro.setError("We're out of stock for this book");
            request.getRequestDispatcher("showCart.jsp").forward(request, response);
            return; 
        }
    } else {

        pro.setError( "Book not found");
        request.getRequestDispatcher("showCart.jsp").forward(request, response);
        return; 
    }


    request.getRequestDispatcher("showCart.jsp").forward(request, response);
}


                        if (service.equals("minusCart")) {
    String proID = request.getParameter("id");          
    Books pro = (Books) session.getAttribute(proID);
    
    if (pro != null) {
        Cart od = pro.getOrderItem();
        int currentQuantity = od.getQuantity();
        
        if (currentQuantity > 1) {
            od.setQuantity(currentQuantity - 1);
            pro.setOrderItem(od);
            pro.setQuantity(pro.getQuantity() - 1); 
            pro.setError("");
        }
    }
    
    request.getRequestDispatcher("showCart.jsp").forward(request, response);
}
                           if (service.equals("deleteItem")) {
    String id = request.getParameter("id");
    if (id != null) {
        session.removeAttribute(id); 
        response.sendRedirect("showCart.jsp"); 
        return;
    }
}
if (service.equals("checkOut")) {
    java.util.Enumeration<String> attributeNames = session.getAttributeNames();
    boolean hasProductInCart = false;
    while (attributeNames.hasMoreElements()) {
        String attributeName = attributeNames.nextElement();
        if (!attributeName.equals("user")) {
            Books book = (Books) session.getAttribute(attributeName);
            if (book != null) {
                hasProductInCart = true;
                break; 
            }
        }
    }
    if (!hasProductInCart) {
        request.setAttribute("messError", "Don't have any products in cart");
        request.getRequestDispatcher("showCart.jsp").forward(request, response);
    } else {
        response.sendRedirect("checkOut.jsp");
    }
}

if (service.equals("OrderInsert")) {
    String id = request.getParameter("id");
    String address = request.getParameter("address");
    String[] proIds = request.getParameterValues("proid");
    String[] quantities = request.getParameterValues("quantity");
    String[] prices = request.getParameterValues("price");
    
    int cus_id = Integer.parseInt(id);
    
    OrderDAO g = new OrderDAO();
    java.util.Date currentDate = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
    Orders o = new Orders(0, cus_id, address, sqlDate);
    g.insert(o);
    OrderItemsDAO dao = new OrderItemsDAO();
    List<Orders> orderList = g.getOrderJustInsert();

    if (!orderList.isEmpty()) {
        Orders currentOrder = orderList.get(0); 
        int insertedId = currentOrder.getOrder_id();

        if (proIds != null && quantities != null && prices != null) {
            for (int i = 0; i < proIds.length; i++) {
                int pro_id = Integer.parseInt(proIds[i]);
                double totalPrice = Double.parseDouble(prices[i]);
                int quantity1 = Integer.parseInt(quantities[i]);
                OrderItem oi = new OrderItem(insertedId, pro_id, quantity1, totalPrice);
                dao.insert(oi);
                
                List<Books> books = b.getBookById(pro_id);
                
                if (!books.isEmpty()) {
                    Books book = books.get(0);
                    int currentQuantity = book.getQuantity();
                    book.setQuantity(currentQuantity - quantity1);
                    b.update(book);
                                        
                }
            }
        }
    }
    
    // Redirect to insertDone servlet
    response.sendRedirect("cart?service=insertDone");
}




if (service.equals("insertDone")) {
        java.util.Enumeration<String> attributeNames = session.getAttributeNames();
        while(attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            if(!attributeName.equals("user")) {
                session.removeAttribute(attributeName);
            }
        }
        request.setAttribute("successful", "Order placed successfully");
       request.getRequestDispatcher("books?service=BooksPage").forward(request, response);
}

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
