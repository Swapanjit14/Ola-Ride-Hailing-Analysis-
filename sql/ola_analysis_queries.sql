
-- ola_ride_hailing_data_analysis


CREATE DATABASE ola;
USE ola;


-- 1. View: All successful bookings
DROP VIEW IF EXISTS successful_bookings;
CREATE VIEW successful_bookings AS
SELECT *
FROM bookings
WHERE booking_status = 'Success';


-- 2. View: Average ride distance by vehicle type
DROP VIEW IF EXISTS avg_ride_distance_by_vehicle;
CREATE VIEW avg_ride_distance_by_vehicle AS
SELECT vehicle_type,
       AVG(ride_distance) AS avg_distance
FROM bookings
GROUP BY vehicle_type;


-- 3. View: Total number of rides cancelled by customers
DROP VIEW IF EXISTS cancelled_rides_by_customers;
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS cancelled_by_customer_count
FROM bookings
WHERE booking_status = 'Cancelled by Customer';


-- 4. View: Top 5 customers by number of rides
DROP VIEW IF EXISTS top_5_customers;
CREATE VIEW top_5_customers AS
SELECT customer_id,
       COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;


-- 5. View: Number of rides cancelled by drivers due to personal/car issues
DROP VIEW IF EXISTS rides_cancelled_by_driver_pc_issues;
CREATE VIEW rides_cancelled_by_driver_pc_issues AS
SELECT COUNT(*) AS cancelled_by_driver_pc_issues
FROM bookings
WHERE cancelled_rides_by_driver = 'Personal & Car related issue';


-- 6. View: Max and min driver ratings for Prime Sedan bookings
DROP VIEW IF EXISTS prime_sedan_driver_ratings;
CREATE VIEW prime_sedan_driver_ratings AS
SELECT MAX(driver_ratings) AS max_rating,
       MIN(driver_ratings) AS min_rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan';


-- 7. View: All rides paid using UPI
DROP VIEW IF EXISTS upi_payments;
CREATE VIEW upi_payments AS
SELECT *
FROM bookings
WHERE payment_method = 'UPI';


-- 8. View: Average customer rating per vehicle type
DROP VIEW IF EXISTS avg_customer_rating_by_vehicle;
CREATE VIEW avg_customer_rating_by_vehicle AS
SELECT vehicle_type,
       AVG(customer_rating) AS avg_customer_rating
FROM bookings
GROUP BY vehicle_type;


-- 9. View: Total booking value of successful rides
DROP VIEW IF EXISTS total_successful_ride_value;
CREATE VIEW total_successful_ride_value AS
SELECT SUM(booking_value) AS total_successful_ride_value
FROM bookings
WHERE booking_status = 'Success';


-- 10. View: All incomplete rides with reason
DROP VIEW IF EXISTS incomplete_rides_with_reason;
CREATE VIEW incomplete_rides_with_reason AS
SELECT booking_id,
       incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';

