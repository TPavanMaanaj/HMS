package dao;

import model.Booking;
import factory.DBConn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Insert Booking
    public static boolean insertBooking(Booking booking) {
        boolean success = false;
        try (Connection conn = DBConn.getConnection()) {
            String sql = "INSERT INTO bookings (username, destination, booking_date, guests, offer, price) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, booking.getUsername());
            stmt.setString(2, booking.getDestination());
            stmt.setDate(3, new java.sql.Date(booking.getBookingDate().getTime()));
            stmt.setInt(4, booking.getGuests());
            stmt.setString(5, booking.getOffer());
            stmt.setDouble(6, booking.getPrice());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Retrieve bookings by username
    public static List<Booking> getBookingsByUsername(String username) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConn.getConnection()) {
            String sql = "SELECT * FROM bookings WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUsername(rs.getString("username"));
                booking.setDestination(rs.getString("destination"));
                booking.setBookingDate(rs.getDate("booking_date"));
                booking.setGuests(rs.getInt("guests"));
                booking.setOffer(rs.getString("offer"));
                booking.setPrice(rs.getDouble("price"));

                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
}
