# Online Voting System

An online voting application built using **JSP**, **HTML**, **CSS**, and **AJAX**, backed by a MySQL database. This system allows voters to register, cast votes, and view results while ensuring basic validation and usability.

---

## Table of Contents

1. [Features](#features)  
2. [Architecture & Technologies](#architecture--technologies)  
3. [Setup & Installation](#setup--installation)  
4. [Database Schema](#database-schema)  
5. [Usage](#usage)  
6. [Project Structure](#project-structure)  
7. [Future Enhancements](#future-enhancements)  
8. [Contributing](#contributing)  
9. [License](#license)  

---

## Features

- Voter registration and login  
- Secure voting interface  
- AJAX-based interactions (for smoother UX)  
- Dynamic display of voting options  
- Real-time result updates  
- Admin interface for managing candidates and elections  
- Contact / feedback page  

---

## Architecture & Technologies

- **Front-end**: HTML, CSS, JavaScript, AJAX  
- **Server-side**: JSP (JavaServer Pages)  
- **Database**: MySQL  
- **Communication**: AJAX requests for asynchronous interactions  
- **SQL script**: `voting_system.sql` contains schema and sample data  

---

## Setup & Installation

### Prerequisites
- Java (JDK)  
- A Servlet container (e.g. Apache Tomcat)  
- MySQL database  
- JDBC driver (e.g. `mysql-connector-java.jar`)  

### Steps

1. **Clone the repository**

   git clone https://github.com/ansh-vashisht2003/voting.github.io.git
   cd voting.github.io


2. **Database Setup**

   * Create a database (e.g. `voting_db`)
   * Import the SQL script:

     mysql -u your_username -p voting_db < voting_system.sql


3. **Configure Database Connectivity**

   * Update database URL, user, and password in the JSP / DAO files
   * Place the JDBC driver JAR into `WEB-INF/lib`

4. **Deploy to Tomcat**

   * Package as a `.war` or place project folder in Tomcat’s `webapps`
   * Start Tomcat server
   * Visit in browser:

     ```
     http://localhost:8080/<your-app-context>/index.jsp
     ```

---

## Database Schema

| Table       | Purpose                                         |
| ----------- | ----------------------------------------------- |
| `voter`     | Stores voter details (username, password, etc.) |
| `candidate` | Stores candidate info (name, party, etc.)       |
| `vote`      | Records each vote (which voter voted for whom)  |

👉 See `voting_system.sql` for full schema and sample data.

---

## Usage

* **Voter**

  * Register or login
  * View available elections / candidates
  * Cast vote
  * View results

* **Admin**

  * Manage candidates and elections
  * Start/stop election phases
  * View statistics and reports

---

## Project Structure

```
/
├── admin/                  # Admin JSPs
├── voter/                  # Voter JSPs
├── index.jsp
├── voter.jsp
├── contact.jsp
├── voting_system.sql        # Database schema and data
├── css/                     # Stylesheets
├── js/                      # JavaScript / AJAX
├── WEB-INF/
│    ├── lib/                # JDBC JARs
│    └── web.xml             # Deployment descriptor
└── README.md
```

---

## Future Enhancements

* Refactor to **Servlet + MVC architecture**
* Add **prepared statements** to prevent SQL injection
* Implement **authentication & RBAC** (role-based access control)
* OTP / email-based login for added security
* Encrypt sensitive data
* Enhance UI with Bootstrap / Tailwind CSS
* Deploy on cloud with HTTPS

---

## Contributing

Contributions, issues, and feature requests are welcome!
Feel free to fork the repo and submit a pull request.

---


