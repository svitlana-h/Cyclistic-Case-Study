# Cyclistic-Case-Study

## INTRODUCTION
This case study was completed as the capstone project for the **Google Data Analytics Professional Certificate**. In this project, I followed the data analysis process in order to answer key business question and provide data-driven recommendations. I used **SQL** for data processing and analysis, and **Tableau** for creating visualizations.

## SCENARIO
Cyclistic is a Chicago-based bike-share company that offers flexible access to its services through annual memberships, full-day passes and single-ride passes.
Recently, the finance analysts have concluded that annual members are much more profitable than casual riders (customers who purchase single-ride or full-day passes). The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, the marketing team would like to design a new marketing strategy aimed at converting casual riders into annual members. To do this, they must understand how casual riders and annual members use Cyclistic bikes differently.

## REPORT
### 1. Business task statement  
To identify key differences in behaviour of annual members and casual riders, and provide recommendations for a new marketing strategy to help convert casual riders into members.

### 2. Preparation

**2.1. Data Source**  
For the purposes of this case study, I will be using the public historical data from Divvy, a bike-share company in Chicago. 
* Data source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)  (note: the data has been made available by Motivate International Inc. under the following [license](https://divvybikes.com/data-license-agreement))
* Timeframe analyzed: March 2024 - February 2025
* Data format: the datasets are provided in CSV format, with each file containing trip data for a single month.

**2.2. Data Structure**  
Each file contains trip-level data including the following details (columns): ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, and member_casual. A screenshot of the data schema is provided below for reference.

<img src="https://github.com/svitlana-h/Cyclistic-Case-Study/blob/bb932dcb01038e442f99778c67776c663df58f35/Images/Data-Schema.png" alt="Data Schema" width="50%"/>

**2.3. Limitations**  
* Personal data removed for privacy (age, gender, etc.)
* Potential issues with missing or inconsistent station data

**2.4. Tools**  
* SQL: data processing and analysis
* Tableau: visualizations

### 3. Data processing

