package dao;

import model.Room;
import factory.DBConn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    public static boolean assignRoom(Room room) {
        try (Connection con = DBConn.getConnection()) {
            String query = "INSERT INTO rooms (guest_name, room_type, check_in_date, check_out_date, room_number, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, room.getGuestName());
            ps.setString(2, room.getRoomType());
            ps.setDate(3, new java.sql.Date(room.getCheckInDate().getTime()));
            ps.setDate(4, new java.sql.Date(room.getCheckOutDate().getTime()));
            ps.setInt(5, room.getRoomNumber());
            ps.setString(6, room.getStatus());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        try (Connection con = DBConn.getConnection()) {
            String query = "SELECT * FROM rooms";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setGuestName(rs.getString("guest_name"));
                room.setRoomType(rs.getString("room_type"));
                room.setCheckInDate(rs.getDate("check_in_date"));
                room.setCheckOutDate(rs.getDate("check_out_date"));
                room.setRoomNumber(rs.getInt("room_number"));
                room.setStatus(rs.getString("status"));

                rooms.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }
}
