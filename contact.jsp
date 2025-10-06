<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f9fc;
        }

        .navbar {
            background: #333;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            color: white;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .navbar ul {
            display: flex;
            gap: 20px;
            list-style: none;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
        }

        .navbar ul li a:hover {
            color: #4caf50;
        }

        .contact-hero {
            text-align: center;
            padding: 80px 20px;
            background: linear-gradient(120deg, #4caf50, #2e7d32);
            color: white;
        }

        .contact-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }

        .contact-hero p {
            font-size: 1.2rem;
        }

        .contact-section {
            padding: 40px 20px;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 1000px;
        }

        .contact-item {
            text-align: center;
            padding: 20px;
            flex: 1;
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .contact-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .contact-item h3 {
            font-size: 1.5rem;
            color: #4caf50;
            margin-bottom: 10px;
        }

        .contact-item p {
            font-size: 1rem;
            color: #666;
        }

        footer {
            background: #333;
            color: white;
            padding: 30px 20px;
            text-align: center;
        }

        footer p {
            font-size: 0.9rem;
        }

        footer a {
            color: #4caf50;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h1>Contact Us</h1>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</div>

<!-- Hero Section -->
<div class="contact-hero">
    <h1>We’d Love to Hear from You</h1>
    <p>Reach out to us for any support, inquiries, or feedback.</p>
</div>

<!-- Contact Section -->
<div id="contact" class="contact-section">
    <div class="contact-item">
        <h3>Address</h3>
        <p>123 Green Street, Cityname, Country</p>
    </div>
    <div class="contact-item">
        <h3>Phone</h3>
        <p>+91-8904315077</p>
        <p>+91-7349052706</p>
    </div>
    <div class="contact-item">
        <h3>Working Hours</h3>
        <p>Monday - Friday: 9 AM - 5 PM</p>
        <p>Saturday: 10 AM - 3 PM</p>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>Need more help? Visit our <a href="#">Support Center</a></p>
    <p>&copy; 2024 Contact Page. All rights reserved.</p>
</footer>

</body>
</html>
