    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.Books;

/**
 *
 * @author Admin
 */
public class BooksDAO extends DBcontext{
     public List<Books> getAll() {
        List<Books> list = new ArrayList<>();
     
        String sql = "SELECT * FROM [dbo].[Books]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
     public List<Books> getAllBooksRunOut() {
        List<Books> list = new ArrayList<>();
     
        String sql = "SELECT *\n" +
"FROM books b\n" +
"WHERE b.quantity < 10\n" ;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
      public int countBooksRunOut(){
         String sql ="SELECT count(*)\n" +
"FROM books b\n" +
"WHERE b.quantity < 10";
         try {
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                    return rs.getInt(1);
            }
      
             } catch (SQLException e) {
        e.printStackTrace();
    }
         return 0;
     
     }
          public List<Books> bookHaveSale(String sql) {
        List<Books> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getInt("quantity"),
                        rs.getInt("total_price")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
             public List<Books> bookDateHaveSale(String month,String year) {
        List<Books> list = new ArrayList<>();
       String sql = "SELECT\n" +
"    b.book_id,\n" +
"    b.image,\n" +
"    b.title,\n" +
"    b.author,\n" +
"    COALESCE(SUM(oi.quantity), 0) AS quantity,\n" +
"    COALESCE(SUM(oi.quantity) * b.Unit_price, 0) AS Total_price\n" +
"FROM\n" +
"    books b\n" +
"LEFT JOIN\n" +
"    Order_Items oi ON b.book_id = oi.book_id  \n" +
"	join orders o on oi.order_id=o.order_id\n" +
"	WHERE MONTH(order_date) = ?\n" +
"AND YEAR(order_date) = ?\n" +
"GROUP BY\n" +
"    b.book_id, b.title, b.image, b.author, b.Unit_price\n" +
"ORDER BY\n" +
"    quantity DESC, Total_price DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,month );
            st.setString(2,year );
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("image"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getInt("quantity"),
                        rs.getInt("total_price")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
     public int countBook(){
         String sql ="Select count(*) from books";
         try {
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                    return rs.getInt(1);
            }
      
             } catch (SQLException e) {
        e.printStackTrace();
    }
         return 0;
     
     }
     public List<Books> getTopSale() {
        List<Books> list = new ArrayList<>();
     
        String sql = "SELECT TOP 3 b.* FROM books b\n" +
"JOIN Order_Items oi ON oi.book_id = b.book_id\n" +
"order by oi.quantity DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
          public List<Books> newBooks() {
        List<Books> list = new ArrayList<>();
     
        String sql = "SELECT TOP 3 b.* FROM books b order by book_id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
                    public List<Books> topDiscount() {
        List<Books> list = new ArrayList<>();
     
        String sql = "select TOP 3 * from books order by discount DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
     public List<Books> pagingBooks(String command,int index){
         List<Books> list = new ArrayList<>();
         String sql = "select * from books b order by "+command+" offset ? row fetch next 6 rows only ";
         try {
             PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,(index-1)*6);
             ResultSet rs = st.executeQuery();
             while(rs.next()){
                 list.add(new Books(rs.getInt("book_id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("image"),
                    rs.getString("description"),
                    rs.getString("Publishing_company"),
                    rs.getInt("Supplier_id"),
                    rs.getInt("quantity"),
                    rs.getString("Language"),
                    rs.getDouble("Unit_Price"),
                    rs.getDouble("discount")));
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return list;
     }


public List<Books> printBooksDetails(int id) {
    List<Books> list = new ArrayList<>();
    String sql = "SELECT b.book_id, b.title, b.author, b.image, b.description, b.Publishing_company, b.Language, s.supplier_name, b.Unit_Price, b.discount\n" +
                 "FROM [dbo].[Books] b \n" +
                 "JOIN Suppliers s ON s.supplier_id = b.supplier_id \n" +
                 "WHERE b.book_id = ?;";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, id);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Books b = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getString("supplier_name"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                list.add(b);
            }
        }
    } catch (SQLException ex) {
       System.out.println(ex);
    }

    return list;
}


public List<Books> getBookById(int id) {
    List<Books> books = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[Books] WHERE book_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Books c = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                books.add(c);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return books;
}

public List<Books> getBooksByName(String name) {
    String sql = "SELECT * FROM [dbo].[Books] WHERE title LIKE ?;";
    List<Books> booksList = new ArrayList<>();
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, "%" + name + "%");
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Books c = new Books(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("Publishing_company"),
                        rs.getInt("Supplier_id"),
                        rs.getInt("quantity"),
                        rs.getString("Language"),
                        rs.getDouble("Unit_Price"),
                        rs.getDouble("discount")
                );
                booksList.add(c);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return booksList;
}

  public void update(Books b){
        String sql="UPDATE [dbo].[Books]\n" +
"   SET [title] = ?\n" +
"      ,[author] = ?\n" +
"      ,[image] = ?\n" +
"      ,[description] = ?\n" +
"      ,[Publishing_company] = ?\n" +
"      ,[supplier_id] = ?\n" +
"      ,[quantity] = ?\n" +            
"      ,[Language] = ?\n" +
"      ,[Unit_Price] = ?\n" +
"      ,[discount] = ?\n" +
" WHERE book_id = ?;";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, b.getTitle());
            st.setString(2, b.getAuthor());
            st.setString(3, b.getImage());
            st.setString(4, b.getDescription());
            st.setString(5, b.getPublishing_company());
            st.setInt(6, b.getSupplier_id());
            st.setInt(7, b.getQuantity());
            st.setString(8, b.getLanguage());
            st.setDouble(9, b.getUnit_Price());
            st.setDouble(10, b.getDiscount());
            st.setInt(11, b.getBook_id());
            st.executeUpdate();
        } catch (SQLException e) {
            
        }
    }
     public void deletebook(int id) {
        String sql = "BEGIN TRANSACTION;\n" +
"\n" +
"-- Delete records from the \"Order_Items\" table where book_id = 2\n" +
"DELETE FROM Order_Items WHERE book_id = ?;\n" +
"\n" +
"-- Delete records from the \"Books\" table where book_id = 2\n" +
"DELETE FROM Books WHERE book_id = ?;\n" +
"\n" +
"COMMIT;";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, id);
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }
      public  void insert(Books b){
        String sql="insert into [dbo].[Books]  values(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getTitle());
            st.setString(2, b.getAuthor());
            st.setString(3, b.getImage());
            st.setString(4, b.getDescription());
            st.setString(5, b.getPublishing_company());
            st.setInt(6, b.getSupplier_id());
            st.setInt(7, b.getQuantity());
            st.setString(8, b.getLanguage());
            st.setDouble(9, b.getUnit_Price());
            st.setDouble(10, b.getDiscount());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Books> getBooksByGenre(String genreName) {
        List<Books> books = new ArrayList<>();
        String sql = "SELECT Books.* FROM Books " +
                     "INNER JOIN Book_Genres ON Books.book_id = Book_Genres.book_id " +
                     "INNER JOIN Genres ON Book_Genres.genre_id = Genres.genre_id " +
                     "WHERE Genres.genre_name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, genreName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books book = new Books(rs.getInt("book_id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("image"),
                    rs.getString("description"),
                    rs.getString("Publishing_company"),
                    rs.getInt("Supplier_id"),
                    rs.getInt("quantity"),
                    rs.getString("Language"),
                    rs.getDouble("Unit_Price"),
                    rs.getDouble("discount")
                        
                );
                books.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return books;
    }


    public static void main(String[] args) {
        // Create an instance of your class where the bookDateHaveSale method is defined
        BooksDAO dao = new BooksDAO();

        // Assuming you have a database connection already established in your class
        // And assuming the connection is stored in a variable called 'connection'

        // Provide a month and year for which you want to retrieve book sales data
        String month = "03"; // Example month
        String year = "2024"; // Example year

        // Call the method to retrieve the books with sales data for the given month and year
        List<Books> booksWithSales = dao.bookDateHaveSale(month, year);

        // Display the retrieved books
        for (Books book : booksWithSales) {
            System.out.println("Book ID: " + book.getBook_id());
            System.out.println("Title: " + book.getTitle());
            System.out.println("Author: " + book.getAuthor());
            System.out.println("Quantity Sold: " + book.getQuantity());

            System.out.println("--------------------");
        }



  }
}

