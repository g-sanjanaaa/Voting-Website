create database voting_system;
use voting_system;
select * from voter;
drop table voter;
CREATE TABLE voter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) ,
    voter_card VARCHAR(50) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    voted_id int,
    phone_number VARCHAR(10) NOT NULL -- CHECK (LENGTH(phone_number) = 10)
);

drop table votee;
CREATE TABLE votee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    party VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    votes int Default 0
);


select * from votee;
