package model;

import controller.ConnectionFactory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Optional;


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
        try (Connection connection = ConnectionFactory.getConnection();) {
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
        try (Connection connection = ConnectionFactory.getConnection();) {
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
    public void update(Product product, String[] params) throws SQLException {
        product.setProductName(Objects.requireNonNull(
                    params[1], "Product name cannot be null"));
        product.setDescription(Objects.requireNonNull(
                    params[5], "No descr"));
//to do: add other parameters

        products.add(product);
        try (Connection connection = ConnectionFactory.getConnection();) {
            PreparedStatement ps = connection.prepareStatement("UPDATE products SET item=?, quantity=?, price=?, category=?, description=?, sec_n=? WHERE id=?");

            ps.setString(1, product.getProductName());
            ps.setInt(2, product.getQuant());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getCategory());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getSectionNum());
            ps.setInt(7, product.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                System.out.println("product saved");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public void delete(Product product) throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection();) {
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM products WHERE id=" + product.getId());
            if (i == 1) {
                System.out.println("product saved");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Product getProduct(String searchkey) throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection();) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE item LIKE '%" + searchkey + "%'");
            if(rs.next())
            {
                return extractProductFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }  return null;
    }

}

