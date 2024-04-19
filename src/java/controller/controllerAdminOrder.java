/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.OrderDAO;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name="controllerAdminOrder", urlPatterns={"/adminorder"})
public class controllerAdminOrder extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            OrderDAO o = new OrderDAO();
           String service = request.getParameter("service");
            if (service == null) {
                service = "admin";
            }
            if (service.equals("admin")) {
                List<Orders> list = o.getAll();
                request.setAttribute("data", list);
                request.getRequestDispatcher("admin/ordersList.jsp").forward(request, response);
            }
            if (service.equals("getOrderById")) {
            String id_raw=request.getParameter("id");
        int id;
        try {
            id=Integer.parseInt(id_raw);
            Orders order =(Orders) o.getOrderById(id);
            request.setAttribute("order", order);
            request.getRequestDispatcher("admin/updateOrder.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
}
            if (service.equals("adminOrderInsert")) {
                String id = request.getParameter("id");
                String address = request.getParameter("address");
                String order_date = request.getParameter("date");
                
                int genre_id = Integer.parseInt(id);
                OrderDAO g = new OrderDAO();
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dateOfBirth = dateFormat.parse(order_date);
        java.sql.Date sqlDate = new java.sql.Date(dateOfBirth.getTime());
                Orders order= new Orders(0,genre_id,address ,sqlDate);
                g.insert(order);
                request.setAttribute("Notification", "Insert order successed ");
                request.getRequestDispatcher("adminorder?service=admin").forward(request, response);
            }
            
            if (service.equals("getOrderByID")) {
                int id =Integer.parseInt(request.getParameter("id"));
                
                try {
                    List<Orders> list = o.getOrdersById(id);
                    request.setAttribute("data", list);
                    request.getRequestDispatcher("admin/ordersList.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
             if (service.equals("deleteOrder")) {
                String order_id = request.getParameter("id");
                int orderID;
                try {
                    orderID = Integer.parseInt(order_id);
                    o.delete(orderID);
                    response.sendRedirect("adminorder");
                } catch (NumberFormatException e) {

                }
            }
        } catch (ParseException ex) {
            Logger.getLogger(controllerAdminOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    String order_id = request.getParameter("id");
    String cus_id = request.getParameter("cus_id");
    String address = request.getParameter("address");
    String order_date = request.getParameter("order_date");

    int id, c_id;
    try {
        id = Integer.parseInt(order_id);
        c_id = Integer.parseInt(cus_id);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dateOfBirth = dateFormat.parse(order_date);
        
        // Convert java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(dateOfBirth.getTime());

        OrderDAO dao = new OrderDAO();
        Orders order = new Orders(id, c_id, address, sqlDate);
        dao.update(order);

        response.sendRedirect("adminorder?service=admin");

    } catch (NumberFormatException | ParseException e) {
        e.printStackTrace();
    }
}

    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

