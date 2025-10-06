<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Information</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .navbar {
            display: flex;
            justify-content: center;
            background-color: #333;
        }

        .nav-link {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
            display: block;
        }

        .nav-link:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 40px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            font-size: 1em;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:hover td {
            background-color: #f1f1f1;
        }

        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        /* Adding responsive behavior */
        @media (max-width: 768px) {
            table {
                font-size: 0.9em;
            }
            th, td {
                padding: 10px;
            }
        }

        /* Add some spacing around the table */
        table {
            margin-bottom: 30px;
        }

        .navbar {
            display: flex;
            justify-content: center;
            background-color: #333;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <header>
        <div class="navbar">
            <a href="dashboard.jsp" class="nav-link">Home</a>

            <a href="voy.jsp" class="nav-link">See Votes</a>
  <a href="../index.jsp" class="nav-link">Logout</a>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <h2>Voter Information</h2>

        <% 
            // JDBC setup (Configure your DB connection here)
            String url = "jdbc:mysql://localhost:3306/voting_system"; // Change this to your DB
            String user = "root"; // Change this to your DB username
            String pass = "password"; // Change this to your DB password
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);
                
                // Select all data from votee table
                String selectQuery = "SELECT name, party, username, dob, votes FROM votee";
                stmt = conn.prepareStatement(selectQuery);
                rs = stmt.executeQuery();
                
                // Display data in a table
                out.println("<table>");
                out.println("<thead><tr><th>Name</th><th>Party</th><th>Username</th><th>Date of Birth</th><th>Votes</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    String name = rs.getString("name");
                    String party = rs.getString("party");
                    String username = rs.getString("username");
                    Date dob = rs.getDate("dob");
                    int votes = rs.getInt("votes");
                    
                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + party + "</td>");
                    out.println("<td>" + username + "</td>");
                    out.println("<td>" + dob.toString() + "</td>");
                    out.println("<td>" + votes + "</td>");
                    out.println("</tr>");
                }
                out.println("</tbody>");
                out.println("</table>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>

    </div>

</body>
</html>
