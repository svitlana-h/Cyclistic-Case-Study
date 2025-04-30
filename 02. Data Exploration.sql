-- Check length of the ride_id values
SELECT
 LENGTH(ride_id) AS length_ride_id,
 COUNT(ride_id) AS number_of_rows
FROM `cyclistic_dataset.tripdata_combined`
GROUP BY length_ride_id;
-- all IDs are 16 charachers long

-- Check distint values in the rideable_type column
SELECT DISTINCT rideable_type
FROM `cyclistic_dataset.tripdata_combined`;
-- three rideable types: classic_bike, electric_bike and electric_scooter

-- Check for duplicates
SELECT COUNT (* ) -- 5783100
FROM `cyclistic_dataset.tripdata_combined`;

SELECT DISTINCT * -- 5783100 
FROM `cyclistic_dataset.tripdata_combined`;
-- no duplicates found

-- Check for missing values
SELECT
 COUNTIF (ride_id is NULL) AS missing_ride_id,
 COUNTIF (rideable_type is NULL) AS missing_rideable_type,
 COUNTIF (started_at is NULL) AS missing_started_at,
 COUNTIF (ended_at is NULL) AS missing_ended_at,
 COUNTIF (start_station_name is NULL) AS missing_start_station_name, -- 1080148 null values
 COUNTIF (start_station_id is NULL) AS missing_start_station_id, -- 1080148 null values
 COUNTIF (end_station_name is NULL) AS missing_end_station_name, -- 1110075 null values
 COUNTIF (end_station_id is NULL) AS missing_end_station_id, -- 1110075 null values
 COUNTIF (start_lat is NULL) AS missing_start_lat,
 COUNTIF (start_lng is NULL) AS missing_start_lng,
 COUNTIF (end_lat is NULL) AS missing_end_lat, -- 6744 null values
 COUNTIF (end_lng is NULL) AS missing_end_lng, -- 6744 null values
 COUNTIF (member_casual is NULL) AS missing_member_casual
FROM `cyclistic_dataset.tripdata_combined`;

-- Check distint values in the member_casual column
SELECT DISTINCT member_casual as user_type
FROM `cyclistic_dataset.tripdata_combined`;
-- two user types: member and casual

-- Check for trips shorter than 1 minute or loger than 24 hours
SELECT * 
FROM `cyclistic_dataset.tripdata_combined`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;
-- 246627 values 
