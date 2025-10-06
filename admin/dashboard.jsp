<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Reset body margins and padding */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Header and Navigation */
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
        }

        .nav-link:hover {
            background-color: #ddd;
            color: black;
        }

        /* Main content container */
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Page title styling */
        .page-title {
            text-align: center;
            color: #333;
        }

        /* Form container styling */
        .form-container {
            margin-bottom: 30px;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .success {
            color: green;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            .navbar {
                flex-direction: column;
            }

            .nav-link {
                padding: 10px;
            }
        }

    </style>
    <script>
        // Function to hide the success message after 2 seconds
        function hideMessage() {
            setTimeout(function() {
                document.getElementById('successMessage').style.display = 'none';
            }, 2000);
        }
    </script>
</head>
<body>

    <!-- Navbar -->
    <header>
        <div class="navbar">
            <a href="dashboard.jsp" class="nav-link">Home</a>
            <a href="voter.jsp" class="nav-link">See Votes</a>
             <a href="../index.jsp" class="nav-link">Logout</a>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <h2 class="page-title">Admin Dashboard</h2>

        <!-- Add Voter Form -->
        <div class="form-container">
            <h3>Add New Voter</h3>
            <form method="post" action="dashboard.jsp">
                <input type="text" name="name" placeholder="Full Name" required />
                <input type="text" name="party" placeholder="Party" required />
                <input type="text" name="username" placeholder="Username" required />
                <input type="date" name="dob" placeholder="Date of Birth" required />
                <input type="submit" value="Add Voter" />
            </form>
        </div>

        <% 
            // Backend logic for adding voters
            String name = request.getParameter("name");
            String party = request.getParameter("party");
            String username = request.getParameter("username");
            String dob = request.getParameter("dob");
          
            String errorMessage = "";
            String successMessage = "";  // Variable for success message

            // Add new voter if form is submitted
            if (name != null && party != null && username != null && dob != null) {
                // JDBC setup (Configure your DB connection here)
                String url = "jdbc:mysql://localhost:3306/voting_system"; // Change this to your DB
                String user = "root"; // Change this to your DB username
                String pass = "password"; // Change this to your DB password
                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    // Load MySQL JDBC Driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, pass);

                    // Insert voter into database
                    String insertQuery = "INSERT INTO votee (name, party, username, dob) VALUES (?, ?, ?, ?)";
                    stmt = conn.prepareStatement(insertQuery);
                    stmt.setString(1, name);
                    stmt.setString(2, party);
                    stmt.setString(3, username);
                    stmt.setString(4, dob);
                 

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        successMessage = "Voter added successfully!";  // Set success message
                    } else {
                        errorMessage = "Error adding voter. Please try again.";
                    }
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

            // Display any error message if exists
            if (!errorMessage.isEmpty()) {
                out.println("<div class='error'>" + errorMessage + "</div>");
            }

            // Display success message if exists
            if (!successMessage.isEmpty()) {
                out.println("<div id='successMessage' class='success'>" + successMessage + "</div>");
                out.println("<script>hideMessage();</script>"); // Hide the message after 2 seconds
            }
        %>

        <!-- Display Voters Table -->
        <h3>List of Voters</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Party</th>
                    <th>Username</th>
                    <th>Date of Birth</th>
                   
                </tr>
            </thead>
            <tbody>
                <% 
                    // Fetch all voters from the database
                    String url = "jdbc:mysql://localhost:3306/voting_system";
                    String user = "root";
                    String pass = "password";
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, pass);
                        String selectQuery = "SELECT * FROM votee";
                        stmt = conn.prepareStatement(selectQuery);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("id") + "</td>");
                            out.println("<td>" + rs.getString("name") + "</td>");
                            out.println("<td>" + rs.getString("party") + "</td>");
                            out.println("<td>" + rs.getString("username") + "</td>");
                            out.println("<td>" + rs.getString("dob") + "</td>");
                           
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
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
            </tbody>
        </table>
    </div>

</body>
</html>
