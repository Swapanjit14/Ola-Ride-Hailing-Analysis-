
-- ola_analysis_queries

-- 1. Retrieve all successful bookings
SELECT *
FROM bookings
WHERE booking_status = 'Success';

-- 2. Find the average ride distance for each vehicle type
SELECT
    vehicle_type,
    AVG(ride_distance) AS avg_distance
FROM bookings
GROUP BY vehicle_type;

-- 3. Get the total number of cancelled rides by customers
SELECT COUNT(*) AS cancelled_by_customer_count
FROM bookings
WHERE booking_status = 'Cancelled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides
SELECT
    customer_id,
    COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
SELECT COUNT(*) AS cancelled_by_driver_personal_car_issues
FROM bookings
WHERE cancelled_rides_by_driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT
    MAX(driver_ratings) AS max_rating,
    MIN(driver_ratings) AS min_rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI
SELECT *
FROM bookings
WHERE payment_method = 'UPI';

-- 8. Find the average customer rating per vehicle type
SELECT
    vehicle_type,
    AVG(customer_rating) AS avg_customer_rating
FROM bookings
GROUP BY vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully
SELECT
    SUM(booking_value) AS total_successful_value
FROM bookings
WHERE booking_status = 'Success';

-- 10. List all incomplete rides along with the reason
SELECT
    booking_id,
    incomplete_rides_reason
FROM bookings
WHERE incomplete = 'Yes';
