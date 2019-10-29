package model;

import java.util.UUID;

public class Product {

    private String productName;
    private double price;
    private int quant;
    private UUID uuid;

    public Product(String productName, int quant, double price) {
        this.productName = productName;
        this.quant = quant;
        this.price = price;
        uuid = UUID.randomUUID();
    }

    public Product(){
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
}
