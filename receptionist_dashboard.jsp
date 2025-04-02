<%@ page import="java.util.List, model.Room, dao.RoomDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receptionist Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; background-color: #f4f4f4; padding: 20px; }
        h1 { text-align: center; color: #333; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border-bottom: 1px solid #ccc; }
        th { background-color: #5cb85c; color: white; }
        button { background-color: #5bc0de; color: white; padding: 10px; border-radius: 5px; cursor: pointer; transition: background-color 0.3s; }
        button:hover { background-color: #31b0d5; }
    </style>
</head>
<body>
    <h1>Receptionist Dashboard</h1>
    <div class="container">
        <form action="RoomServlet" method="post">
            Guest Name: <input type="text" name="guestName" required><br>
            Room Type: <select name="roomType">
                <option>Single</option>
                <option>Double</option>
                <option>Suite</option>
            </select><br>
            Check-In Date: <input type="date" name="checkInDate" required><br>
            Check-Out Date: <input type="date" name="checkOutDate" required><br>
            Room Number: <input type="number" name="roomNumber" required><br>
            <button type="submit">Assign Room</button>
        </form>

        <h2>Assigned Rooms</h2>
        <table>
            <tr><th>Guest Name</th><th>Room Type</th><th>Check-In</th><th>Check-Out</th><th>Room #</th><th>Status</th></tr>
            <% for (Room room : RoomDAO.getAllRooms()) { %>
                <tr>
                    <td><%= room.getGuestName() %></td>
                    <td><%= room.getRoomType() %></td>
                    <td><%= room.getCheckInDate() %></td>
                    <td><%= room.getCheckOutDate() %></td>
                    <td><%= room.getRoomNumber() %></td>
                    <td><%= room.getStatus() %></td>
                </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
