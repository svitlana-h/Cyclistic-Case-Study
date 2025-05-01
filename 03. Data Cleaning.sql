-- Remove electric scooter trips 
-- Note: creating a new table as I can not use the DELETE function due to BigQuery limitations
CREATE TABLE `cyclistic_dataset.tripdata_combined_cleaned` AS
SELECT *
FROM `cyclistic_dataset.tripdata_combined`
WHERE rideable_type !='electric_scooter';

-- Remove:
-- records with NULLs in end_lat and end_lng 
-- records for classic bikes with NULLs in end_station_name and end_station_id
CREATE OR REPLACE TABLE `cyclistic_dataset.tripdata_combined_cleaned` AS
SELECT *
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE
 end_lat IS NOT NULL
 AND end_lng IS NOT NULL
 AND NOT (rideable_type = 'classic_bike'
          AND end_station_name IS NULL
          AND end_station_id IS NULL);

-- Remove records with trip length shorter than 1 minute or longer than 24 hours
CREATE OR REPLACE TABLE `cyclistic_dataset.tripdata_combined_cleaned` AS
SELECT *
FROM `cyclistic_dataset.tripdata_combined_cleaned`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 1 AND
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440;

-- Create new columns for trip length, month, day of week and time of day (hour)
CREATE OR REPLACE TABLE `cyclistic_dataset.tripdata_combined_cleaned` AS
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS trip_length_minutes,
 format_date('%B', started_at) AS month,
 format_date('%A', started_at) AS day_of_week,
 EXTRACT(hour from started_at) as time_of_day
FROM `cyclistic_dataset.tripdata_combined_cleaned`;
