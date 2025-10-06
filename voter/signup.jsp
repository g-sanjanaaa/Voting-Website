<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Signup</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #4CAF50, #81C784);
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: grey;
            color: #333;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 2.2rem;
            color: #2E7D32;
        }

        header p {
            margin: 5px 0 0;
            font-size: 1rem;
        }

        .container {
            width: 100%;
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #2E7D32;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            background: #4CAF50;
            color: white;
            font-size: 1rem;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background: #388E3C;
        }

        .error {
            color: red;
            text-align: center;
            margin: 10px 0;
            font-size: 0.9rem;
        }

        p {
            text-align: center;
            font-size: 0.9rem;
        }

        p a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <h1>Voter Signup</h1>
    <p>Create an account to participate in voting.</p>
</header>

<div class="container">
    <h2>Signup Form</h2>
    <form method="post" action="signup.jsp">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="text" name="voter_card" placeholder="Voter Card Number" required />
        <input type="date" name="dob" placeholder="Date of Birth" required />
        <input type="text" name="phone_number" placeholder="Phone Number" required />
        <input type="submit" value="Sign Up" />
    </form>

    <%
        String name = request.getParameter("name");
        String voterCard = request.getParameter("voter_card");
        String dob = request.getParameter("dob");
        String phoneNumber = request.getParameter("phone_number");
        String errorMessage = "";

        if (name != null && voterCard != null && dob != null && phoneNumber != null) {
            if (!phoneNumber.matches("\\d{10}")) {
                errorMessage = "Phone number must be 10 digits.";
            } else {
                String url = "jdbc:mysql://localhost:3306/voting_system";
                String user = "root";
                String pass = "password";
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, pass);

                    String checkQuery = "SELECT * FROM voter WHERE voter_card = ?";
                    stmt = conn.prepareStatement(checkQuery);
                    stmt.setString(1, voterCard);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        errorMessage = "Voter card number already exists. Please enter a unique voter card number.";
                    } else {
                        String insertQuery = "INSERT INTO voter (name, voter_card, dob, phone_number) VALUES (?, ?, ?, ?)";
                        stmt = conn.prepareStatement(insertQuery);
                        stmt.setString(1, name);
                        stmt.setString(2, voterCard);
                        stmt.setString(3, dob);
                        stmt.setString(4, phoneNumber);

                        int rowsInserted = stmt.executeUpdate();
                        if (rowsInserted > 0) {
                            response.sendRedirect("login.jsp");
                            return;  // Ensure no further code is executed
                        } else {
                          errorMessage = "Error signing up. Please try again.";
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    errorMessage = "Error: " + e.getMessage();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            }
        }

        if (!errorMessage.isEmpty()) {
            out.println("<div class='error'>" + errorMessage + "</div>");
        }
    %>
    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</div>

</body>
</html>
