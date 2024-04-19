/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Books {

    private int book_id;
    private String title;
    private String author;
    private String image;
    private String description;
    private String Publishing_company;
    private int Supplier_id;
    private int quantity;
    private String Language;
    private double Unit_Price;
    private Cart OrderItem;
    private double discount;
    private String Supplier_name;
    private String error;
    private double total_price;
    public Books() {
    }

    public Books(int book_id, String title, Double Unit_Price,String image,double discount,Cart od,String error) {
        this.OrderItem = od;
        this.book_id = book_id;
        this.title = title;
        this.Unit_Price = Unit_Price;
        this.image = image;
        this.discount=discount;
        this.error=error;
    }
      public Books(int book_id, String image,String title,String author,int quantity,double total_price ) {
    this.book_id = book_id;
    this.image = image;
    this.title = title;
    this.author = author;
    this.quantity = quantity;
    this.total_price = total_price;
    }
  public Books(int book_id, String title, String author, String image, String description, String Publishing_company, String Supplier_name, String Language, double Unit_Price, double discount) {
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.description = description;
        this.Publishing_company = Publishing_company;
        this.Supplier_name = Supplier_name;
        this.Language = Language;
        this.Unit_Price = Unit_Price;
        this.discount = discount;
    }

    public Books(int book_id, String title, String author, String image, String description, String Publishing_company, int Supplier_id, int quantity, String Language, double Unit_Price, double discount) {
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.description = description;
        this.Publishing_company = Publishing_company;
        this.Supplier_id = Supplier_id;
        this.quantity = quantity;
        this.Language = Language;
        this.Unit_Price = Unit_Price;
        this.discount = discount;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

   



    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublishing_company() {
        return Publishing_company;
    }

    public void setPublishing_company(String Publishing_company) {
        this.Publishing_company = Publishing_company;
    }

    public int getSupplier_id() {
        return Supplier_id;
    }

    public void setSupplier_id(int Supplier_id) {
        this.Supplier_id = Supplier_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSupplier_name() {
        return Supplier_name;
    }

    public void setSupplier_name(String Supplier_name) {
        this.Supplier_name = Supplier_name;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    

    public String getLanguage() {
        return Language;
    }

    public void setLanguage(String Language) {
        this.Language = Language;
    }

    public double getUnit_Price() {
        return Unit_Price;
    }

    public void setUnit_Price(double Unit_Price) {
        this.Unit_Price = Unit_Price;
    }

    public Cart getOrderItem() {
        return OrderItem;
    }

    public void setOrderItem(Cart OrderItem) {
        this.OrderItem = OrderItem;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Books{" + "book_id=" + book_id + ", title=" + title + ", author=" + author + ", image=" + image + ", description=" + description + ", Publishing_company=" + Publishing_company + ", Supplier_id=" + Supplier_id + ", quantity=" + quantity + ", Language=" + Language + ", Unit_Price=" + Unit_Price + ", OrderItem=" + OrderItem + ", discount=" + discount + ", Supplier_name=" + Supplier_name + ", error=" + error + ", total_price=" + total_price + '}';
    }





 

}
