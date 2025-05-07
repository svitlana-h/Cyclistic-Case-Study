# Cyclistic-Case-Study

## INTRODUCTION
This case study was completed as the capstone project for the **Google Data Analytics Professional Certificate**. In this project, I followed the data analysis process in order to answer key business question and provide data-driven recommendations. I used **SQL** for data processing and analysis, and **Tableau** for creating visualizations.

## SCENARIO
Cyclistic is a Chicago-based bike-share company that offers flexible access to its services through annual memberships, full-day and single-ride passes.
Recently, the finance analysts have concluded that annual members are much more profitable than casual riders (customers who purchase full-day or single-ride passes). The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, the marketing team would like to design a new marketing strategy aimed at converting casual riders into annual members. To do this, they must understand how casual riders and annual members use Cyclistic bikes differently.

## REPORT
### 1. Business Task Statement  
To identify key differences in behaviour of annual members and casual riders, and provide recommendations for a new marketing strategy to help convert casual riders into members.

### 2. Preparation

**2.1. Data Source**  
For the purposes of this case study, I will be using the public historical data from Divvy, a bike-share company in Chicago. 
* Data source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)  (note: the data has been made available by Motivate International Inc. under the following [license](https://divvybikes.com/data-license-agreement)).
* Timeframe analyzed: March 2024 - February 2025.
* Data format: the datasets are provided in CSV format, with each file containing trip-level data for a single month.
* Limitations: personal data removed for privacy (age, gender, etc.); potential issues with missing or inconsistent station data.

**2.2. Tools**  
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

* Reviewed the schema to confirm all columns had appropriate data types.
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
* Removed records with missing values. Note: missing values in the **start_station_name** and **end_station_name** columns were primarily associated with electric bikes, which is expected since electric bikes can be parked outside designated docking stations. Therefore, I have removed the rows with missing station information only for classic bikes. Additionally, I have removed all rows with missing values in the **end_lat** and **end_lng** columns.
* Filtered out the records with trip length shorter than 1 minute or longer than 24 hours.
* Created new columns: trip_length_minutes, month, day_of_week, time_of_day.

Note: the cleaned table contains 5,403,127 records. 379,973 records were removed.

### 4. Data Analysis
SQL query: [Data Analysis](https://github.com/svitlana-h/Cyclistic-Case-Study/blob/ea066402ca3f7a5a8aacd27ad579824b9d180236/04.%20Data%20Analysis.sql)  

In this phase, I explored the cleaned dataset to identify patterns and differences in usage behavior of members and casual riders. The queries were created to analyze the following:
* Number of trips by user type 
* Average trip length by user type
* Bike type preference by user type   
* Number of trips by month, weekday and hour
* Average trip length by month and weekday  
* Popular start and end stations 

### 5. Data Visualization
In this phase, I imported the new tables into Tableau to create visualizations and higlight the patterns and key differences.

#### Figure 1. Total number of trips (members vs casual riders) 
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/51e9e0af1fe2969eb45b160fbcb46e77d50a7a97/Images/Total%20number%20of%20trips.png" alt="Total number of trips" width="75%"/>  
This chart shows the distribution of the trips taken in March 2024 - February 2025 by user type. According to results, members accounted for 63,86% of all trips showing consistently higher engagement with the bike share service than casual riders.  

#### Figure 2. Average trip length (members vs casual riders)  
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/51e9e0af1fe2969eb45b160fbcb46e77d50a7a97/Images/Average%20trip%20length.png" alt="Average trip length" width="75%"/> 

The chart above compares the average duration of trips taken by members and casual riders. On average, casual riders took significantly longer trips - 21,64 minutes - while members typically spent 12,11 minutes on the trip.

#### Figure 3. Number of trips by bike type (members vs casual riders)
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/51e9e0af1fe2969eb45b160fbcb46e77d50a7a97/Images/Number%20of%20trips%20by%20bike%20type.png" alt="Number of trips by bike type" width="75%"/>

This graph displays the bike types used by members and casual riders. Both groups showed a slight preference for electric bikes over classic bikes.

#### Figure 4. Number of trips by month
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/73563bb6f03506bc6971a8131a242239aa12b41d/Images/Number%20of%20trips%20by%20month.png" alt="Number of trips by month" width="75%"/>

The chart above illustrates the number of trips taken by members and casual riders each month. As we can see, the activity of both groups was higher from May to October. However, casual riders showed a sharper rise in usage during warmer months, likely due to weather being more suitable for outdoor leisure activities, while members had more consistent activity year-round.

#### Figure 5. Number of trips by weekday
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/73563bb6f03506bc6971a8131a242239aa12b41d/Images/Number%20of%20trips%20by%20weekday.png" alt="Number of trips by weekday" width="75%"/>

This chart highlights how trip activity varies throughout the week. Members show higher activity during weekdays, with slight decrease on weekends, while casual riders display the opposite pattern - lower usage on the weekdays and a noticeable increases on weekends.  

#### Figure 6. Number of trips by hour
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/788b4369628c76b54f19fc13c6d40697ff3d87ad/Images/Number%20of%20trips%20by%20hour.png" alt="Number of trips by hour" width="75%"/>

The graph above illustrates how trip activity varies throughout the day. We can observe that members' activity increases significantly between 6 AM and 8 AM and peaks between 4 PM and 6 PM, which is likely tied to commuting hours. Casual riders' activity raises gradually from early morning till 5 PM, suggesting more flexible usage of bike services throughout the day. 

Based on the observations above, we can make a hypothesis that **members primarily use bikes for commuting or other routine activities, while casual riders tend to take trips for recreational purposes.**

#### Figure 7. Average trip length by month
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/6f0ba1abeb8e5bd2f172f12d43befd1ab47f46cf/Images/Average%20trip%20length%20by%20month.png" alt="Average trip length by month" width="75%"/>

This chart illustrates how the average trip duration changes over the year. Members maintained a steady average trip length, typically between 10 and 13 minutes, with only a slight increase during warmer months. In contrast, casual riders showed more seasonal variation - from shorter trips in winter (typically 11-13 minutes) to almost twice longer trips in warmer months (22-24 minutes). Both of these observations support the hypothesis above.

#### Figure 8. Average trip length by weekday
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/6f0ba1abeb8e5bd2f172f12d43befd1ab47f46cf/Images/Average%20trip%20length%20by%20weekday.png" alt="Average trip length by weekday" width="75%"/>

This chart shows how average trip length varies throughout the week. Both groups tend to take longer trips on weekends compared to weekdays. Members' average trip duration stays fairly consistent throughout the week, with only a slight increase on weekends. Casual riders, on the other hand, show more noticeable increase on weekends, suggesting they they ride longer when they have more free time. This aligns well with the stated hyphotesis.

#### Figure 9. Top start and end stations
<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/14b1dd124fd3e9a2c153d01c33cbe7c1db8e0c71/Images/Top%20stations.png" alt="Top stations" width="100%"/>

The illustration above displays the top-10 start and end stations for members and casual riders. As we can see, casual riders prefer stations near waterfronts, parks and tourist areas, while members frequently use the stations located near business districts, universities and residential ares. This reinforces the pattern that casual riders use bikes for leisure activities, and members take practical, routine trips. It also suggests that a significant part of casual riders may be tourists, which limits the possibility to convert them into annual members.

#### Findings Summary:
* Average trip duration is significantly shorter for members (12.11 minutes) compared to casual riders (21.64 minutes).
* Casual riders’ trip durations vary more notably with the seasons, peaking during warmer months, while members maintain a relatively steady average throughout the year.
* Members are more active on weekdays, especially during commuting hours, while casual members are more active on weekends and prefer late afternoon trips.
* Members prefer stations located near business districts, universities and residential areas, while casual riders often use stations near tourist areas, parks, and waterfronts.
* Members primarily use bikes for commuting and routine travel, whereas casual riders use them more for leisure and recreation.

### 6. Recommendations
Based on the analysis and defined differences between members and casual riders, I would like to suggest the following aproach for the marketing strategy development in order to convert casual riders into members:  
#### 1. Introduce a monthly membership plan 
To appeal to casual riders who use bikes frequently during warmer months but do not commit year-round, a monthly subscription plan could be offered. This option would allow casual users subscribing for the months when they use the service most actively. The added flexibility (compared to yearly membership) would lower the barrier to entry and make it easier for casual riders to try out the membership.  
#### 2. Launch targeted ads in high-interest areas during summer months  
Targeted ad campaigns should be run during summer months when casual riders are most active. Ads can be displayed near parks and waterfornts to capture the most attention of casual riders. The ads can highlight membership benefits relevant to seasonal or recreational riders.  

#### 3. Highlight Long-Term Savings for Longer Trips  
Create a marketing campaign that illustrates how membership reduces costs for frequent long trips. Visual ads or in-app messages could compare the cost of casual rides vs. member rides over time.  
