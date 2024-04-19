    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CustomersDAO;
import entity.Customers;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "controllerAdminBooks", urlPatterns = {"/admincus"})
public class controllerAdminCustomer extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            CustomersDAO c = new CustomersDAO();
            if (service == null) {
                service = "admincus";
            }
            if (service.equals("admincus")) {
                
                List<Customers> listc = c.getAll();
                request.setAttribute("data", listc);
                request.getRequestDispatcher("admin/customerList.jsp").forward(request, response);
            }
            if (service.equals("adminCustomerInsert")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String dob1 = request.getParameter("dob");
                String phone = request.getParameter("phone");

                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date dobUtil = sdf.parse(dob1);
                    java.sql.Date dob = new java.sql.Date(dobUtil.getTime());

                    Customers cus = new Customers(0, username, password, name, email, dob, phone, "FALSE");
                    c.insert(cus);
                    request.setAttribute("Notification", "Insert customer successed ");
                    request.getRequestDispatcher("admincus?service=admincus").forward(request, response);
                } catch (ParseException e) {

                }
            }
            

               if (service.equals("getCusByName")) {
                String name = request.getParameter("name");
                
                try {
                    List<Customers> list = c.searchNameOrUserName(name);
                    request.setAttribute("data", list);
                    request.getRequestDispatcher("admin/customerList.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }


            if (service.equals("getCustomerById")) {
                String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    Customers cus = c.getCustomerById(id);
                    request.setAttribute("customer", cus);
                    request.getRequestDispatcher("admin/updateCustomer.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
            if (service.equals("deleteCustomers")) {
                String cus_id = request.getParameter("cus_id");
                int cusid;
                try {
                    cusid = Integer.parseInt(cus_id);
                    c.delete(cusid);
                    response.sendRedirect("admincus");
                } catch (NumberFormatException e) {

                }
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
        String id_raw = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cus_name = request.getParameter("cus_name");
        String email = request.getParameter("email");
        String date_birth_str = request.getParameter("date_birth");
        String phone = request.getParameter("phone");
        String isAdmin = request.getParameter("isAdmin");

        int id;
        try {
            id = Integer.parseInt(id_raw);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date_birth = dateFormat.parse(date_birth_str);
            java.sql.Date sqlDate = new java.sql.Date(date_birth.getTime());

            CustomersDAO customersDAO = new CustomersDAO();
            Customers c = new Customers(id, username, password, cus_name, email, sqlDate, phone, isAdmin);
            customersDAO.update(c);
            response.sendRedirect("admincus?service=admincus");

        } catch (NumberFormatException | ParseException e) {
        }
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
