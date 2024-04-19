/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Orders {
    private int order_id;
    private int cus_id;
    private String address;
    private Date order_date;

    public Orders() {
    }

    public Orders(int order_id, int cus_id, String address, Date order_date) {
        this.order_id = order_id;
        this.cus_id = cus_id;
        this.address = address;
        this.order_date = order_date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    @Override
    public String toString() {
        return "Orders{" + "order_id=" + order_id + ", cus_id=" + cus_id + ", address=" + address + ", order_date=" + order_date + '}';
    }
    
}
