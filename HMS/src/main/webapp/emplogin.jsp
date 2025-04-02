<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login - Smartz Hotels</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: url('https://source.unsplash.com/1600x900/?luxury-hotel,lobby') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=') no-repeat center center/cover;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            width: 350px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            margin-bottom: 20px;
            color: #444;
            font-size: 24px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .login-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: #C2934C;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .login-btn:hover {
            background: #A67C32;
        }
        .logo {
            width: 100px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzJJcQFlP25u2sJ0d5rnnasF_ykdeV0knymw&s" alt="Taj Hotels Logo" class="logo">
        <h2>Employee Login</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"> <%= request.getParameter("error") %> </p>
        <% } %>
        
        <form id="loginForm" onsubmit="login(event)" action="EmployeeServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <select name="role" required>
                <option value="" disabled selected>Select Role</option>
                <option value="Manager">Manager</option>
                <option value="Receptionist">Receptionist</option>
                <option value="Housekeeping">Housekeeping</option>
                <option value="Chef">Chef</option>
                <option value="Security">Security</option>
            </select>
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
    </script>
</body>
</html>