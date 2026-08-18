SELECT * FROM rapido_db.rides;

alter table rapido_db.rides rename column `Services` to Services;

/* AGGREGATE FUNCTIONS */
SELECT COUNT(Ride_id) as Total_Rides from rapido_db.rides;
SELECT COUNT(*) as Cancelled_Trips from rapido_db.rides where Ride_status="cancelled" AND Payment_method="Payment Cancelled";
SELECT COUNT(*) as Completed_Trips from rapido_db.rides where Ride_status="completed";
SELECT SUM(Total_fare) as Total_Revenue from rapido_db.rides;
SELECT AVG(Total_fare) as Average_fare from rapido_db.rides;
SELECT MAX(Total_fare) as Maximum_fare from rapido_db.rides;

/* GROUP BY,ORDER BY FUNCTION */
SELECT Services,COUNT(*) as Total_rides from rapido_db.rides group by Services order by Total_rides DESC;
SELECT Services,SUM(Total_fare) as Total_Revenue from rapido_db.rides group by Services order by Total_Revenue DESC;
SELECT Services,AVG(Total_fare) as Average_Revenue from rapido_db.rides group by Services order by Average_Revenue DESC;
SELECT Payment_method,SUM(Total_fare) as Revenue from rapido_db.rides group by Payment_method;
SELECT Payment_method,COUNT(Payment_method) as Total_payment_modes from rapido_db.rides group by Payment_method;
SELECT Services,COUNT(*) from rapido_db.rides group by Services having COUNT(*) > 100;

/* JOINS */
SELECT c.Customer_ID,c.Customer_Name,r.Ride_id,r.Services,r.Ride_date,r.Total_fare from rapido_customers_200 c  LEFT JOIN rides r ON c.Customer_ID = r.Customer_ID;
SELECT d.Driver_Name,r.Ride_id,r.Services,r.Ride_date,r.Total_fare from drivers d JOIN rides r ON d.Driver_ID = r.Driver_ID;
SELECT c.Customer_ID,c.Customer_Name,r.Ride_id,r.Services,r.Payment_Method from rapido_customers_200 c LEFT JOIN rides r ON c.Customer_ID = r.Customer_ID;
SELECT r.Ride_id,c.Customer_Name,d.Driver_Name,r.Services,r.Total_fare from rides r INNER JOIN rapido_customers_200 c ON r.Customer_ID = c.Customer_ID INNER JOIN drivers d ON r.Driver_ID = d.Driver_ID;


/* SUB-QUERIES */
SELECT Ride_id,Services,Ride_Date,Ride_status,Total_fare from rides where Total_fare > (SELECT AVG(Total_fare) from rides);
SELECT * from rides where Distance = (SELECT MAX(Distance) from rides);



