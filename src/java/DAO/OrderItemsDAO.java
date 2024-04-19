/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.OrderItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderItemsDAO extends DBcontext{
    public List<OrderItem> getAll(int id) {
    List<OrderItem> list = new ArrayList<>();
    
    String sql = "SELECT o.order_id, b.book_id, oi.quantity, oi.price FROM Order_Items oi " +
                 "JOIN Orders o ON o.order_id = oi.order_id " +
                 "JOIN Books b ON b.book_id = oi.book_id " +
                 "WHERE o.order_id = ?";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, id);  // Set the parameter value for the order ID
        ResultSet rs = st.executeQuery();
        
        while (rs.next()) {
            // Create an instance of OrderItem using the retrieved data
            OrderItem oi = new OrderItem(
                rs.getInt("order_id"),
                rs.getInt("book_id"),
                rs.getInt("quantity"),
                rs.getDouble("price")
            );
            list.add(oi);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    
    return list;
}
     public  void insert(OrderItem o){
        String sql="insert into [dbo].[Order_Items]  values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getOrderId());
            st.setInt(2, o.getBook_id());
            st.setInt(3, o.getQuantity());
            st.setDouble(4, o.getUnitPrice());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }


  public static void main(String[] args) {
      // Establish database connection
      
      OrderItemsDAO dao = new OrderItemsDAO();
      // Test with a specific order ID
      int orderId = 1; // Change this to the desired order ID for testing
      // Call the getAll method to retrieve order items for the specified order ID
      List<OrderItem> orderItemList = dao.getAll(orderId);
      // Print the retrieved order items
      for (OrderItem orderItem : orderItemList) {
          System.out.println(orderItem);
      }
      
      // Close the connection
    }



}
