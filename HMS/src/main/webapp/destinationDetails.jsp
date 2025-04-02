<%@ page import="model.Destinations" %>
<%@ page import="model.Booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Ensure user is logged in
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("emplogin.jsp");
        return;
    }

    // Retrieve background image
    String img_ad = (String) session.getAttribute("BackgroundImage");
    if (img_ad == null || img_ad.isEmpty()) {
        img_ad = "default_background.jpg"; // Provide a default image if none is set
    }

    // Retrieve profile image
    String img_add = (String) session.getAttribute("ProfileImg");
    if (img_add == null || img_add.isEmpty()) {
        img_add = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT67KDwRLAHUDYnezhqa4GElhHEb-qkUr_tIA&s.png";
    }

    // Retrieve destination details
    Destinations destination = (Destinations) session.getAttribute("destination");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Destination Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
            background-image: url('<%= img_ad %>');
            background-size: cover;
            background-position: center;
        }
        .container {
            width: 70%;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .destination-img {
            width: 100%;
            height: 300px;
            border-radius: 10px;
            object-fit: cover;
            margin-top: 10px;
        }
        .booking-form {
            margin-top: 30px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .booking-form input, .booking-form select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .booking-form button {
            background: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .booking-form button:hover {
            background: #218838;
        }
        .offers-section {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .offer-card {
            width: 250px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 15px;
            text-align: center;
        }
        .offer-card h3 {
            color: #C2934C;
        }
        .offer-card p {
            font-size: 16px;
            color: #666;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #333;
            color: white;
            position: fixed;
            top: 0;
            left: -250px;
            transition: left 0.3s ease;
            padding-top: 60px;
        }
        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #575757;
        }
        .open-btn {
            font-size: 20px;
            cursor: pointer;
            position: absolute;
            top: 20px;
            left: 20px;
            background: #333;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
        }
        .open-btn:hover {
            background: #575757;
        }
        .close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 25px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<button class="open-btn" onclick="openSidebar()">☰ Menu</button>
<div class="sidebar" id="sidebar">
    <img src="<%= img_add %>" alt="Profile Picture" style="width: 60px; height: 60px; border-radius: 50%; margin-bottom: 10px;">
    <a href="#"><%= (String)session.getAttribute("username") %></a>
    <a href="javascript:void(0)" class="close-btn" onclick="closeSidebar()">×</a>
    <a href="profile.jsp">My Profile</a>
    <a href="mybookings.jsp">My Bookings</a>
    <a href="Offers.jsp">Offers</a>
    <a href="desk1.jsp">Destinations</a>
    <a href="desk2.jsp">Rooms</a>
    <a href="desk3.jsp">Dining</a>
    <a href="contact.jsp">Contact</a>
    <a href="logout.jsp">Logout</a>
</div>

<!-- Destination Details -->
<% if (destination != null) { %>
<div class="container">
    <h1><%= destination.getName() %></h1>
    <img src="<%= destination.getImage() %>" class="destination-img">
    <p><%= destination.getData() %></p>

    <!-- Booking Form -->
    <div class="booking-form">
        <h2>Book Your Trip</h2>
        <form action="BookingServlet" method="post">
            <input type="hidden" name="destination" value="<%= destination.getName() %>">
            <label for="date">Select Date:</label>
            <input type="date" id="date" name="date" required>
            <label for="guests">Number of Guests:</label>
            <input type="number" id="guests" name="guests" min="1" required>
            <label for="offers">Choose Offer:</label>
            <select id="offers" name="offer">
                <option value="Standard Package">Standard Package - ₹10,000</option>
                <option value="Deluxe Package">Deluxe Package - ₹15,000</option>
                <option value="Premium Package">Premium Package - ₹20,000</option>
            </select>
            <button type="submit">Book Now</button>
        </form>
    </div>
</div>
<% } else { %>
<h2>No Destination Found</h2>
<% } %>

<script>
    function openSidebar() { document.getElementById("sidebar").style.left = "0"; }
    function closeSidebar() { document.getElementById("sidebar").style.left = "-250px"; }
</script>
</body>
</html>
