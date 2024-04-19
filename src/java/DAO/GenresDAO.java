/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Genres;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GenresDAO extends DBcontext{
     public List<Genres> getAll() {
        List<Genres> list = new ArrayList<>();
        //
        String sql = "SELECT * FROM [dbo].[Genres]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genres g = new Genres(rs.getInt("genre_id"),
                        rs.getString("genre_name"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
     public List<Genres> getAllGenresAZ() {
        List<Genres> list = new ArrayList<>();
        //
        String sql = "SELECT * FROM [dbo].[Genres] order by genre_name ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genres g = new Genres(rs.getInt("genre_id"),
                        rs.getString("genre_name"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
          public List<Genres> getGenresByName(String name) {
        List<Genres> list = new ArrayList<>();
        //
        String sql = "SELECT * FROM [dbo].[Genres] where genre_name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,"%"+name+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genres g = new Genres(rs.getInt("genre_id"),
                        rs.getString("genre_name"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
         public Genres getGenreById(int id){
    String sql = "SELECT * FROM [dbo].[Genres] WHERE genre_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                Genres g = new Genres(
                    rs.getInt("genre_id"),
                    rs.getString("genre_name")                 
                );
                return g;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
     
                  public List<Genres> getGenreByBookId(int id){
                      List<Genres> list = new ArrayList<>();
    String sql = "SELECT g.genre_name \n" +
"FROM [dbo].[Genres] g \n" +
"JOIN [dbo].[Book_Genres] bg ON g.genre_id = bg.genre_id\n" +
"JOIN [dbo].[Books] b ON b.book_id = bg.book_id\n" +
"WHERE b.book_id = ?;";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
             while (rs.next()) {
                Genres g = new Genres(
                    rs.getString("genre_name")                 
                );
                list.add(g);
            }
             
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}
     public void update(Genres g) {
    String sql = "UPDATE [dbo].[Genres] " +
                 "SET " +
                 "[genre_name] = ? " +
                 "WHERE [genre_id] = ?";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, g.getGenre_name());
        st.setInt(2, g.getGenre_id());
        st.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
    }
}
         public  void insert(Genres g){
        String sql="insert into [dbo].[Genres]  values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, g.getGenre_name());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
         
public void delete(int id) {
    String sql = "DELETE FROM [dbo].[Genres] WHERE genre_id=?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    } catch (SQLException e) {
        // Handle or log the SQLException
        e.printStackTrace();
    }
}


    public static void main(String[] args) {
        


    
}

}
