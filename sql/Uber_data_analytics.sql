-- Find the top 10 pickup location based on the number of trips 

SELECT a.pickup_location_id , COUNT(*) as trips 
FROM my-test-project-470221.uber_data_engineering_yt.pickup_location_dim a
JOIN my-test-project-470221.uber_data_engineering_yt.fact_table b 
ON a.pickup_location_id = b.pickup_location_id
GROUP BY pickup_location_id 
ORDER BY trips DESC
limit 10;

-- Find the total number of trips by passenger count
SELECT passenger_count , count(*) as total_number_trips
FROM my-test-project-470221.uber_data_engineering_yt.passenger_count_dim a 
JOIN my-test-project-470221.uber_data_engineering_yt.fact_table b
ON a.passenger_count_id = b.passenger_count_id
GROUP BY passenger_count
ORDER BY total_number_trips DESC
LIMIT 10;

-- Find the avergae fare amount by hour of the day 
SELECT pick_hour , AVG(fare_amount) as avg_fare_amount
FROM my-test-project-470221.uber_data_engineering_yt.datetime_dim a 
JOIN my-test-project-470221.uber_data_engineering_yt.fact_table b  
ON  a.datetime_id = b.datetime_id 
GROUP BY pick_hour
ORDER BY avg_fare_amount DESC

