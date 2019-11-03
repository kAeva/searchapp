package model;

import controller.ConnectionFactory;
import java.sql.* ;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class ProductDao implements Dao<Product> {

    public ProductDao(){
    }

    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId( rs.getInt("id") );
        product.setProductName( rs.getString("item") );
        product.setQuant( rs.getInt("quantity") );
        product.setPrice( rs.getDouble("price") );
        product.setCategory( rs.getString("category") );
        product.setDescription( rs.getString("description") );
        product.setSectionNum( rs.getInt("sec_n") );
        return product;
    }

    @Override
    public List getAll() {
        Connection connection = ConnectionFactory.getConnection();

        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");
            List products = new ArrayList();
            while(rs.next())
            {
                Product product = extractProductFromResultSet(rs);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public void save(Product product) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO products VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, product.getId());
            ps.setString(2, product.getProductName());
            ps.setInt(3, product.getQuant());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getCategory());
            ps.setString(6, product.getDescription());
            ps.setInt(7, product.getSectionNum());

            int i = ps.executeUpdate();

            if(i == 1) {
                System.out.println("product saved");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("smth's wrong with the product saving");

        }
        System.out.println("smth's wrong with the product saving");
    }

    @Override
    public void update(Product product, String[] params) {
        Connection connection = ConnectionFactory.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE products SET id=?, item=?, quantity=?, price=?, category=?, description=?, sec_n=? WHERE id=?");

            ps.setInt(1, product.getId());
            ps.setString(2, product.getProductName());
            ps.setInt(3, product.getQuant());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getCategory());
            ps.setString(6, product.getDescription());
            ps.setInt(7, product.getSectionNum());

            int i = ps.executeUpdate();
            if(i == 1) {
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void delete(Product product) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM products WHERE id=" + product.getId());
            if(i == 1) {
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Product getProduct(int id) {

        Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE id=" + id);
            if(rs.next())
            {
                return extractProductFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}

