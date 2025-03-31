package factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
    private static final String URL = "jdbc:mysql://localhost:3306/hms_data";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Change this to your MySQL password

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class name
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found. Make sure it's added to the classpath!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Database connection failed. Check URL, username, or password.");
            e.printStackTrace();
        }
        return conn;
    }
}
