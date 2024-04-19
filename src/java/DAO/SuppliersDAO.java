/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Suppliers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SuppliersDAO extends DBcontext{
    public List<Suppliers> getAll() {
        List<Suppliers> list = new ArrayList<>();
        //
        String sql = "SELECT * FROM [dbo].[Suppliers]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Suppliers o = new Suppliers(rs.getInt("supplier_id"),rs.getString("supplier_name"),rs.getString("Address"),rs.getString("Phone"),rs.getString("email"),rs.getString("HomePage"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    public void delete(int id) {
        String sql = "delete from Suppliers where supplier_id=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }

    public Suppliers getSuppliersById(int id) {
    String sql = "SELECT * FROM [dbo].[Suppliers] WHERE supplier_id = ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, id);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                Suppliers c = new Suppliers(rs.getInt("supplier_id"),rs.getString("supplier_name"),rs.getString("Address"),rs.getString("Phone"),rs.getString("email"),rs.getString("HomePage")
                );
                return c;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
    public List<Suppliers> searchSuppliersName(String name) {
        List<Suppliers> list = new ArrayList<>();
        //
        String sql = "select * from Suppliers where supplier_name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" +name+ "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
            Suppliers s = new Suppliers(rs.getInt("supplier_id"),rs.getString("supplier_name"),rs.getString("Address"),rs.getString("Phone"),rs.getString("email"),rs.getString("HomePage"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
         public void update(Suppliers s) {
    String sql = "UPDATE [dbo].[Suppliers]\n" +
"   SET [supplier_name] = ?\n" +
"      ,[Address] = ?\n" +
"      ,[Phone] = ?\n" +
"      ,[email] = ?\n" +
"      ,[HomePage] = ?\n" +
" WHERE supplier_id = ?";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, s.getSupplier_name());
        st.setString(2, s.getAddress());
        st.setString(3, s.getPhone());
        st.setString(4, s.getEmail());
        st.setString(5, s.getHomePage());
        st.setInt(6, s.getSupplier_id());
        st.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
    }
}
          public  void insert(Suppliers s){
        String sql="insert into [dbo].[Suppliers]  values(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, s.getSupplier_name());
        st.setString(2, s.getAddress());
        st.setString(3, s.getPhone());
        st.setString(4, s.getEmail());
        st.setString(5, s.getHomePage());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void main(String[] args) {
        SuppliersDAO dao = new SuppliersDAO();

    // Assuming you have a customer ID to delete
    int supplierId = 1; // Change this to the desired supplier ID
    Suppliers supplier = dao.getSuppliersById(supplierId);

    // Call the delete method



        System.out.println(supplier);
    
    }
}
