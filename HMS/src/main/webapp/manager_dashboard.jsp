<%@ page import="java.util.List" %>
<%@ page import="model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession session1 = request.getSession(false);
    String username = (session1 != null) ? (String) session1.getAttribute("ename") : null;
    String role = (session1 != null) ? (String) session1.getAttribute("role") : null;

    if (username == null) {
        response.sendRedirect("emplogin.jsp");
    }

    String hotelName = (String) session1.getAttribute("hotelName");
    List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard - Smartz Hotels</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background: #C2934C;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #C2934C;
            color: white;
        }
        .logout-btn {
            float: right;
            padding: 10px 15px;
            background: #d9534f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .logout-btn:hover {
            background: #c9302c;
        }
    </style>
</head>
<body>

    <div class="header">
        <%= username %> - <%= hotelName %>
        <button class="logout-btn" onclick="logout()">Logout</button>
    </div>

    <div class="container">
        <h2>Employees in <%= hotelName %></h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Salary</th>
                    <th>Login Time</th>
                    <th>Logout Time</th>
                </tr>
            </thead>
            <tbody>
                <% if (employeeList != null) { 
                    for (Employee emp : employeeList) { %>
                    <tr>
                        <td><%= emp.getEname() %></td>
                        <td><%= emp.getRole() %></td>
                        <td>₹<%= emp.getSal() %></td>
                        <td><%= emp.getLoginTime() != null ? emp.getLoginTime() : "Not logged in" %></td>
                        <td><%= emp.getLogoutTime() != null ? emp.getLogoutTime() : "Not logged out" %></td>
                    </tr>
                <% } } %>
            </tbody>
        </table>
    </div>

    <div class="container">
        <h2>Booking & Room Availability</h2>
        <table>
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Room Type</th>
                    <th>Status</th>
                </tr>
            </thead>
      
      
      
      
      
        </table>
    </div>

    <script>
        function logout() {
            alert("Logging out...");
            window.location.href = "emplogin.jsp";
        }
    </script>

</body>
</html>
