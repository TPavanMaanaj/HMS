package model;

import java.sql.Timestamp;

public class Employee {
    private String ename;
    private String role;
    private String hotelName;
    private double sal;
    private Timestamp loginTime;
    private Timestamp logoutTime;

    // Getters and Setters
    public String getEname() { return ename; }
    public void setEname(String ename) { this.ename = ename; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getHotelName() { return hotelName; }
    public void setHotelName(String hotelName) { this.hotelName = hotelName; }

    public double getSal() { return sal; }
    public void setSal(double sal) { this.sal = sal; }

    public Timestamp getLoginTime() { return loginTime; }
    public void setLoginTime(Timestamp loginTime) { this.loginTime = loginTime; }

    public Timestamp getLogoutTime() { return logoutTime; }
    public void setLogoutTime(Timestamp logoutTime) { this.logoutTime = logoutTime; }
}
