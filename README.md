# Cyclistic-Case-Study

### 1. INTRODUCTION
Cyclistic is a Chicago-based bike-share company that offers flexible access to its services through annual memberships, full-day passes and single-ride passes.
Recently, the finance analysts have concluded that annual members are much more profitable than casual riders (customers who purchase single-ride or full-day passes). Therefore, the marketing team would like to design a new marketing strategy aimed at converting casual riders into annual members. To do this, they must understand how casual riders and annual members use Cyclistic bikes differently.

**1.1. Business task statement**  
To identify key differences in behaviour of annual members and casual riders, and provide recommendations to help convert casual riders into members.

**1.2. Key stakeholders**  
Cyclistic marketing team  
Lily Moreno: the director of marketing  
Cyclistic executive team: the team will decide whether to approve the recommended marketing program  

### 2. PREPARATION

**2.1. Data Source**  
For the purposes of this case study, I will be using the public historical data from Divvy, a bike-share company in Chicago. The data has been made available by Motivate International Inc. under the following [license](https://divvybikes.com/data-license-agreement).  
* Data source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)  
* Timeframe analyzed: March 2024 - February 2025  

**2.2. Data Format**  
The datasets are provided in CSV format, with each file containing trip data for a single month.
Files contain trip-level data with consistent column structures. The columns include details such as ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, and member_casual. A screenshot of the data schema is provided below for reference.

<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/bb932dcb01038e442f99778c67776c663df58f35/Images/Data-Schema.png" alt="Data Schema" width="50%"/>

**2.3. Limitations**  
* Personal data removed for privacy (age, gender, etc.)
* Potential issues with missing or inconsistent station data

**2.4. Tools selection**  
At first, I began examining the datasets in Excel. However, given the large size of the data, I decided to transition to SQL for cleaning and analysis.
