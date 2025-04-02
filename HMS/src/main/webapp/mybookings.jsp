<%@ page import="java.util.List, model.Booking, dao.BookingDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("emplogin.jsp");
        return;
    }
    List<Booking> bookings = BookingDAO.getBookingsByUsername(username);
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; }
        .container { width: 80%; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); margin-top: 50px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background: #333; color: white; }
        .sidebar { width: 250px; height: 100vh; background: #333; color: white; position: fixed; top: 0; left: -250px; transition: left 0.3s ease; padding-top: 60px; }
        .sidebar a { display: block; padding: 15px; color: white; text-decoration: none; transition: 0.3s; }
        .sidebar a:hover { background: #575757; }
        .open-btn { font-size: 20px; cursor: pointer; position: absolute; top: 20px; left: 20px; background: #333; color: white; padding: 10px 15px; border: none; border-radius: 5px; }
        .open-btn:hover { background: #575757; }
        .close-btn { position: absolute; top: 15px; right: 20px; font-size: 25px; cursor: pointer; }
    </style>
</head>
<body>
<button class="open-btn" onclick="openSidebar()">☰ Menu</button>
<div class="sidebar" id="sidebar">
    <% String img_add = (String) session.getAttribute("ProfileImg");
       if (img_add == null || img_add.isEmpty()) {
           img_add = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT67KDwRLAHUDYnezhqa4GElhHEb-qkUr_tIA&s.png";
       }
    %>
    <img src="<%= img_add %>" alt="Profile Picture" style="width: 60px; height: 60px; border-radius: 50%; margin-bottom: 10px;">
    <a href="#"><%= username %></a>
    <a href="javascript:void(0)" class="close-btn" onclick="closeSidebar()">×</a>
    <a href="profile.jsp">My Profile</a>
    <a href="mybookings.jsp">My Bookings</a>
    <a href="Offers.jsp">Offers</a>
    <a href="desk1.jsp">Destinations</a>
    <a href="desk2.jsp">Rooms</a>
    <a href="desk3.jsp">Dining</a>
    <a href="contact.jsp">Contact</a>
    <a href="introductionjfs.html">Logout</a>
</div>
    <div class="container">
        <h1>My Bookings</h1>
        <table>
            <tr>
                <th>Destination</th>
                <th>Date</th>
                <th>Guests</th>
                <th>Offer</th>
                <th>Price</th>
            </tr>
            <% for (Booking booking : bookings) { %>
            <tr>
                <td><%= booking.getDestination() %></td>
                <td><%= booking.getBookingDate() %></td>
                <td><%= booking.getGuests() %></td>
                <td><%= booking.getOffer() %></td>
                <td>₹<%= booking.getPrice() %></td>
            </tr>
            <% } %>
        </table>
    </div>
    <script>
        function openSidebar() { document.getElementById("sidebar").style.left = "0"; }
        function closeSidebar() { document.getElementById("sidebar").style.left = "-250px"; }
    </script>
</body>
</html>