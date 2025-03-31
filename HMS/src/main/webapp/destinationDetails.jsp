<%@ page import="model.Destinations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}
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
	width: 60%;
	margin: auto;
	padding: 20px;
}

.destination-img {
	width: 100%;
	height: 300px;
	object-fit: cover;
}
</style>
</head>
<%
    String img_ad = (String) session.getAttribute("BackgroundImage");
%>
<body style="background-image: '<%= img_ad %>'; background-size: cover; background-position: center;">

<button class="open-btn" onclick="openSidebar()">☰ Menu</button>

    <div class="sidebar" id="sidebar">
    <%
    String img_add = (String) session.getAttribute("ProfileImg");
    if (img_add == null || img_add.isEmpty()) {
        img_add = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT67KDwRLAHUDYnezhqa4GElhHEb-qkUr_tIA&s.png"; // Default fallback
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
    

	<%
	Destinations destination = (Destinations) session.getAttribute("destination");
	if (destination != null) {
	%>
	<div class="container">
		<h1><%=destination.getName()%></h1>
		<img src="<%=destination.getImage()%>" class="destination-img">
		<p><%=destination.getData()%></p>
	</div>
	<%
	} else {
	%>
	<h2>No Destination Found</h2>
	<%
	}
	%>
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
