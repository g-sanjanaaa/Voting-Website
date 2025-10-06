<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession session1 = request.getSession();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #4CAF50, #81C784);
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: #2E7D32;
            color: #fff;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 2.5rem;
            color: #ffffff;
        }

        header p {
            margin: 10px 0 0;
            font-size: 1rem;
            font-weight: 300;
        }

        .container {
            width: 90%;
            max-width: 700px;
            margin: 60px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2E7D32;
            font-size: 2rem;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .details {
            font-size: 1.1rem;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .details p {
            margin: 12px 0;
            padding: 8px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .vote-summary {
            text-align: center;
            font-size: 1.3rem;
            color: #388E3C;
            margin-top: 20px;
            font-weight: bold;
        }

        .vote-summary strong {
            font-size: 1.5rem;
            color: #2E7D32;
        }

        .logout {
            text-align: center;
            margin-top: 30px;
        }

        .logout a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
            border: 2px solid #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .logout a:hover {
            background-color: #4CAF50;
            color: #fff;
            transform: translateY(-2px);
        }

        /* Add subtle hover effects for the details section */
        .details p:hover {
            transform: translateY(-3px);
            transition: transform 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        /* Smooth transition for the overall container */
        .container {
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: scale(1.03);
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome, <%= session1.getAttribute("name") %>!</h1>
    <p>Your Voting Dashboard</p>
</header>

<div class="container">
    <h2>Your Dashboard</h2>

    <div class="details">
        <p><strong>Name:</strong> <%= session1.getAttribute("name") %></p>
        <p><strong>Party:</strong> <%= session1.getAttribute("party") %></p>
        <p><strong>Date of Birth:</strong> <%= session1.getAttribute("dob") %></p>
        <p><strong>Votes Won:</strong> <%= session1.getAttribute("votes") %></p>
    </div>

    <div class="vote-summary">
        <h3>Vote Summary</h3>
        <p>You have received <strong><%= session1.getAttribute("votes") %></strong> votes so far!</p>
    </div>

    <div class="logout">
        <p><a href="../index.jsp">Logout</a></p>
    </div>
</div>

</body>
</html>
