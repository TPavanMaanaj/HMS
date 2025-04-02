<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Hotel - Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image:url('https://assets.architecturaldigest.in/photos/6385cf3311f0276636badfb6/16:9/w_1600,c_limit/DSC_8367-Edit-W.png');
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width:400px;
        }
        input {
            width: 80%;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .register-btn {
            padding: 10px;
            background: #28a745;
            border-radius:25px;
            color: white;
            border: none;
            width: 60%;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"> <%= request.getParameter("error") %> </p>
        <% } %>
<form action="RegisterServlet" method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <button type="submit" class="register-btn">Register</button>
        </form>
    </div>
</body>
</html>