package model;

import controller.ConnectionFactory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import java.util.Optional;
import java.util.Objects;


public class ProductDao implements Dao<Product> {
    private List<Product> products = new ArrayList<>();


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
        product.setSectionNum( rs.getString("sec_n") );
        return product;
    }

    @Override
    public Optional<Product> get(long id) {
        return Optional.empty();
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
            PreparedStatement ps = connection.prepareStatement("INSERT INTO products VALUES (NULL, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, product.getProductName());
            ps.setInt(2, product.getQuant());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getCategory());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getSectionNum());

            int i = ps.executeUpdate();

            if (i == 1) {
                System.out.println("product saved");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("smth's wrong with the product saving");

        }
        System.out.println("out from the saving method");
    }

    @Override
    public void update(Product product, String[] params) {
        Connection connection = ConnectionFactory.getConnection();


        product.setProductName(Objects.requireNonNull(
                    params[1], "Product name cannot be null"));
        product.setDescription(Objects.requireNonNull(
                    params[5], "No descr"));

        products.add(product);


//        try {
//            PreparedStatement ps = connection.prepareStatement("UPDATE products SET id=?, item=?, quantity=?, price=?, category=?, description=?, sec_n=? WHERE id=?");
//
//            ps.setInt( 1, product.getId());
//            ps.setString(2, product.getProductName());
//            ps.setInt(3, product.getQuant());
//            ps.setDouble(4, product.getPrice());
//            ps.setString(5, product.getCategory());
//            ps.setString(6, product.getDescription());
//            ps.setString(7, product.getSectionNum());
//            ps.setInt(8, product.getId());
//
//            int i = ps.executeUpdate();
//            if(i == 1) {
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
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

    public Product getProduct(String searchkey) {

    Connection connection = ConnectionFactory.getConnection();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE item LIKE '%" + searchkey + "%'");
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

