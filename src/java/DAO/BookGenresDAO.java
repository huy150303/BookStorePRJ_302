/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Genres;
import entity.bookGenres;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BookGenresDAO extends DBcontext{
public String getGenreNameByBookId(int bookId) {
        String genreName = null;
        String sql = "SELECT Genres.genre_name FROM [dbo].[Genres] " +
                     "INNER JOIN [dbo].[Book_Genres] ON Genres.genre_id = Book_Genres.genre_id " +
                     "WHERE Book_Genres.book_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                genreName = rs.getString("genre_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return genreName;
    }
// Truy lai ten ra id de insert
public int getGenreIDByGenreName(String name) {
    String sql = "SELECT g.genre_id FROM [dbo].[Genres] g\n" +
                 "WHERE g.genre_name = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, name);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            int id = rs.getInt("genre_id");
            return id; 
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return 0; 
}

   public  void insert(bookGenres g){
        String sql="insert into [dbo].[Book_Genres]  values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, g.getBook_id());
            st.setInt(2, g.getGenre_id());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
       public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Book_Genres]\n"
                + "      WHERE book_id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }
  public static void main(String[] args) {
    BookGenresDAO dao = new BookGenresDAO(); 

    try {

        int genreId = dao.getGenreIDByGenreName("horror");
        System.out.println("Genre ID for 'horror': " + genreId);

    }catch (Exception e) {
        e.printStackTrace();
    }
 
    
}

}
