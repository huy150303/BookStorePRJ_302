/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;
import java.sql.Date;
/**
 *
 * @author Admin
 */
public class Customers {
    private int cus_id;
    private String username;
    private String password;
    private String cus_name;
    private String email;
    private Date date_birth;
    private String phone;
    private String isAdmin;

    public Customers() {
    }

    
    public Customers(int cus_id,String password) {
        this.cus_id=cus_id;
        this.password = password;
    }
 
    public Customers(int cus_id, String username, String password, String cus_name, String email, Date date_birth,  String phone, String isAdmin) {
        this.cus_id = cus_id;
        this.username = username;
        this.password = password;
        this.cus_name = cus_name;
        this.email = email;
        this.date_birth = date_birth;
        this.phone = phone;
        this.isAdmin = isAdmin;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate_birth() {
        return date_birth;
    }

    public void setDate_birth(Date date_birth) {
        this.date_birth = date_birth;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Customers{" + "cus_id=" + cus_id + ", username=" + username + ", password=" + password + ", cus_name=" + cus_name + ", email=" + email + ", date_birth=" + date_birth +  ", phone=" + phone + ", isAdmin=" + isAdmin + '}';
    }



    



    
    
}
