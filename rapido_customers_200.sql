SELECT * FROM rapido_db.rapido_customers_200;

ALTER TABLE Customers
ADD PRIMARY KEY (Customer_ID);

SELECT COUNT(*) from rapido_db.rapido_customers_200;
alter table rapido_db.rapido_customers_200 add primary key(Customer_ID);
describe rapido_db.rapido_customers_200;
alter table rapido_db.rapido_customers_200 rename column `ï»¿Customer_ID` to Customer_ID;
alter table rapido_db.rapido_customers_200 ADD PRIMARY KEY (Customer_ID);
