<%@ page import="model.Login" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotels</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

        /* Sidebar styles */
        .sidebar {
            width: 200px;
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
        .container {
        padding-left:120px;
            padding-top: 100px;
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .hotel-card {
            background: white;
            width: 250px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .hotel-card:hover {
            transform: scale(1.05);
        }

        .hotel-card img {
            width: 100%;
            height: 150px;
            border-radius: 10px;
            object-fit: cover;
        }

        .hotel-card h3 {
            margin: 10px 0;
            font-size: 1.2rem;
            color: #333;
        }

        .hotel-card p {
            font-size: 0.9rem;
            color: #666;
        }

        .book-btn {
            display: inline-block;
            padding: 8px 15px;
            background: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            font-size: 14px;
        }

        .book-btn:hover {
            background: #0056b3;
        }
        .profile{
        	width:20px;
        	height:20px;
        	border-radius:50;
        }
    </style>
</head>
<body>
<div style="text-align:center; padding-left:20px;"><h1 style="text-align:center;">Smartz Hotels</h1>
    <button class="open-btn" onclick="openSidebar()">☰ Menu</button>

    <div class="sidebar" id="sidebar">
    <%
    String img_add = (String) session.getAttribute("ProfileImg");
    if (img_add == null || img_add.isEmpty()) {
        img_add = "uploads/default.png"; // Default fallback
    }
%>
<img src="<%= img_add %>" alt="Profile Picture" style="width: 50px; height: 50px; border-radius: 50%;">
        <a href="#"><%
        String user_name=(String)session.getAttribute("username");%>
        <%=user_name %>
        </a>
        <a href="javascript:void(0)" class="close-btn" onclick="closeSidebar()">×</a>
        <a href="profile.jsp">My Profile</a>
        <a href="bookingsdes.jsp">My Bookings</a>
        <a href="Offers.jsp">Offers</a>
        <a href="desk1.jsp">Destinations</a>
        <a href="desk2.jsp">Rooms</a>
        <a href="desk3.jsp">Dining</a>
        <a href="contact.jsp">Contact</a>
        <a href="introductionjfs.html">Logout</a>
    </div>
    
    <div class="container">
         <div class="hotel-card">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsMLJkLiQ-68RorOeIArowF4lYp-zzBbpqwQ&s" alt="Destination 1">           
	            <h3>Taj Hotel Faluknama, Hyderabad</h3>
	            <p>A tour through the famous city of love.</p>
	            <a href="DestinationServlet?hotelName=Hyderabad" class="book-btn">Book Now</a>
        </div>

        <div class="hotel-card">
            <img src="https://foodandtravel.com/imager/hours/219609/Ministry-of-Tourism-Govt-of-India-595161_Taj-Mahal-Uttar-Pradesh-Aerial_821631bb23140209ea99c8f810f75634.jpg" alt="Destination 2">
            <h3>Agra, India</h3>
            <p>The historic capital of medieval India.</p>
            <a href="DestinationServlet?hotelName=Agra" class="book-btn">Check Details</a>
        </div>

        <div class="hotel-card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbjimF2qsCcteOyCTALWa9_kHzIW8cHATipw&s" alt="Destination 3">
            <h3>, Maldives</h3>
            <p>Exotic Islands in Indian Ocean.</p>
            <a href="#" class="book-btn">Check Details</a>
        </div>

        <div class="hotel-card">
            <img src="https://i.natgeofe.com/n/04505c35-858b-4e95-a1a7-d72e5418b7fc/steep-karst-cliffs-of-el-nido-in-palawan.jpg?w=1534&h=768" alt="Destination 4">
            <h3>Philippines</h3>
            <p>Enjoy the thrill of para-gliding in Philippines</p>
            <a href="#" class="book-btn">Check Details</a>
        </div>
        <div class="hotel-card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKSwXKaWBZ6bEqdI3NShyRiARIhFEgUQ7fKg&s" alt="Destination 5">
            <h3>Sri Lanka</h3>
            <p>Enjoy the serene wildlife of Sri Lanka.</p>
            <a href="#" class="book-btn">Check Details</a>
        </div>
        <div class="hotel-card">
            <img src="https://source.unsplash.com/250x150/?city-hotel" alt="Destination 6">
            <h3>Metropolitan Inn</h3>
            <p>Business Hotel in New York</p>
            <a href="#" class="book-btn">Check Details</a>
        </div>
        <div class="hotel-card">
            <img src="https://source.unsplash.com/250x150/?city-hotel" alt="Hotel 4">
            <h3>Metropolitan Inn</h3>
            <p>Business Hotel in New York</p>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="hotel-card">
            <img src="https://source.unsplash.com/250x150/?city-hotel" alt="Hotel 4">
            <h3>Metropolitan Inn</h3>
            <p>Business Hotel in New York</p>
            <a href="#" class="book-btn">Book Now</a>
        </div>
    </div>
    </div>
    <script>
        function openSidebar() {
            document.getElementById("sidebar").style.left = "0";
        }

        function closeSidebar() {
            document.getElementById("sidebar").style.left = "-250px";
        }
    </script>
</body>
</html>