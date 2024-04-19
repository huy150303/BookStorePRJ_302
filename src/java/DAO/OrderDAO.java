/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Orders;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBcontext{
    public List<Orders> getAll() {
        List<Orders> list = new ArrayList<>();
        //
        String sql = "SELECT * FROM [dbo].[Orders]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt("order_id"),rs.getInt("cus_id"),rs.getString("address"),rs.getDate("order_date"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
        public void delete(int id) {
        String sql = "delete from Orders where order_id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }
        
    public Orders getOrderById(int id){
    String sql = "SELECT * FROM [dbo].[Orders] WHERE order_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                Orders o = new Orders(
                    rs.getInt("order_id"),
                    rs.getInt("cus_id"),
                    rs.getString("address"),
                    rs.getDate("order_date")
                   
                );
                return o;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
    public List<Orders> getOrdersById(int id) {
    List<Orders> ordersList = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[Orders] WHERE order_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Orders o = new Orders(
                    rs.getInt("order_id"),
                    rs.getInt("cus_id"),
                    rs.getString("address"),
                    rs.getDate("order_date")
                );
                ordersList.add(o);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return ordersList;
}

public List<Orders> getOrdersByCustomerId(int customerId) {
    List<Orders> ordersList = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[Orders] WHERE cus_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, customerId);
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Orders o = new Orders(
                    rs.getInt("order_id"),
                    rs.getInt("cus_id"),
                    rs.getString("address"),
                    rs.getDate("order_date")
                );
                ordersList.add(o);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return ordersList;
}
public List<Orders> getAllOrderInTime() {
        List<Orders> list = new ArrayList<>();
        //
        String sql = "SELECT *\n" +
"FROM [dbo].[Orders]\n" +
"WHERE MONTH(order_date) = MONTH(GETDATE())\n" +
"AND YEAR(order_date) = YEAR(GETDATE());";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt("order_id"),rs.getInt("cus_id"),rs.getString("address"),rs.getDate("order_date"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
 public int countOrders(){
         String sql ="SELECT count(*)\n" +
"FROM [dbo].[Orders]\n" +
"WHERE MONTH(order_date) = MONTH(GETDATE())\n" +
"AND YEAR(order_date) = YEAR(GETDATE());";
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
public void update(Orders c) {
    String sql = "UPDATE [dbo].[Orders] " +
                 "SET " +
                 "[cus_id] = ?, " +
                 "[address] = ?, " +
                 "[order_date] = ? " +
                 "WHERE [order_id] = ?";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, c.getCus_id());
        st.setString(2, c.getAddress());
        java.util.Date utilDate = c.getOrder_date();
java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
st.setDate(3, sqlDate);
        st.setInt(4, c.getOrder_id());
        st.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
    }
}
 public  void insert(Orders o){
        String sql="insert into [dbo].[Orders]  values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getCus_id());
            st.setString(2, o.getAddress());
            st.setDate(3, (Date) o.getOrder_date());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
     public List<Orders> getOrderJustInsert() {
        List<Orders> list = new ArrayList<>();
        //
        String sql = "SELECT TOP(1) * FROM dbo.Orders o ORDER BY o.order_id DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt("order_id"),rs.getInt("cus_id"),rs.getString("address"),rs.getDate("order_date"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
 public static void main(String[] args) {
        // Assuming you have a database connection named 'connection'
        // Create an instance of your Orders class
        Orders orders = new Orders();
        OrderDAO dao = new OrderDAO();
        // Test with a customer ID
        int customerId = 2; 
        
        
 List<Orders> ordersList = dao.getOrdersByCustomerId(customerId);
            
            // Print the retrieved orders
            for (Orders order : ordersList) {
                System.out.println(order);
            }
    }
}
