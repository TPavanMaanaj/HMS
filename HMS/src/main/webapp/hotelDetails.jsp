<%@ page import="model.Destinations" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Destinations destination = (Destinations) session.getAttribute("destination");
    if (destination == null) {
        response.sendRedirect("error.jsp?message=No Data Found");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= destination.getName() %> - Details</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .container { max-width: 800px; margin: auto; padding: 20px; }
        img { max-width: 100%; height: auto; border-radius: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <h1><%= destination.getName() %></h1>
        <img src="<%= destination.getImage() %>" alt="<%= destination.getName() %>">
        <p><%= destination.getData() %></p>
        <a href="bookHotel.jsp?hotelName=<%= destination.getName() %>">Book Now</a>
    </div>
</body>
</html>
