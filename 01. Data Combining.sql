-- To combine all monthly datasets into a single table

CREATE TABLE `cyclistic_dataset.tripdata_combined` AS (
  SELECT * FROM `cyclistic_dataset.tripdata_202403`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202404`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202405_part1`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202405_part2`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202406_part1`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202406_part2`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202407_part1`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202407_part2`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202408_part1`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202408_part2`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202409_part1`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202409_part2`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202410_part1`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202410_part2`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202411`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202412`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202501`
  UNION ALL
  SELECT * FROM `cyclistic_dataset.tripdata_202502`
  );
