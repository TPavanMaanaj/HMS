<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, factory.DBConn" %>
<%
    // Fetch user details from session
    String username = (String) session.getAttribute("username");
    String email = "";
    String phone = "";
    String profileImg = "profile_pics/default-user.jpg"; // Default profile image

    try {
        Connection conn = DBConn.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT email, phone, profile_pic FROM employees WHERE username = ?");
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            email = rs.getString("email");
            phone = rs.getString("phone");
            if (rs.getString("profile_pic") != null) {
                profileImg = rs.getString("profile_pic");
            }
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="bg-gray-100 flex justify-center items-center h-screen">
    <div class="bg-white p-5 shadow-lg rounded-lg w-1/3">
        <h2 class="text-center text-2xl font-bold mb-4">User Profile</h2>

        <!-- Profile Picture -->
        <div class="text-center">
            <img src="<%= profileImg %>" alt="Profile Picture" class="w-32 h-32 rounded-full mx-auto border">
        </div>

        <!-- Upload Profile Picture -->
        <form action="UploadProfileServlet" method="POST" enctype="multipart/form-data" class="mt-3">
            <label class="block text-lg font-semibold mb-2">Change Profile Picture:</label>
            <input type="file" name="profileImage" class="form-control mb-3" required>
            <button type="submit" class="btn btn-primary w-full">Upload</button>
        </form>

        <!-- Profile Update Form -->
        <form id="profileForm" action="UpdateProfileServlet" method="POST" class="mt-3">
            <label class="block text-lg font-semibold mb-1">Username:</label>
            <input type="text" name="username" value="<%= username %>" class="form-control" readonly>

            <label class="block text-lg font-semibold mt-3">Email:</label>
            <input type="email" name="email" value="<%= email %>" class="form-control" required>
            <span id="emailError" class="text-danger text-sm"></span>

            <label class="block text-lg font-semibold mt-3">Phone:</label>
            <input type="text" name="phone" value="<%= phone %>" class="form-control" required>
            <span id="phoneError" class="text-danger text-sm"></span>

            <button type="submit" class="btn btn-success w-full mt-3">Update Profile</button>
        </form>

        <!-- Change Password Section -->
        <form id="passwordForm" action="ChangePasswordServlet" method="POST" class="mt-4">
            <h3 class="text-xl font-semibold">Change Password</h3>
            <input type="password" name="oldPassword" placeholder="Current Password" class="form-control mt-2" required>
            <input type="password" name="newPassword" placeholder="New Password" class="form-control mt-2" required>
            <input type="password" name="confirmPassword" placeholder="Confirm New Password" class="form-control mt-2" required>
            <button type="submit" class="btn btn-warning w-full mt-3">Change Password</button>
        </form>

        <!-- Success/Error Messages -->
        <% if (request.getParameter("success") != null) { %>
            <p class="text-green-500 text-center mt-3">Profile updated successfully!</p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="text-red-500 text-center mt-3">Failed to update profile.</p>
        <% } %>
    </div>

    <!-- AJAX for Real-Time Validation -->
    <script>
        $(document).ready(function(){
            $("input[name='email']").on("blur", function(){
                var email = $(this).val();
                $.ajax({
                    url: "ValidateEmailServlet",
                    type: "POST",
                    data: { email: email },
                    success: function(response){
                        $("#emailError").text(response);
                    }
                });
            });
        });
    </script>
    </div>
</body>
</html>