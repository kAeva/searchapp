package DAO;

import controller.ConnectionFactory;
import model.User;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Optional;


public class UserDao implements Dao<User> {
    public UserDao() {
    }

    private static User extractProductFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        return user;
    }


    @Override
    public Optional<User> get(long id) {
        return Optional.empty();
    }

    @Override
    public List<User> getAll() {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            List users = new ArrayList();
            while (rs.next()) {
                User user = extractProductFromResultSet(rs);
                users.add(user);
            }
            return users;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public void save(User user) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO users VALUES (NULL, ?, ?, ?)");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("something's wrong with the user saving");
        }
    }

    @Override
    public void update(User user, String[] params) throws SQLException {
        user.setName(Objects.requireNonNull(
                params[0], "User name cannot be null"));
        user.setEmail(Objects.requireNonNull(
                params[1], "Email can't be null"));
        user.setPassword(Objects.requireNonNull(
                params[2], "Password can't be null"));


        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("UPDATE users SET name=?, email=?, password=?");

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public void delete(User user) throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement stmt = connection.createStatement();
            stmt.executeUpdate("DELETE FROM users WHERE id=" + user.getId());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
