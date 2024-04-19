/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Customers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CustomersDAO extends DBcontext{
     public List<Customers> getAll() {
        List<Customers> list = new ArrayList<>();
        //
        String sql = "SELECT * FROM [dbo].[Customers]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customers c = new Customers(rs.getInt("cus_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("cus_name"),
                        rs.getString("email"),
                        rs.getDate("date_birth"),
                        rs.getString("phone"),
                        rs.getString("isAdmin"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
     public List<Customers> searchNameOrUserName(String name) {
        List<Customers> list = new ArrayList<>();
        //
        String sql = "select * from Customers where username like ? or cus_name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" +name+ "%");
            st.setString(2, "%" +name+ "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customers c = new Customers(rs.getInt("cus_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("cus_name"),
                        rs.getString("email"),
                        rs.getDate("date_birth"),
                        rs.getString("phone"),
                        rs.getString("isAdmin"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
      public int countCustomers(){
         String sql ="Select count(*) from customers";
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
public Customers login(String username, String password) {
    try {
        String sql = "select * from Customers where username = ? and password = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, username);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Customers user = new Customers(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8));
            return user;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}
public boolean isUsernameExists(String username) {
    String sql = "SELECT * FROM Customers WHERE username = ?";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, username); 
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return true;
        }
    } catch (SQLException e) {
        e.printStackTrace(); 
    }
    return false; 
}

       public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Customers]\n"
                + "      WHERE cus_id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }

 public  void insert(Customers c){
        String sql="insert into [dbo].[Customers]  values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.setString(3, c.getCus_name());
            st.setString(4, c.getEmail());
            st.setDate(5, c.getDate_birth());
            st.setString(6, c.getPhone());
            st.setString(7, c.getIsAdmin());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
  public Customers getCustomerById(int id){
    String sql = "SELECT * FROM [dbo].[Customers] WHERE cus_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                Customers c = new Customers(
                    rs.getInt("cus_id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("cus_name"),
                    rs.getString("email"),
                    rs.getDate("date_birth"),
                    rs.getString("phone"),
                    rs.getString("isAdmin")
                );
                return c;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
public void updatePass(Customers c){
    String sql="UPDATE [dbo].[Customers]\n" +
               "SET [password] = ?\n" + 
               "WHERE cus_id = ?;";
    try {
        PreparedStatement st=connection.prepareStatement(sql);
        st.setString(1, c.getPassword());
        st.setInt(2, c.getCus_id());
        st.executeUpdate();
    } catch (SQLException e) {
        
    }
}

  public void update(Customers c){
        String sql="UPDATE [dbo].[Customers]\n" +
"SET [username] = ?,\n" +
"    [password] = ?,\n" +
"    [cus_name] = ?,\n" +
"    [email] = ?,\n" +
"    [date_birth] = ?,\n" +
"    [Phone] = ?,\n" +
"    [isAdmin] = ?\n" +
"WHERE cus_id = ?;";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.setString(3, c.getCus_name());
            st.setString(4, c.getEmail());
            st.setDate(5, c.getDate_birth());
            st.setString(6, c.getPhone());
            st.setString(7, c.getIsAdmin());
            st.setInt(8, c.getCus_id());
            st.executeUpdate();
        } catch (SQLException e) {
            
        }
    }

     public static void main(String[] args) {
    // Assuming you have initialized your database connection before
    // For demonstration purposes, let's assume connection is an instance of Connection
    
    // Create an instance of CustomersDAO
    CustomersDAO customersDAO = new CustomersDAO();

    // Assuming you have a customer ID to delete
  

    // Call the delete method
   List<Customers> customersList = customersDAO.getAll();

    for (Customers customer : customersList) {
        System.out.println(customer);
    }
}
}




