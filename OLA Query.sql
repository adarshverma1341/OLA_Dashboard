Create Database OLA
use OLA

Select * From Booking
--1. Retrieve all successful bookings: 
/*Ans= Here we easaly find Out Successful Bookings From Booking  status column
Using Where Clause */

Select * From Booking 
Where Booking_Status='Success'
/* Now we Create a View For easy to Access Successfull boking Without weriting 
a query or sending for the output to the manager*/

Create View successful_bookings As
Select * From Booking 
Where Booking_Status='Success'

--1. Retrieve all successful bookings: 
Select * From successful_bookings

--2. Find the average ride distance for each vehicle type: 
 Select Vehicle_Type, Avg (Ride_Distance)
 as 'Avg_Distance' From Booking
 Group by Vehicle_Type

 /* Now We Create A View To Easy To Access*/
 Create View Average_ride_distance_for_each_vehicle_type As
 Select Vehicle_Type, Avg (Ride_Distance)
 as 'Avg_Distance' From Booking
 Group by Vehicle_Type

 --2.Find the average ride distance for each vehicle type: 
 Select * From Average_ride_distance_for_each_vehicle_type

  
--3. Get the total number of canceled rides by customers: 
Select count(*) From Booking
where Booking_Status='Canceled by Customer'
/* Now We Create View*/
Create View canceled_rides_by_customers as
Select count(*) as 'Canceld_By_Customer' From Booking 
where Booking_Status='Canceled by Customer'

--3. Get the total number of canceled rides by customers: 
Select * From canceled_rides_by_customers

--4. List the top 5 customers who booked the highest number of rides: 
Select Customer_ID, Count (Booking_ID) As Total_Rides
From Booking
Group by Customer_ID
Order by Total_Rides desc 
 /* Create View */


--5. Get the number of rides canceled by drivers due to personal and car-related issues: 
Create View canceled_by_drivers_P_C_Issuse As
Select Count (*) as 'canceled by drivers' From Booking
where Canceled_Rides_by_Driver='Personal & Car related issue'

/* Create View */
--5. Get the number of rides canceled by drivers due to personal and car-related issues: 
Select * From  canceled_by_drivers_P_C_Issuse


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
Create View Ratings_Of_Prime_Sedan As
Select Max(Driver_Ratings) as 'Max_Rating',
Min(Driver_Ratings) As 'Min_Rating'
From Booking
Where Vehicle_Type='Prime Sedan'

/*Create View*/
--6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
Select * From Ratings_Of_Prime_Sedan


--7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payments as 
Select * From Booking
Where Payment_Method= 'UPI'

/* Create View */
--7. Retrieve all rides where payment was made using UPI:
Select * From UPI_Payments


--8. Find the average customer rating per vehicle type: 
Create View Cus_Rating_Per_Vehical As
select Vehicle_Type, Avg(Customer_Rating) as 'Avg_Cus_Rating'
From Booking
Group by Vehicle_Type

/* Create View*/
--8. Find the average customer rating per vehicle type: 
Select * From Cus_Rating_Per_Vehical

--9. Calculate the total booking value of rides completed successfully: 
Create View  total_booking_value_of_rides_completed_successfully As
Select Sum(Booking_Value) As 'Total_Booking_Value'
From Booking
Where Booking_Status='Success'

/* Create View */
--9. Calculate the total booking value of rides completed successfully: 
Select * From total_booking_value_of_rides_completed_successfully


--10. List all incomplete rides along with the reason: 
Select Booking_ID, Incomplete_Rides_Reason 
From Booking 
Where Incomplete_Rides= 'Yes' 