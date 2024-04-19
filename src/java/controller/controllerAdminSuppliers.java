/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.SuppliersDAO;
import entity.Suppliers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="controllerAdminSuppliers", urlPatterns={"/adminsuppliers"})
public class controllerAdminSuppliers extends HttpServlet {
   
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
String service = request.getParameter("service");
SuppliersDAO s = new SuppliersDAO();
            if (service == null) {
                service = "admin";
            }
            if (service.equals("admin")) {
                
                List<Suppliers> list = s.getAll();
                request.setAttribute("data", list);
                request.getRequestDispatcher("admin/suppliersList.jsp").forward(request, response);
            }
             if (service.equals("delete")) {
                String id = request.getParameter("id");
                int ID;
                try {
                    ID = Integer.parseInt(id);
                    s.delete(ID);
                    response.sendRedirect("adminsuppliers");
                } catch (NumberFormatException e) {

                }
            }
             if (service.equals("getSuppliersByName")) {
                String name = request.getParameter("name");
                
                try {
                    List<Suppliers> list = s.searchSuppliersName(name);
                    request.setAttribute("data", list);
                    request.getRequestDispatcher("admin/suppliersList.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
                         if (service.equals("getSuppliersById")) {
            String id_raw=request.getParameter("id");
       SuppliersDAO d =new SuppliersDAO();
        int id;
        try {
            id=Integer.parseInt(id_raw);
            Suppliers suplliers =(Suppliers) s.getSuppliersById(id);
            request.setAttribute("data", suplliers);
            request.getRequestDispatcher("admin/updateSuppliers.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
}
                                     if (service.equals("adminSuppliersInsert")) {
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String homepage = request.getParameter("homepage");
                Suppliers o= new Suppliers(0,name,address ,phone,email,homepage);
                s.insert(o);
                request.setAttribute("Notification", "Insert book success ");
                response.sendRedirect("adminsuppliers?service=admin");
            }
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String homepage = request.getParameter("homepage");
            try {

            int sp_id = Integer.parseInt(id);

            SuppliersDAO dao = new SuppliersDAO();
            Suppliers suppliers = new Suppliers(sp_id, name, address,phone, email,homepage);
            dao.update(suppliers);

            response.sendRedirect("adminsuppliers?service=admin");
      
        
    } catch (NumberFormatException e) {
        e.printStackTrace();
        // Handle NumberFormatException
    }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
