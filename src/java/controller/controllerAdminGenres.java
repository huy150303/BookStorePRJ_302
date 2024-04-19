/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.BookGenresDAO;
import DAO.BooksDAO;
import DAO.GenresDAO;
import entity.Books;
import entity.Genres;
import entity.bookGenres;
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
@WebServlet(name="controllerAdminGenres", urlPatterns={"/admingenres"})
public class controllerAdminGenres extends HttpServlet {
   
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
            GenresDAO g = new GenresDAO();
            if (service == null) {
                service = "admingenres";
            }
             if (service.equals("admingenres")) {
                
                List<Genres> listg = g.getAll();
                request.setAttribute("data", listg);
                request.getRequestDispatcher("admin/GenresList.jsp").forward(request, response);
            }
             if (service.equals("GenresOfBooks")) {
                String genreName = request.getParameter("genreName");
                BooksDAO b = new BooksDAO();
                List<Books> list = b.getBooksByGenre(genreName);
                request.setAttribute("data", list);
                request.getRequestDispatcher("admin/GenresDetail.jsp").forward(request, response);
            }
            if (service.equals("InsertGenresOfBooks")) {
                String genreName = request.getParameter("genreName");
                String ID = request.getParameter("book_id");
                int bookID = Integer.parseInt(ID);
                BookGenresDAO b = new BookGenresDAO();
                int id_genre = b.getGenreIDByGenreName(genreName);
                bookGenres genres = new bookGenres(bookID, id_genre);
                b.insert(genres);
                request.setAttribute("Notification", "Insert book success ");
                request.getRequestDispatcher("admingenres?service=GenresOfBooks").forward(request, response);
            }
                        if (service.equals("deleteBookOfGenres")) {
                String genreName = request.getParameter("genreName");
                String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    BookGenresDAO genres = new BookGenresDAO();
                    genres.delete(id);
                    response.sendRedirect("admingenres?service=GenresOfBooks&genreName=" + genreName);
                } catch (NumberFormatException e) {

                }

            }
                        if (service.equals("getGenresByName")) {
                String name = request.getParameter("name");
                
                try {
                    List<Genres> list = g.getGenresByName(name);
                    request.setAttribute("data", list);
                    request.getRequestDispatcher("admin/GenresList.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
                                    if (service.equals("getGenreById")) {
            String id_raw=request.getParameter("id");
        int id;
        try {
            id=Integer.parseInt(id_raw);
            Genres o =g.getGenreById(id);
            request.setAttribute("genres", o);
            request.getRequestDispatcher("admin/updateGenres.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
}
                                    
                        if (service.equals("deleteGenres")) {
                String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    g.delete(id);
                    response.sendRedirect("admingenres?service=admingenres");
                } catch (NumberFormatException e) {

                }

            }
                if (service.equals("adminGenresInsert")) {
                String genre_name = request.getParameter("genreName");
                Genres genres = new Genres(0, genre_name);
                g.insert(genres);
                request.setAttribute("Notification", "Insert genre successed ");
                response.sendRedirect("admingenres?service=admingenres");
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
            String genre_id = request.getParameter("id");
            String genre_name = request.getParameter("genre_name");
            int id;
    try {
        id =Integer.parseInt(genre_id);
        GenresDAO dao = new GenresDAO();
        Genres order = new Genres(id,genre_name);
        dao.update(order);

        response.sendRedirect("admingenres?service=admingenres");

    } catch (NumberFormatException e) {
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
