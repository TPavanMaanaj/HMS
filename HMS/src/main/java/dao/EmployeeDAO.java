package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
import factory.DBConn;

public class EmployeeDAO {
    // Get Employees under the same hotel but not managers
	public static Employee validateEmployee(String ename, String password) {
        Employee emp = null;
        try (Connection conn = DBConn.getConnection()) {
            String sql = "SELECT * FROM employee WHERE Ename=? AND Password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, ename);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) { 
                emp = new Employee();
                emp.setEname(rs.getString("Ename"));
                emp.setRole(rs.getString("Role"));
                emp.setHotelName(rs.getString("Hotelname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }
	
    public static List<Employee> getEmployeesByHotel(String hotelName) {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection conn = DBConn.getConnection()) {
            String sql = "SELECT Ename, Role, Sal, LoginTime, LogoutTime FROM employee WHERE Hotelname=? AND Role != 'Manager'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, hotelName);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEname(rs.getString("Ename"));
                emp.setRole(rs.getString("Role"));
                emp.setSal(rs.getDouble("Sal"));
                emp.setLoginTime(rs.getTimestamp("LoginTime"));
                emp.setLogoutTime(rs.getTimestamp("LogoutTime"));
                employeeList.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    // Get Hotel Name by Manager
    public static String getHotelByManager(String managerName) {
        String hotelName = "";
        try (Connection conn = DBConn.getConnection()) {
            String sql = "SELECT hotelname FROM employee WHERE ename = ? AND role = 'Manager'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, managerName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                hotelName = rs.getString("hotelname");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotelName;
    }
}