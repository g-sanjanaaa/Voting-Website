<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Dashboard</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: antiquewhite;
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #333;
            display: flex;
            justify-content: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar a {
            padding: 16px 20px;
            color: white;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #4CAF50;
            color: white;
        }

        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }

        /* Main Content Styling */
        .container {
            margin-top: 80px;
            max-width: 1200px;
            margin: 40px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            font-size: 2.5em;
            color: #333;
            margin-bottom: 20px;
        }

        .sub-header {
            text-align: center;
            font-size: 1.4em;
            color: #777;
            margin-bottom: 40px;
        }

        /* Card Styling */
        .card {
            background-color: #fff;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 15px;
        }

        .card p {
            font-size: 1.1em;
            color: #555;
            line-height: 1.6;
        }

        .card ul {
            list-style: none;
            margin-left: 20px;
            font-size: 1.1em;
            color: #555;
        }

        .card ul li {
            margin-bottom: 10px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1.2em;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            .navbar a {
                padding: 14px 18px;
            }

            .card {
                margin: 10px 0;
            }

            .header {
                font-size: 2em;
            }

            .sub-header {
                font-size: 1.2em;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="dashboard.jsp" class="active">Home</a>
        <a href="vot.jsp">Vote Now</a>
        <a href="../index.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="container">

        <!-- Header -->
        <div class="header">
            Welcome to Your Voter Dashboard
        </div>

        <!-- Sub Header -->
        <div class="sub-header">
            Ready to cast your vote? Your voice matters!
        </div>

        <!-- Voter Information -->
        <div class="card">
            <h3>Your Voting , Your Right</h3>
            <p>We are glad to have you on board! As a registered voter, you can now vote for your preferred candidates in the upcoming election.</p>
            <p>Remember, your vote counts towards a better future!</p>
        </div>

        <!-- Voting Instructions -->
        <div class="card">
            <h3>How to Vote</h3>
            <p>Voting is simple and quick! Here's what you need to do:</p>
            <ul>
                <li>Click the "Vote Now" button to view the available candidates.</li>
                <li>Select your preferred candidate based on their manifesto.</li>
                <li>Once you've made your choice, submit your vote!</li>
            </ul>
            <p>Don't forget, your vote is your voice. Make it count!</p>
        </div>

        <!-- Call to Action -->
        <div class="card" style="text-align:center;">
            <h3>Ready to Vote?</h3>
            <p>Click the button below to start casting your vote.</p>
            <a href="vot.jsp" class="btn">Vote Now</a>
        </div>

    </div>

</body>
</html>
