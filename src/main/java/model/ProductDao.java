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

    public ProductDao() {
    }

    private static Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setProductName(rs.getString("item"));
        product.setQuant(rs.getInt("quantity"));
        product.setPrice(rs.getDouble("price"));
        product.setCategory(rs.getString("category"));
        product.setDescription(rs.getString("description"));
        product.setSectionNum(rs.getString("sec_n"));
        return product;
    }


    @Override
    public Optional<Product> get(long id) {
        return Optional.empty();
    }

    @Override
    public List<Product> getAll() {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");
            List products = new ArrayList();
            while (rs.next()) {
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
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO products VALUES (NULL, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, product.getProductName());
            ps.setInt(2, product.getQuant());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getCategory());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getSectionNum());

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("smth's wrong with the product saving");
        }
    }

    @Override
    public void update(Product product, String[] params) throws SQLException {
        product.setProductName(Objects.requireNonNull(
                params[0], "Product name cannot be null"));
        product.setQuant(Integer.parseInt(Objects.requireNonNull(
                params[1], "Quantity can't be null")));
        product.setPrice(Float.parseFloat(Objects.requireNonNull(
                params[2], "Price can't be null")));
        product.setCategory(Objects.requireNonNull(
                params[3], "Category can't be null"));
        product.setDescription(Objects.requireNonNull(
                params[4], "No description"));
        product.setSectionNum(Objects.requireNonNull(
                params[5], "Section number can't be null"));

        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("UPDATE products SET item=?, quantity=?, price=?, category=?, description=?, sec_n=? WHERE id=?");

            ps.setString(1, product.getProductName());
            ps.setInt(2, product.getQuant());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getCategory());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getSectionNum());
            ps.setInt(7, product.getId());

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public void delete(Product product) throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            stmt.executeUpdate("DELETE FROM products WHERE id=" + product.getId());

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static Product getProduct(int id) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE id=" + id);
            if (rs.next()) {
                return extractProductFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static List<Product> searchProduct(String searchkey) {
        List<Product> prodsList = new ArrayList<>();
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE item LIKE '%" + searchkey + "%'");

            while (rs.next()) {
                Product currentItem = extractProductFromResultSet(rs);
                prodsList.add(currentItem);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return prodsList;
    }
}

