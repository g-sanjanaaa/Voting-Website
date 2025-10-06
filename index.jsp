<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Voting Application</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f3f7;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        h1, h2, h3, p {
            margin: 0;
        }

        /* Navbar */
        .navbar {
            background: #333;
            padding: 15px 20px;
            position: sticky;
            top: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
        }

        .navbar h1 {
            color: #fff;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .navbar ul {
            display: flex;
            gap: 20px;
        }

        .navbar ul li a {
            color: #fff;
            font-size: 1rem;
            padding: 5px 10px;
            transition: background 0.3s;
        }

        .navbar ul li a:hover {
            background: #4caf50;
            border-radius: 4px;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 100px 20px;
            background: linear-gradient(120deg, #4caf50, #2e7d32);
            color: white;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.2rem;
            line-height: 1.5;
        }

        .hero .cta-btn {
            margin-top: 20px;
            background: white;
            color: #4caf50;
            font-size: 1.2rem;
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s;
        }

        .hero .cta-btn:hover {
            background: #81c784;
            transform: scale(1.05);
        }

        /* Features Section */
        .features {
            padding: 60px 20px;
            text-align: center;
            background: #fff;
        }

        .features h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #333;
        }

        .features .feature-cards {
            display: flex;
            justify-content: space-around;
            gap: 20px;
            margin-top: 40px;
            flex-wrap: wrap;
        }

        .feature-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 280px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }

        .feature-card h3 {
            font-size: 1.5rem;
            color: #4caf50;
            margin-bottom: 15px;
        }

        .feature-card p {
            color: #666;
            font-size: 1rem;
        }

        /* Footer */
        footer {
            background: #333;
            color: white;
            padding: 40px 20px;
            text-align: center;
        }

        footer p {
            font-size: 0.9rem;
            line-height: 1.6;
        }

        footer a {
            color: #4caf50;
            font-weight: 600;
            transition: color 0.3s;
        }

        footer a:hover {
            color: #81c784;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h1>Online Voting</h1>
    <ul>
        <li><a href="#about">About</a></li>
        <li><a href="#roles">Roles</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Hero Section -->
<div class="hero">
    <h1>Empower Your Voice!</h1>
    <p>Join our secure and seamless online voting platform to make your opinion count.</p>
    <button class="cta-btn" onclick="location.href='#roles'">Get Started</button>
</div>

<!-- Features Section -->
<div id="about" class="features">
    <h2>Why Choose Us?</h2>
    <div class="feature-cards">
        <div class="feature-card">
            <h3>Secure Voting</h3>
            <p>Your data is encrypted, ensuring your privacy and vote integrity.</p>
        </div>
        <div class="feature-card">
            <h3>User-Friendly</h3>
            <p>Simple and intuitive interface for seamless navigation and voting.</p>
        </div>
        <div class="feature-card">
            <h3>Accessible Anywhere</h3>
            <p>Vote from the comfort of your home or on the go with any device.</p>
        </div>
    </div>
</div>

<!-- Roles Section -->
<div id="roles" class="features">
    <h2>Select Your Role</h2>
    <div class="feature-cards">
        <div class="feature-card" onclick="location.href='voter/signup.jsp'">
            <h3>Voter</h3>
            <p>Log in to cast your vote in the upcoming election.</p>
        </div>
        <div class="feature-card" onclick="location.href='votee/login.jsp'">
            <h3>Votee</h3>
            <p>Manage your candidacy and track votes.</p>
        </div>
        <div class="feature-card" onclick="location.href='admin/login.jsp'">
            <h3>Admin</h3>
            <p>Monitor and control the election process securely.</p>
        </div>
    </div>
</div>

<!-- Footer -->
<footer id="contact">
    <p>Need Help? Reach us at <a href="mailto:support@votingapp.com">support@votingapp.com</a></p>
    <p>&copy; 2024 Online Voting App. All rights reserved.</p>
</footer>

</body>
</html>
