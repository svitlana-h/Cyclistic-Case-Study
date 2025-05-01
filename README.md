# Cyclistic-Case-Study

## INTRODUCTION
This case study was completed as the capstone project for the **Google Data Analytics Professional Certificate**. In this project, I followed the data analysis process in order to answer key business question and provide data-driven recommendations. I used **SQL** for data processing and analysis, and **Tableau** for creating visualizations.

## SCENARIO
Cyclistic is a Chicago-based bike-share company that offers flexible access to its services through annual memberships, full-day passes and single-ride passes.
Recently, the finance analysts have concluded that annual members are much more profitable than casual riders (customers who purchase single-ride or full-day passes). The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, the marketing team would like to design a new marketing strategy aimed at converting casual riders into annual members. To do this, they must understand how casual riders and annual members use Cyclistic bikes differently.

## REPORT
### 1. Business Task Statement  
To identify key differences in behaviour of annual members and casual riders, and provide recommendations for a new marketing strategy to help convert casual riders into members.

### 2. Preparation

**2.1. Data Source**  
For the purposes of this case study, I will be using the public historical data from Divvy, a bike-share company in Chicago. 
* Data source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)  (note: the data has been made available by Motivate International Inc. under the following [license](https://divvybikes.com/data-license-agreement)).
* Timeframe analyzed: March 2024 - February 2025.
* Data format and structure: the datasets are provided in CSV format, with each file containing trip-level data for a single month, including ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, and member_casual. 

**2.2. Limitations**  
* Personal data removed for privacy (age, gender, etc.)
* Potential issues with missing or inconsistent station data

**2.3. Tools**  
* SQL: data processing and analysis
* Tableau: visualizations

### 3. Data Processing
In this phase, I combined the monthly datasets into one table, performed an initial exploration of data to understand how to prepare it for analysis, and cleaned the data. 

**3.1. Data Combining**  
SQL query: [Data Combining](https://github.com/svitlana-h/Cyclistic-Case-Study/blob/69e09d99da31622e97eb4824771bc3d957f9e68a/01.%20Data%20Combining.sql)  

* Imported all monthly files into BiqQuery (some of the monthly datasets were broken down into smaller ones due to BigQuery's 100MB table upload limit).
* Used the UNION ALL function to combine the monthly datasets into a single table.

Note: the new table contains 5,783,100 records.

**3.2. Data Exploration**  
SQL query: [Data Exploration](https://github.com/svitlana-h/Cyclistic-Case-Study/blob/062ba742fbee0d337ddb8abeeb5634bfc065082f/02.%20Data%20Exploration.sql)  

* Reviewed the Schema to confirm all columns had appropriate data types.
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/bb932dcb01038e442f99778c67776c663df58f35/Images/Data-Schema.png" alt="Data Schema" width="50%"/>

* Checked the **ride_id** length consistency to avoid any ID mismatches or formatting errors. Note: all IDs are 16 characters long.
* Checked the distinct values in the **rideable_type** column. Note: it contains three unique values: classic_bike, electric_bike and electric_scooter. The latter falls outside the scope of the case study.
* Checked for duplicate records. Note: none found.
* Cheked for missing values. Note: 1,080,148 null values found in **start_station_name**; 1,110,075 null values found in **end_station_name**; 6,744 null values found in **end_lat** and **end_lng**.
* Checked the distinct values in the **member_casual** column. Note: it contains only two user types (member and casual) with no misspellings or inconsistencies.
* Checked the trip length to identify outliers (shorter than 1 minute or loger than 24 hours as these might be false starts or system errors). Note: 246,627 values found.

**3.3. Data Cleaning**  
SQL query: [Data Cleaning](https://github.com/svitlana-h/Cyclistic-Case-Study/blob/786f7ebe075305e7bf2a399bce25156bbc426352/03.%20Data%20Cleaning.sql)  

* Filtered out all electric scooter trips.
* Removed records with missing values. Note: missing values in the **start_station_name** and **end_station_name** columns were primarily associated with electric bikes, which is expected since electric bikes can be parked outside designated docking stations. Therefore, I have removed the rows with missing station information only for classic bikes. Additionally, I have removed all rows with missing values in the end_lat and end_lng columns.
* Filtered out the records with trip length shorter than 1 minute or longer than 24 hours.
* Created new columns: trip_length_minutes, month, day_of_week, time_of_day.

Note: the cleaned table contains 5,403,127 records. 379,973 records were removed.

### 4. Data Analysis
SQL query: [Data Analysis](https://github.com/svitlana-h/Cyclistic-Case-Study/blob/ea066402ca3f7a5a8aacd27ad579824b9d180236/04.%20Data%20Analysis.sql)  

In this phase, I explored the cleaned dataset to identify patterns and differences in usage behavior between casual riders and members. The queries were created to analyze the following:
* Number of trips by user type 
* Average trip length by user type
* Bike type preference by user type   
* Number of trips by month, weekday and hour
* Average trip length by month and weekday
* Trip length distribution   
* Popular start and end stations 

### 5. Findings
In this phase, I imported the new tables into Tableau to create visualizations.

#### Figure 1. Total number of trips by user type

<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/51e9e0af1fe2969eb45b160fbcb46e77d50a7a97/Images/Total%20number%20of%20trips.png" alt="Total number of trips" width="80%"/>  
This chart shows the distribution of the trips by user type. According to results, members accounted for 63,86% of all trips over the analyzed perios. This suggests that members show consistently higher engagement with the bike share service than casual riders.  

#### Figure 2. Average trip length  
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/51e9e0af1fe2969eb45b160fbcb46e77d50a7a97/Images/Average%20trip%20length.png" alt="Average trip length" width="80%"/>  

3. Number of trips by bike type
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/51e9e0af1fe2969eb45b160fbcb46e77d50a7a97/Images/Number%20of%20trips%20by%20bike%20type.png" alt="Number of trips by bike type" width="80%"/>


<img src="" alt="" width="80%"/>
