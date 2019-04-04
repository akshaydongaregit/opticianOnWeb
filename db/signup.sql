create database optosoft;

use optosoft;

create table users
(
id int primary key auto_increment not null,
full_name char(30),
dob date,
gender char(7),
address varchar(40),
contact_number bigint,
e_mail varchar(30),
user_name varchar(30),
password varchar(30)
)

