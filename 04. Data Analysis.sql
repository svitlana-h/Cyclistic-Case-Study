-- Number of trips by user type
SELECT
 COUNT (*) as number_of_trips,
 member_casual
FROM `cyclistic_dataset.tripdata_combined_cleaned`
GROUP BY member_casual;

-- AVG trip length by user type
-- members
SELECT AVG(trip_length_minutes) AS avg_trip_length_member, 
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'member';
-- casual riders
SELECT AVG(trip_length_minutes) AS avg_trip_length_casual, 
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'casual';

-- Bike type preference
SELECT rideable_type, member_casual, count(*) AS number_of_trips
FROM `cyclistic_dataset.tripdata_combined_cleaned`
GROUP BY rideable_type, member_casual
ORDER BY member_casual, number_of_trips DESC;

-- Number of trips by month
SELECT month, member_casual, count(*) AS number_of_trips
FROM `cyclistic_dataset.tripdata_combined_cleaned`
GROUP BY member_casual, month;

-- Number of trips by weekday
SELECT day_of_week, member_casual, count(*) AS number_of_trips
FROM `cyclistic_dataset.tripdata_combined_cleaned`
GROUP BY member_casual, day_of_week;

-- Number of trips by hour
SELECT time_of_day, member_casual, count(*) AS number_of_trips
FROM `cyclistic_dataset.tripdata_combined_cleaned`
GROUP BY member_casual, time_of_day;

-- AVG trip length by month
-- members
SELECT month, AVG(trip_length_minutes) AS avg_trip_length_member
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'member'
GROUP BY month
ORDER BY month;
-- casual riders
SELECT month, AVG(trip_length_minutes) AS avg_trip_length_casual
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'casual'
GROUP BY month
ORDER BY month;

-- AVG trip length by weekday
-- members
SELECT day_of_week, AVG(trip_length_minutes) AS avg_trip_length_member
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'member'
GROUP BY day_of_week
ORDER BY day_of_week;
-- casual riders
SELECT day_of_week, AVG(trip_length_minutes) AS avg_trip_length_casual
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'casual'
GROUP BY day_of_week
ORDER BY day_of_week;

-- Trip length distribution
SELECT
 member_casual,
 CASE
   WHEN trip_length_minutes <= 5 THEN '0-5 minutes'
   WHEN trip_length_minutes <= 15 THEN '6-15 minutes'
   WHEN trip_length_minutes <= 30 THEN '16-30 minutes'
   WHEN trip_length_minutes <= 60 THEN '31-60 minutes'
   WHEN trip_length_minutes <= 120 THEN '1-2 hours'
   WHEN trip_length_minutes <= 240 THEN '2-4 hours'
   WHEN trip_length_minutes <= 480 THEN '4-8 hours'
   WHEN trip_length_minutes <= 720 THEN '8-12 hours'
   WHEN trip_length_minutes <= 1440 THEN '12-24 hours'
   ELSE 'Invalid trip length'
 END AS trip_length_category,
 COUNT(*) AS number_of_trips
FROM
 `cyclistic_dataset.tripdata_combined_cleaned`
GROUP BY
 member_casual, trip_length_category
ORDER BY
 member_casual, trip_length_category;

-- Popular start stations
-- members
SELECT
 start_station_name,
 COUNT(*) as number_of_trips,
 start_lng,
 start_lat
FROM
 `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'member'
 AND start_station_name != 'null'
GROUP BY start_station_name, start_lng, start_lat
ORDER BY
 COUNT(*) DESC
LIMIT 10;

-- casual riders
SELECT
 start_station_name,
 COUNT(*) as number_of_trips,
 start_lng,
 start_lat
FROM
 `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'casual'
 AND start_station_name != 'null'
GROUP BY start_station_name, start_lng, start_lat
ORDER BY
 COUNT(*) DESC
LIMIT 10;

-- 8. Popular end stations
-- members
SELECT
 end_station_name,
 COUNT(*) as number_of_trips,
 end_lng,
 end_lat
FROM
 `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'member'
 AND end_station_name != 'null'
GROUP BY end_station_name, end_lng, end_lat
ORDER BY
 COUNT(*) DESC
LIMIT 10;

-- casual riders
SELECT
 end_station_name,
 COUNT(*) as number_of_trips,
 end_lng,
 end_lat
FROM
 `cyclistic_dataset.tripdata_combined_cleaned`
WHERE member_casual = 'casual'
 AND end_station_name != 'null'
GROUP BY end_station_name, end_lng, end_lat
ORDER BY
 COUNT(*) DESC
LIMIT 10;
