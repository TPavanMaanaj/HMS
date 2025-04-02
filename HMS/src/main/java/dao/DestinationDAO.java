package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Destinations;
import factory.DBConn;

public class DestinationDAO {
    public Destinations getDestinationByName(String name) {
        Destinations destination = null;
        try {
            Connection con = DBConn.getConnection();
            String query = "SELECT * FROM destination WHERE Name = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                destination = new Destinations();
                destination.setName(rs.getString("Name"));
                destination.setData(rs.getString("Data"));
                destination.setImage(rs.getString("Image"));
                destination.setBackgroundImage(rs.getString("BackgroundImage"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return destination;
    }
}