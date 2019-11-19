package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    public static final String URL = "jdbc:mysql://localhost:3306/prodapp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    public static final String driver = "com.mysql.cj.jdbc.Driver";
    public static final String USER = "root";
    public static final String PASS = "6666";


    public static Connection getConnection()
    {
        try {
            Class.forName(driver);
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException | ClassNotFoundException ex) {
            throw new RuntimeException("Error connecting to the database", ex);
        }
    }
}