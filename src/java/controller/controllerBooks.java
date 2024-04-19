/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.BooksDAO;
import DAO.CustomersDAO;
import DAO.GenresDAO;
import DAO.OrderDAO;
import entity.Books;
import entity.Customers;
import entity.Genres;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name="contollerBooks", urlPatterns={"/books"})
public class controllerBooks extends HttpServlet {
   
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
             HttpSession session = request.getSession();
                     BooksDAO b=new BooksDAO();
     String service = request.getParameter("service");
            if (service == null) {
                service = "login";
            }
if (service.equals("login")) {
                String username = request.getParameter("username");
               
                String password = request.getParameter("password");
                CustomersDAO daoc = new CustomersDAO();
                Customers acc = daoc.login(username, password);
                if (acc != null) {
                    switch (acc.getIsAdmin()) {
                        case "TRUE" -> {
                            session.setAttribute("user", acc);
                            response.sendRedirect("admin?service=admin");
                        }
                        case "FALSE" -> {
                            session.setAttribute("user", acc);
                            response.sendRedirect("books?service=topSale");
                        }
                        default -> {
                            request.setAttribute("messError", "Username or password incorrect!");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    }
                   
                } else {
                     request.setAttribute("messError", "Username or password incorrect!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        if (service.equals("logout")) {

            session.invalidate();
            response.sendRedirect("login.jsp");
        }

if (service.equals("BooksPage")) {
    String indexPage = request.getParameter("index");
    String genreName = request.getParameter("genreName");
    String command = "b.book_id";
    if (indexPage == null) {
        indexPage = "1";
    }
    int index = Integer.parseInt(indexPage);
    int count = b.countBook();
    int endPage = count / 6;
    if (count % 6 != 0) {
        endPage++;
    }
    GenresDAO g = new GenresDAO();
    List<Genres> listg = g.getAllGenresAZ();
    request.setAttribute("data1", listg);   
    List<Books> list;
    if (genreName != null) {
        list = b.getBooksByGenre(genreName);
    request.setAttribute("data", list);
    } else {
        list = b.pagingBooks(command,index);
String error = (String) request.getAttribute("error"); 
request.setAttribute("errorStock", error); 
    
    request.setAttribute("data", list);
    request.setAttribute("ePage", endPage);
    request.setAttribute("tag", index);

    }

    request.getRequestDispatcher("product.jsp").forward(request, response);
}
if (service.equals("adminCustomerRegister")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String password2 = request.getParameter("repeatPassword");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String dob1 = request.getParameter("dob");
                String phone = request.getParameter("phone");

                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date dobUtil = sdf.parse(dob1);
                    java.sql.Date dob = new java.sql.Date(dobUtil.getTime());
                    CustomersDAO c= new CustomersDAO();


                    if (c.isUsernameExists(username)) {
                        request.setAttribute("messError", "Username already exists.");
                        request.getRequestDispatcher("/register.jsp").forward(request, response);
                        return;
                    }
                    if (!password.equals(password2)) {
                        request.setAttribute("messPassError", "Passwords do not match.");
                        request.getRequestDispatcher("/register.jsp").forward(request, response);
                        return;
                    }
                    Customers cus = new Customers(0, username, password, name, email, dob, phone, "FALSE");

                    c.insert(cus);
                    response.sendRedirect("login.jsp");
                } catch (ParseException e) {

                }
            }
     if (service.equals("contact")) {
 GenresDAO g = new GenresDAO();
    List<Genres> listg = g.getAllGenresAZ();
    request.setAttribute("data1", listg);   
 
   request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
     if (service.equals("topSale")) {
 GenresDAO g = new GenresDAO();
    List<Genres> listg = g.getAllGenresAZ();
    request.setAttribute("data1", listg); 
    List<Books> list = b.getTopSale();
    List<Books> newb = b.newBooks();
    List<Books> newc = b.topDiscount();
    request.setAttribute("data", list);   
    request.setAttribute("newb", newb);  
    request.setAttribute("newc", newc);
   request.getRequestDispatcher("home.jsp").forward(request, response);
        }
     if (service.equals("about")) {
 
 GenresDAO g = new GenresDAO();
    List<Genres> listg = g.getAllGenresAZ();
    request.setAttribute("data1", listg);   
 
   request.getRequestDispatcher("about.jsp").forward(request, response);
        }
                           
              if (service.equals("details")) {         
                  String id = request.getParameter("book_id");
                  int book_id =Integer.parseInt(id);
        List<Books> list=b.printBooksDetails(book_id);
        request.setAttribute("data", list);
         GenresDAO g = new GenresDAO();
         List<Genres> listg =  g.getGenreByBookId(book_id);
         request.setAttribute("data1", listg);
        request.getRequestDispatcher("details.jsp").forward(request, response);
        
             }
                     if (service.equals("getBookByName")) {
            String name=request.getParameter("name");
 GenresDAO g = new GenresDAO();
    List<Genres> listg = g.getAllGenresAZ();
    request.setAttribute("data1", listg); 
       BooksDAO d =new BooksDAO();
        try {
            List<Books> list = d.getBooksByName(name);
            request.setAttribute("data", list);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
}
                   if (service.equals("profile")) {
                       String id_raw=request.getParameter("id");
       OrderDAO d =new OrderDAO();
        int id;
        try {
            id=Integer.parseInt(id_raw);
             List<Orders> o = d.getOrdersByCustomerId(id);
            request.setAttribute("data", o);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
             }
                   if (service.equals("orderDelete")) {
    String order_id = request.getParameter("id");
    String userId = request.getParameter("cus_id");
    int orderID;
    try {
        orderID = Integer.parseInt(order_id);
        OrderDAO o = new OrderDAO();
        o.delete(orderID);
        
        response.sendRedirect("admincus?service=profile&id=" + userId);
    } catch (NumberFormatException e) {
    }
}
                   if (service.equals("newPassword")) {
                String id_raw = request.getParameter("id");
                String oldPass = request.getParameter("old_password");
                String password = request.getParameter("password");
                String newPass = request.getParameter("repeatPassword");
                 int id;
                        id = Integer.parseInt(id_raw);
                try {
                    if (oldPass == null || oldPass.isEmpty()) {
                        request.setAttribute("messOldPassError", "You haven't filled in your old password.");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } else if (oldPass.equals(password)) {
                        request.setAttribute("messOldPassError", "Cannot enter your old password.");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } else if (!password.equals(newPass)) {
                        request.setAttribute("messPassError", "Passwords do not match.");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } else {


                        CustomersDAO c = new CustomersDAO();
                        Customers cus = new Customers(id, password);
                        c.updatePass(cus);
                      
                        request.setAttribute("customer", cus);
                        request.setAttribute("successful", "successful.");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } 
                    

                } catch (NumberFormatException e) {
                }
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
        processRequest(request, response);
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
