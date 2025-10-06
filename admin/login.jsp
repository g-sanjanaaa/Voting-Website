<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6); /* Soft gradient background */
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
        }

        header {
            background-color: #333; /* Dark header for contrast */
            color: white;
            padding: 20px;
            text-align: center;
            width: 100%;
            position: fixed; /* Fix header at the top */
            top: 0;
            left: 0;
            z-index: 100; /* Ensure header stays on top */
        }

        .container {
            width: 100%;
            max-width: 400px;
            margin-top: 100px; /* Space between header and form */
            padding: 40px;
            background-color: #fff; /* White form background */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333; /* Dark text for readability */
            font-size: 24px;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50; /* Green submit button */
            color: white;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<header>
    <h1>Admin Login</h1>
    <p>Please enter your credentials.</p>
</header>

<div class="container">
    <h2>Login Form</h2>
    <form method="post" action="login.jsp">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="submit" value="Login" />
    </form>

    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = "";

        if (username != null && password != null) {
            // Validate credentials
            if (username.equals("INDIA") && password.equals("INDIA")) {
                // Redirect to dashboard.jsp if credentials are correct
                response.sendRedirect("dashboard.jsp");
            } else {
                // Display error message if credentials are incorrect
                errorMessage = "Invalid Username or Password. Please try again.";
            }
        }

        // If there is an error message, display it
        if (!errorMessage.isEmpty()) {
            out.println("<div class='error'>" + errorMessage + "</div>");
        }
    %>
</div>

</body>
</html>
