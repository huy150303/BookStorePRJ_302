/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BooksDAO;
import DAO.CustomersDAO;
import DAO.OrderDAO;
import entity.Books;
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
@WebServlet(name = "controllerAdmin", urlPatterns = {"/admin"})
public class controllerAdminBooks extends HttpServlet {

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
            CustomersDAO c = new CustomersDAO();
            OrderDAO o = new OrderDAO();
            String service = request.getParameter("service");
            if (service == null) {
                service = "admin";
            }
            if (service.equals("admin")) {
                String indexPage = request.getParameter("index");
                String command = request.getParameter("command");

                if (command == null || command.isEmpty()) {
                    command = (String) session.getAttribute("command");
                    if (command == null || command.isEmpty()) {
                        command = "b.book_id";
                    }
                } else {
                    session.setAttribute("command", command);
                }

                if (indexPage == null) {
                    indexPage = "1";
                }

                int index = Integer.parseInt(indexPage);
                int count = b.countBook();
                int endPage = count / 6;
                if (count % 6 != 0) {
                    endPage++;
                }

                List<Books> list;
                int countOrder = o.countOrders();
                int countCus = c.countCustomers();
                int countBooksRunout = b.countBooksRunOut();
                list = b.pagingBooks(command, index);
                int booksCount = b.countBook();
                request.setAttribute("booksCount", booksCount);
                request.setAttribute("countBooksRunout", countBooksRunout);
                request.setAttribute("orders", countOrder);
                request.setAttribute("user", countCus);
                request.setAttribute("data", list);
                request.setAttribute("ePage", endPage);
                request.setAttribute("tag", index);

                request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
            }
            if (service.equals("AllBooksRunOut")) {
                List<Books> list;
                list = b.getAllBooksRunOut();
                request.setAttribute("bookRunOut", list);
                int countOrder = o.countOrders();
                int countCus = c.countCustomers();
                int countBooksRunout = b.countBooksRunOut();
                int booksCount = b.countBook();
                request.setAttribute("booksCount", booksCount);
                request.setAttribute("countBooksRunout", countBooksRunout);
                request.setAttribute("orders", countOrder);
                request.setAttribute("user", countCus);
                request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
            }

            if (service.equals("AllOrdersInTime")) {
                List<Orders> list;
                list = o.getAllOrderInTime();
                request.setAttribute("OrderInTime", list);
                int countOrder = o.countOrders();
                int countCus = c.countCustomers();
                int countBooksRunout = b.countBooksRunOut();
                int booksCount = b.countBook();
                request.setAttribute("booksCount", booksCount);
                request.setAttribute("countBooksRunout", countBooksRunout);
                request.setAttribute("orders", countOrder);
                request.setAttribute("user", countCus);
                request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
            }
            if (service.equals("quantityBookSale")) {
                String sql = "SELECT \n"
                        + "    b.book_id,\n"
                        + "    b.image,\n"
                        + "    b.title,\n"
                        + "    b.author,\n"
                        + "    COALESCE(SUM(oi.quantity), 0) AS quantity,\n"
                        + "    COALESCE(SUM(oi.quantity) * b.Unit_price, 0) AS Total_price\n"
                        + "FROM \n"
                        + "    books b\n"
                        + "LEFT JOIN \n"
                        + "    Order_Items oi ON b.book_id = oi.book_id\n"
                        + "GROUP BY \n"
                        + "    b.book_id, b.title, b.image, b.author, b.Unit_price\n"
                        + "ORDER BY \n"
                        + "    quantity DESC, Total_price DESC\n";

                List<Books> list;
                list = b.bookHaveSale(sql);
                request.setAttribute("datac", list);
                int countOrder = o.countOrders();
                int countCus = c.countCustomers();
                int countBooksRunout = b.countBooksRunOut();
                int booksCount = b.countBook();
                request.setAttribute("booksCount", booksCount);
                request.setAttribute("countBooksRunout", countBooksRunout);
                request.setAttribute("orders", countOrder);
                request.setAttribute("user", countCus);
                request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
            }
            if (service.equals("selectDateSaleBook")) {
                
               String month = request.getParameter("month");
               String year = request.getParameter("year");
                List<Books> list;
                list = b.bookDateHaveSale(month, year);
                request.setAttribute("selectDate", list);
                int countOrder = o.countOrders();
                int countCus = c.countCustomers();
                int countBooksRunout = b.countBooksRunOut();
                int booksCount = b.countBook();
                request.setAttribute("booksCount", booksCount);
                request.setAttribute("countBooksRunout", countBooksRunout);
                request.setAttribute("orders", countOrder);
                request.setAttribute("user", countCus);
                request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
            }
            if (service.equals("adminBookInsert")) {
                String title = request.getParameter("title");
                String author = request.getParameter("author");
                String image = request.getParameter("image");
                String description = request.getParameter("description");
                String Publishing_company = request.getParameter("Publishing_company");
                String Supplier_id = request.getParameter("Supplier_id");
                String quantity_raw = request.getParameter("quantity");
                String Language = request.getParameter("Language");
                String price = request.getParameter("Unit_Price");
                String discount1 = request.getParameter("discount");
                int quantity = Integer.parseInt(quantity_raw);
                int sid = Integer.parseInt(Supplier_id);
                double Unit_Price = Double.parseDouble(price);
                double discount = Double.parseDouble(discount1);

                Books books = new Books(0, title, author, image, description, Publishing_company, sid, quantity, Language, Unit_Price, discount);
                b.insert(books);

                request.setAttribute("Notification", "Insert book successed ");
                request.getRequestDispatcher("admin?service=admin").forward(request, response);
            }

            if (service.equals("deleteBooks")) {
                String id_book = request.getParameter("id");
                int bookid;
                try {
                    bookid = Integer.parseInt(id_book);
                    b.deletebook(bookid);
                    response.sendRedirect("admin");
                } catch (NumberFormatException e) {

                }
            }
            if (service.equals("getBookById")) {
                String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    List<Books> book = b.getBookById(id);
                    request.setAttribute("book", book);
                    request.getRequestDispatcher("admin/updateBook.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
            if (service.equals("getBookByName")) {
                String name = request.getParameter("name");
                BooksDAO d = new BooksDAO();
                try {
                    List<Books> list = d.getBooksByName(name);
                    request.setAttribute("data", list);
                    request.getRequestDispatcher("admin/adminPage.jsp").forward(request, response);
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
        String id = request.getParameter("book_id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String publishingCompany = request.getParameter("Publishing_company");
        String sid = request.getParameter("Supplier_id");
        String quantity_raw = request.getParameter("quantity");
        String language = request.getParameter("Language");
        double unitPrice = Double.parseDouble(request.getParameter("Unit_Price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        if (image == null || image.isEmpty()) {
            image = request.getParameter("old_image");
        }

        try {

            int book_id = Integer.parseInt(id);
            int sp_id = Integer.parseInt(sid);
            int quantity = Integer.parseInt(quantity_raw);

            if (quantity < 0) {
                response.sendRedirect("admin?service=getBookById&id=" + id);
            } else {

                BooksDAO dao = new BooksDAO();
                Books book = new Books(book_id, title, author, image, description,
                        publishingCompany, sp_id, quantity, language, unitPrice, discount);
                dao.update(book);
            }
            response.sendRedirect("admin?service=admin");
        } catch (NumberFormatException e) {
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
