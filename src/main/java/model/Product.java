package model;

import java.util.UUID;

public class Product {
    private UUID uuid;
    private int id;
    private String productName;
    private int quant;
    private double price;
    private String category;
    private String description;
    private String sectionNum;


    public Product(int id, String productName, int quant, double price, String category, String description, String sectionNum) {
        this.id = id;
        this.productName = productName;
        this.quant = quant;
        this.price = price;
        this.category = category;
        this.description = description;
        this.sectionNum = sectionNum;
        uuid = UUID.randomUUID();
    }

    public Product(int id, String productName, int quant, int price, String no, String description, String s){
    }

    public Product() {

    }

    public UUID getUuid() {
        return uuid;
    }

    public String getProductName() {
        return productName;
    }

    public int getQuant() {
        return quant;
    }

    public double getPrice() {
        return price;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setUuid() {
        uuid = UUID.randomUUID();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSectionNum() {
        return sectionNum;
    }

    public void setSectionNum(String sectionNum) {
        this.sectionNum = sectionNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String toString() {
        return getProductName() + " - " + getDescription();
    }
}
