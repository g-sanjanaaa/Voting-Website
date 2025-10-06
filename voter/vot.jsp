<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vote Now</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: antiquewhite;
            margin-top: 50px;
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

        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: whitesmoke;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table {
            width: 90%;
            margin: 20px 0;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table th, table td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 12px;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .btn-vote {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            cursor: pointer;
        }

        .btn-vote:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            font-size: 1.2em;
            color: red;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
    <a href="dashboard.jsp">Home</a>
    <a href="vot.jsp">Vote Now</a>
    <a href="../index.jsp">Logout</a>
</div>

<div class="container">
    <h2>Vote for Your Favorite Candidate</h2>

    <% 
        // Connect to the database
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String errorMessage = "";

        // Check if the voter has already voted
        HttpSession session1 = request.getSession();
        int voterId = (session1.getAttribute("id") != null) ? Integer.parseInt(session1.getAttribute("id").toString()) : 0;
        int votedId = 0;

        if (voterId > 0) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/voting_system", "root", "password");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT voted_id FROM voter WHERE id = " + voterId);
                if (rs.next()) {
                    votedId = rs.getInt("voted_id");
                }

                // If the voter has already voted, show a message and remove the voting options
                if (votedId != 0) {
                    out.println("<div class='message'>You have already voted!</div>");
                } else {
                    // If the user hasn't voted yet, display the votee (contestants) table
                    rs = stmt.executeQuery("SELECT * FROM votee");

                    // Voting table
                    out.println("<table>");
                    out.println("<tr><th>Votee ID</th><th>Name</th><th>Party</th><th>Action</th></tr>");
                    while (rs.next()) {
                        int voteeId = rs.getInt("id");
                        String name = rs.getString("name");
                        String party = rs.getString("party");
                        out.println("<tr>");
                        out.println("<td>" + voteeId + "</td>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + party + "</td>");
                        out.println("<td><form method='post' action='vot.jsp'><input type='hidden' name='voteeId' value='" + voteeId + "'/><button type='submit' class='btn-vote'>Vote</button></form></td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
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

        // If the user submits a vote
        String voteeIdParam = request.getParameter("voteeId");
        if (voteeIdParam != null && !voteeIdParam.isEmpty() && votedId == 0) {
            try {
                int voteeId = Integer.parseInt(voteeIdParam);
                // Update the vote count for the selected candidate in votee table
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/voting_system", "root", "password");
                stmt = conn.createStatement();

                // Increment the vote count for the candidate
                stmt.executeUpdate("UPDATE votee SET votes = votes + 1 WHERE id = " + voteeId);

                // Update the voted_id in the voter table
                stmt.executeUpdate("UPDATE voter SET voted_id = " + voteeId + " WHERE id = " + voterId);

                out.println("<div class='message' style='color:green'>Your vote has been successfully submitted!</div>");
                // Prevent further voting options by not displaying the votee table after voting
                return;

            } catch (Exception e) {
                e.printStackTrace();
                errorMessage = "Error: " + e.getMessage();
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
    %>

</div>

</body>
</html>
