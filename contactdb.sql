DROP DATABASE IF EXISTS CONTACTDB;
CREATE DATABASE CONTACTDB;
USE CONTACTDB;

DROP TABLE IF EXISTS CONTACT;
CREATE TABLE CONTACT(
Fname VARCHAR(15)  NOT NULL,
Mname VARCHAR(15),
Lname VARCHAR(15) NOT NULL,
Contact_id INT NOT NULL AUTO_INCREMENT,
CONSTRAINT pk_Contact PRIMARY KEY (Contact_id)
);

DROP TABLE IF EXISTS ADDRESS;
CREATE TABLE ADDRESS(
Address_type CHAR(4) NOT NULL,
Address VARCHAR(30),
City CHAR(15),
State CHAR(15),
Zip CHAR(5),
Address_id INT NOT NULL AUTO_INCREMENT,
Contact_id INT NOT NULL,
CONSTRAINT pk_Address PRIMARY KEY (Address_id),
CONSTRAINT fk_Address_Contact FOREIGN KEY ADDRESS(Contact_id) REFERENCES CONTACT(Contact_id)
);

DROP TABLE IF EXISTS PHONE;
CREATE TABLE PHONE(
Phone_type CHAR(15),
Area_code CHAR(3),
Pnumber VARCHAR(8),
Phone_id INT NOT NULL AUTO_INCREMENT,
Contact_id INT NOT NULL,
CONSTRAINT pk_Phone PRIMARY KEY (Phone_id),
CONSTRAINT fk_Phone_Contact FOREIGN KEY PHONE(Contact_id) REFERENCES CONTACT(Contact_id)
);

DROP TABLE IF EXISTS DATETABLE;
CREATE TABLE DATETABLE(
Date_type CHAR(20),
C_Date DATE,
Date_id INT NOT NULL AUTO_INCREMENT,
Contact_id INT NOT NULL,
CONSTRAINT pk_Date PRIMARY KEY (Date_id),
CONSTRAINT fk_Date_Contact FOREIGN KEY DATETABLE(Contact_id) REFERENCES CONTACT(Contact_id)
);