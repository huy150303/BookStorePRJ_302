/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

public class Cart {
    private int orderId;
    private String bookTitle;
    private int quantity;
    private double unitPrice;
 
    public Cart() {
    }
    public Cart(int quantity) {
    this.quantity = quantity;
    }
   
    public Cart(int orderId, String bookTitle, int quantity, double unitPrice) {
        this.orderId = orderId;
        this.bookTitle = bookTitle;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }



    // Optional: Override toString() method for easier debugging
    @Override
    public String toString() {
        return "Cart{" +
                "orderId=" + orderId +
                ", bookTitle='" + bookTitle + '\'' +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                '}';
    }
}

