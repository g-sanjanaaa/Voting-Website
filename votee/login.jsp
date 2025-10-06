<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Login</title>
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
    <h1>Votee Login</h1>
    <p>Enter your credentials to login and vote.</p>
</header>

<div class="container">
    <h2>Login Form</h2>
    <form method="post" action="login.jsp">
        <input type="text" name="username" placeholder="Usernamer" required />
        <input type="date" name="dob" placeholder="Date of Birth" required />
        <input type="submit" value="Login" />
    </form>

    <%
        String username = request.getParameter("username");
        String dob = request.getParameter("dob");
        String errorMessage = "";

        if (username != null && dob != null) {
            // JDBC setup (configure your DB connection here)
            String url = "jdbc:mysql://localhost:3306/voting_system"; // Change to your DB
            String user = "root"; // Change to your DB username
            String pass = "password"; // Change to your DB password
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);

                // Check if voter exists with matching voter card and dob
                String query = "SELECT * FROM votee WHERE username = ? AND dob = ?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, username);
                stmt.setString(2, dob);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    // Redirect to dashboard if login is successful
                     HttpSession session1 = request.getSession();
                session1.setAttribute("id", rs.getInt("id"));
                session1.setAttribute("name", rs.getString("name"));
                session1.setAttribute("votes", rs.getInt("votes"));
                session1.setAttribute("dob", rs.getString("dob"));
                session1.setAttribute("party", rs.getString("party"));
               
                    response.sendRedirect("dashboard.jsp");
                } else {
                    // Display error message if credentials are incorrect
                    errorMessage = "Invalid Voter Card or Date of Birth. Please try again.";
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

       
    %>
    <p>Doesnt have an account? <a href="signup.jsp">Signup here</a></p>
</div>

</body>
</html>
