create database rapido_db;
use rapido_db;

create table Customers(
   Customer_ID INT PRIMARY KEY,
   Customer_Name VARCHAR(50) NOT NULL,
   Gender VARCHAR(10),
   Phone VARCHAR(10),
   City VARCHAR(50)
);

create table Drivers(
   Driver_ID INT PRIMARY KEY,
   Driver_Name VARCHAR(50) NOT NULL,
   Vehicle_Number VARCHAR(50) UNIQUE,
   Rating DECIMAL(2,1)
);

CREATE TABLE Rides (
    Ride_ID VARCHAR(30) PRIMARY KEY,
    Customer_ID INT,
    Driver_ID INT,
    Services VARCHAR(30),
    Ride_Date DATE,
    Ride_Status VARCHAR(20),
    Source_pickup VARCHAR(100),
    Destination VARCHAR(100),
    Duration DECIMAL(6,2),
    Distance DECIMAL(6,2),
    Ride_Charge DECIMAL(10,2),
    Misc_Charge DECIMAL(10,2),
    Total_Fare DECIMAL(10,2),
    Payment_Method VARCHAR(30),

        CONSTRAINT fk_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),

        CONSTRAINT fk_driver
        FOREIGN KEY (Driver_ID)
        REFERENCES Drivers(Driver_ID)
);

drop table Rides;
drop table Customers;
drop table Drivers;


