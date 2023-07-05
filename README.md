# Case Study 1: Differentiating Casual Riders and Annual Members - Cyclistic Bike Share Analysis
<p align="center">
<img width="519" alt="Capture" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/39b0b926-c041-4208-bf48-45b3b4dbabd9">
</p>

## Quick Links:
### Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)
### SQL Codes
- [Merge Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/1.%20Merge%20Data.sql) 
- [Manipulate data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/2.%20Manipulate%20Data.sql)
- [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 
### Visualization
- Tableau: [Cyclistic Dashboard](https://public.tableau.com/views/CyclisticDashboard_3/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)

## Introduction
This case study presents a data analysis project conducted as part of the Google Data Analytics Professional Certificate course, Capstone Project, focusing on Cyclistic, a bike-share company.

As a data analyst in the marketing analyst team, the objective is to develop a new marketing strategy to convert casual riders into annual members. The study follows the data analysis process, encompasses the steps of asking relevant questions, preparing the data, processing and analyzing it, sharing insights, and suggesting actionable recommendations.

This article specifically addresses the initial question of understanding the differences between annual members and casual riders. By leveraging data analytics techniques, the study aims to uncover key insights that can inform targeted marketing tactics and drive the conversion of casual riders into annual member.

## Tools used in Analysis
- Data Cleaning: Microsoft Excel 
- Data Analysis: Microsft SQL Server 
- Visualization: Tableau Public

## Data Analysis Process
### Ask Phase:
To address the business task of understanding how annual members and casual riders use Cyclistic bikes differently, the following questions will guide the analysis:

- Percentage of Casual Riders vs Annual Members
- Proportion of Rides by Bike Type
- Percentage of Rides per Month
- Number of Rides per Day
- Average Ride Duration by Day (in minutes)
- Frequency of Rides per Hour
- Percentage of rides per Season
- Proportion of rides in Each Time Zone
  
### Prepare Phase:
- The dataset used for this project is public data provided by Motivate International Inc. It consists of monthly files covering the period from January 2022 to December 2022. 
- Each file within the dataset contains 13 columns related to the bike rides. 
- These columns provide detailed information about each ride, including the ride ID, rideable type, start and end station ID’s and locations, coordinates, and membership type.

### Process Phase:
#### Data Cleaning in Excel:

During the process phase, the data cleaning steps were carried out in [Microsoft Excel](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/tree/main/Excel-clean-data). The following actions were performed: 
- **Checking for Duplicates:** The duplicate values were examined using built-in “Remove Duplicates” feature in Excel. This helped ensure data integrity and eliminate any duplicated entries.
- **Validating Column Values:** The values in specific columns, such as rideable_type and member_casual, were verified to ensure consistency and accuracy. The only valid values, including classic_bike, docked_bike, electric_bike for rideable_type, and casual, member for member_casual, were retained.
- **Removing Blank Values:** The data set was checked for incomplete or blank values across all columns. Rows with missing values, particularly in columns like start_station_name, start_station_id, end_station_name, and end_station_id, were removed to ensure data completeness.
- **Removing Unwanted Columns:** Columns start_lat, start_lng, end_lat, and end_lng, which were not relevant to the analysis, were removed from each file to streamline the dataset and focus on the essential variables.
- **Adding the Ride Length Column:** A new column named “ride_length” was added to calculate the duration of each ride. The value in the ride_length column was obtained by subtracting the started_at timestamp from the ended_at timestamp.
- **Setting the Time Format:** The ride_length column was formatted as “HH:MM:SS” using the “Format > Cells > Time > 37:30:55” option in Excel. This ensured that the ride duration was presented in a standardized time format.
- **Applying Conditional Formatting:** Conditional formatting was applied to the ride_length column to highlight ride lengths that fell outside the desired range. Specifically, any ride length values less than 00:01:00 (one minute) or greater than 24:00:00 (24 hours) were formatted differently, making them easily identifiable for further analysis or potential removal.
- **Sorting the Table:** The table was sorted in ascending order based on the started_at column to ensure data consistency.
By cleaning data in Excel, the dataset was refined, inconsistencies were addressed, and the ride length information was formatted appropriately for subsequent analysis.

#### Data Transformation in SQL
For data transformation, data processing was performed in SQL Server. The data from each month, spanning from January to December 2022, was imported and merged into a single table called “Annual_trip_data_2022”.The steps involved in this process are as follows:

- **Importing Data:** The monthly files containing the ride data were imported into SQL Server.
- **Merging Data:** A new table named “Annual_trip_data_2022” was created to store the consolidated data for the entire year.The data from tables were merged into the “Annual_trip_data_2022” table using the UNION ALL statement. SQL Query: [Merge Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/1.%20Merge%20Data.sql) 
- **Manipulate Data:** After merging data, a new table named “analyze_annual_trip_data” was generated. This table includes additional columns such as “month,” “day,” “hour,” and “duration_minutes” to facilitate the comparison and analysis of ride frequencies. SQL Query: [Manipulate data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/2.%20Manipulate%20Data.sql)

### Analyze Phase:
In the Analyze phase, we delve into the data to uncover insights and address the key findings related to how annual members and casual riders use Cyclistic bikes differently. The focus is on understanding their behavior, preferences, and patterns to inform marketing strategies aimed at converting casual riders into annual members. To address the key findings, the following analyses were performed in SQL Server. 

#### 1. Percentage of Casual Riders vs Annual Members
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="316" alt="3  percentage of rides - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/cbe41202-cd83-4590-9a48-94b13261eda8">

#### 2. Proportion of Rides by Bike Type 
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="446" alt="4  rides by bike types - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/d8eeca1e-1525-44ad-9bc2-8e9c29141857">

#### 3. Percentage of Rides per Month
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="412" alt="5  rides per month - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/7bd52576-fe79-4c87-ac84-8aa8da958a48">

#### 4. Number of Riders per Day
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="213" alt="6  number of rides by day - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/fc410eda-f427-444f-ac4f-e9f256933995">

#### 5. Average Ride Duration by Day (in minute)
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="208" alt="7  average ride duration by days - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/edbe1c99-6a04-4e9e-a010-94b8ab9286fb">

#### 6. Frequency of Rides per Hour
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

![number of rides per hour](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/a0ba5f8f-efb3-4ecf-a8ef-03cba087cbdc)

#### 7. Percentage of Rides per Season 
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="425" alt="9  rides by season - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/53984f6b-b0e3-49c2-bea3-e8de2c2717d2">

#### 8. Percentage of Rides per Time Zone 
SQL Query: [Analyze Data](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/blob/main/3.%20Analyze%20Data.sql) 

<img width="421" alt="10  percentage of rides by time zone - result" src="https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/3c3a34cb-0410-4f1d-893c-ef8362907082">

### Share Phase:
The share phase presents the insights and findings derived from the analysis of Cyclistic Bike Share data using Tableau Public, a powerful data visualization tool. The analysis revealed several key findings:

#### 1. Percentage of Casual Riders vs Annual Members
In 2022, annual members accounted for the majority of the rides, representing 59.35% of the total 4,288,562 rides.
![sheet1](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/a8152a31-98d8-4db5-bf73-c6588214e3b4)

#### 2. Proportion of Rides by Bike Type

The analysis of bike types reveals that annual members have a higher percentage of using classic bikes compared to casual riders. Additionally, annual members show a greater preference for electric bikes compared to casual riders. However, when it comes to docked bikes, casual riders demonstrate a higher inclination towards using them compared to annual members.
![sheet2](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/f8ba5498-8bf6-4929-928a-99e9d2c7b288)

#### 3. Percentage of Rides per Month
This analysis reveals that annual members consistently have a higher number of rides compared to casual riders in all months. In February, annual members accounted for the highest proportion of rides, reaching approximately 82.93%. On the other hand, casual riders had the highest proportion of rides in July, comprising nearly 48.59% of the total rides.
![sheeet 3](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/830e5ef2-e397-45a7-ac30-63ff3f87e7d7)

#### 4. Number of Rides per Day 
The analysis of the number of rides per day reveals interesting patterns. From Monday to Friday, annual members consistently have a higher count of rides compared to casual riders. However, on weekends (Saturday and Sunday), casual riders exhibit the highest usage, surpassing the number of rides by annual members.
![sheet4](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/f3fc0555-6c90-4a13-a856-ef74c76c321c)

#### 5. Average Ride Duration by Day (in minutes)
On average, casual riders have significantly longer ride durations compared to annual members.
![sheeet5](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/3aa3bdcf-7976-4a15-8c36-a9cabfb5c93a)

#### 6. Frequency of Rides per Hour
The line graph illustrates distinct variations in the frequency of rides per hour for both annual members and casual riders. Notably, both rider type experience peak usage at 17:00 (5 p.m.), with annual members recording 273,000 rides and casual riders with 167,000 rides during that hour.
![sheet6](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/7b721886-ff10-468b-b2f0-0e5dbc1ec7a3)

#### 7. Percentage of Rides per Season
Overall, annual members consistently have the highest proportion of rides in all seasons compared to casual riders. However, during winters, annual members have the highest proportion, accounting for approximately 78.99% of the total rides. On the other hand, casual riders have the highest proportion of rides during summers, comprising around 46.86% of the total rides.
![sheet7](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/625b8f4b-b1a9-4e96-84c0-13a930161117)

#### 8. Proportion of Rides in each Time Zone
Annual Members have the highest ratio of bike usage across the three time zones: morning, afternoon, and evening. Specifically, in the morning time zone, annual members account for approximately 68.15% of the rides, indicating their dominant presence during that period. However, casual rides surpass members in the night time zone, comprising about 50.57% of the rides.
![sheet8](https://github.com/Tayyaba-Abro/Case-Study-Cyclistic-Bike-Share-Analysis/assets/47588244/79ccc5e0-98bf-4379-afaf-3c223effbfd8)

### Act Phase:
#### Key takeaways: 
Based on the findings of my analysis, some key takeaways can be derived:

- **Bike Type Preference:** Annual members show a higher preference for classic and electric bikes, while casual riders have a higher inclination towards docked bikes.
- **Monthly Variation:** Annual members consistently have a higher number of rides compared to casual riders in all months. February sees the highest proportion of annual members, while July has the highest proportion of casual rides.
- **Weekday vs. Weekend Usage:** Annual members tend to ride more on weekdays, while casual riders have higher usage on weekends.
- **Ride Duration:** Casual riders have longer average ride durations compared to annual members.
- **Peak Usage Hour:** Both annual members and casual riders experience peak usage at 5 p.m., with annual members having a higher number of rides.
- **Seasonal Variation:** Members have the highest proportion of rides in all seasons, but winters see the highest proportion of annual members while summers see the highest proportion of casual rides.
- **Time Zone Distribution:** Annual members dominate the morning, afternoon, and evening time zones, while casual riders have a higher proportion of rides during the night.

#### Strategies to convert more Casual Riders into Annual Member

- **Targeted Promotions:** Offer exclusive discounts or incentives for casual riders to upgrade to annual memberships, highlighting the benefits and cost savings of long-term commitment.
- **Improved Bike Variety:** Expand the fleet of classic and electric bikes to cater to the preferences of casual riders and enhance the overall riding experience.
- **Customized Membership Plans:** Introduce tailored annual membership plans specifically for docked bike users, providing additional perks and advantages to encourage their transition.
- **Marketing Campaigns:** Launch targeted marketing campaigns during peak hours, weekends, and seasons to promote the advantages of annual membership and highlight the value it offers to casual riders.
- **Enhanced Convenience:** Improve bike storage facilities, especially on weekends, to facilitate longer rides for casual riders and provide added convenience that encourages them to consider annual membership.



