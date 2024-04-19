/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Suppliers {
    private int supplier_id;
    private String supplier_name;
    private String Address;
    private String Phone;
    private String email;
    private String HomePage;

    public Suppliers() {
    }

    public Suppliers(int supplier_id, String supplier_name, String Address, String Phone, String email, String HomePage) {
        this.supplier_id = supplier_id;
        this.supplier_name = supplier_name;
        this.Address = Address;
        this.Phone = Phone;
        this.email = email;
        this.HomePage = HomePage;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getSupplier_name() {
        return supplier_name;
    }

    public void setSupplier_name(String supplier_name) {
        this.supplier_name = supplier_name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHomePage() {
        return HomePage;
    }

    public void setHomePage(String HomePage) {
        this.HomePage = HomePage;
    }

  
    
}
