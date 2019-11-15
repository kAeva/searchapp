package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerVerification {
    public static boolean checkUser(String login,String password)
    {
        boolean status = false;
        try(Connection connection = ConnectionFactory.getConnection()) {

            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE name=? OR email=? AND password=?");
            ps.setString(1, login);
            ps.setString(2, login);
            ps.setString(3, password);
            ResultSet rs =ps.executeQuery();
            status = rs.next();

        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
