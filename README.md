# Online Voting System

An online voting application built using **JSP**, **HTML**, **CSS**, and **AJAX**, backed by a MySQL database. This system allows voters to register, cast votes, and view results while ensuring basic validation and usability.

---

## Table of Contents

1. [Features](#features)  
2. [Architecture & Technologies](#architecture--technologies)  
3. [Setup & Installation](#setup--installation)  
4. [Database Schema](#database-schema)  
5. [Usage](#usage)
6. [Future Enhancements](#future-enhancements)  

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

## Future Enhancements

* Refactor to **Servlet + MVC architecture**
* Add **prepared statements** to prevent SQL injection
* Implement **authentication & RBAC** (role-based access control)
* OTP / email-based login for added security
* Encrypt sensitive data
* Enhance UI with Bootstrap / Tailwind CSS
* Deploy on cloud with HTTPS

---
