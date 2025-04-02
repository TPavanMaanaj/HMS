package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import factory.DBConn;

public class Register {

    public boolean registerUser(String username, String password, String email, String phone) {
        boolean isRegistered = false;
        try {
            Connection conn = DBConn.getConnection();
            String query = "INSERT INTO users (username, password, email, phone) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);
            stmt.setString(4, phone);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                isRegistered = true;
            }
            
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }
}