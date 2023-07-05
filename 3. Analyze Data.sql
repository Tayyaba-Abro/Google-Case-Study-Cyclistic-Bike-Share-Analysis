-- Analyze Data

--1. Percentage of Casual Rides vs Annual Member

SELECT member_casual AS membership_type, 
COUNT (member_casual) AS total_ride, 
SUM (COUNT (member_casual)) OVER () AS total_membership,
CONCAT (CAST (COUNT (member_casual) * 100.0/ SUM (COUNT (member_casual)) OVER () AS DECIMAL (10,2)), '%') membership_percentage
FROM Annual_trip_data_2022
WHERE member_casual IS NOT NULL
GROUP BY member_casual;

	
--2. Propotion of rides by Bike Type 

SELECT 
rideable_type AS bike_type,
member_casual AS membership_type,  
COUNT (rideable_type) AS individual_membership_count, 
SUM (COUNT (rideable_type)) OVER (Partition by rideable_type) AS total_membership,
CONCAT (CAST (COUNT (rideable_type) * 100.0/ SUM (COUNT (rideable_type)) OVER (Partition by rideable_type) AS Decimal (10,2)), '%') AS membership_percentage
FROM analyze_annual_trip_data
WHERE member_casual IS NOT NULL
GROUP BY rideable_type, member_casual
ORDER BY rideable_type;


--3. Percentage of Rides per Month

SELECT member_casual AS membership_type, months,
COUNT (months) AS membership_rides,
SUM (COUNT (months)) OVER (Partition by months) AS total_rides_per_month,
CONCAT (CAST ((COUNT (months)) * 100.0/ SUM (COUNT (months)) OVER (Partition by months) AS DECIMAL (10,2)), '%') AS membership_percentage
FROM analyze_annual_trip_data
WHERE member_casual is not null 
GROUP BY member_casual, months
ORDER BY 
CASE months
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
END, member_casual;


--4. Number of Rides by Days

SELECT member_casual AS membership_type, 
weekdays,
COUNT (weekdays) AS rides_per_day
FROM analyze_annual_trip_data
WHERE member_casual is not null 
GROUP BY member_casual, weekdays
ORDER BY 
CASE weekdays
     WHEN 'Sunday' THEN 1 
	 WHEN 'Monday' THEN 2
	 WHEN 'Tuesday' THEN 3 
	 WHEN 'Wednesday' THEN 4
	 WHEN 'Thursday' THEN 5
	 WHEN 'Friday' THEN 6
	 WHEN 'Saturday' THEN 7 
END, member_casual;


--5. Average ride duration by day 

SELECT member_casual AS membership_type, 
weekdays, 
AVG (duration_minutes) as ride_duration
FROM analyze_annual_trip_data
WHERE member_casual IS NOT NULL
GROUP BY member_casual, weekdays
ORDER BY 
CASE weekdays
     WHEN 'Sunday' THEN 1 
	 WHEN 'Monday' THEN 2
	 WHEN 'Tuesday' THEN 3 
	 WHEN 'Wednesday' THEN 4
	 WHEN 'Thursday' THEN 5
	 WHEN 'Friday' THEN 6
	 WHEN 'Saturday' THEN 7 
END, member_casual;


--6. Number of rides by hour  

SELECT member_casual AS membership_type, 
hours,
COUNT(hours) AS rides_per_hour
FROM analyze_annual_trip_data
WHERE member_casual IS NOT NULL 
GROUP BY member_casual, hours 
ORDER BY hours, membership_type;


--7. Percentage of Rides per Season

WITH cte AS 
(
   SELECT
      member_casual AS membership_type,
      CASE
         WHEN months IN ('December', 'January', 'February') THEN 'Winter'
         WHEN months IN ('March', 'April', 'May') THEN 'Spring'
         WHEN months IN ('June', 'July', 'August') THEN 'Summer'
         WHEN months IN ('September', 'October', 'November') THEN 'Autumn'
      END AS season
   FROM analyze_annual_trip_data
   WHERE member_casual IS NOT NULL
)
SELECT
   membership_type,
   season,
   COUNT(*) AS ride_per_season,
   SUM (COUNT (season)) OVER (Partition by season) AS total_rides_per_season,
   CONCAT (CAST (COUNT (season) * 100.0/ SUM (COUNT (season)) OVER (Partition by season) AS DECIMAL (10,2)), '%') AS percentage_per_season
FROM cte
GROUP BY membership_type, season
ORDER BY season, membership_type;


--8. Percentage of rides in each time zone 

WITH CTE AS 
(
   SELECT
   member_casual AS membership_type, duration_minutes AS ride_duration,
   CASE
      WHEN hours >= 0 AND hours < 6 THEN 'Night'
      WHEN hours >= 6 AND hours < 12 THEN 'Morning'
      WHEN hours >= 12 AND hours < 18 THEN 'Afternoon'
      WHEN hours >= 18 THEN 'Evening'
   END AS time_zone
   FROM analyze_annual_trip_data
   WHERE member_casual IS NOT NULL
)
SELECT 
  membership_type, time_zone,
  COUNT (time_zone) AS rides_per_time_zone,
  SUM (COUNT (time_zone)) OVER (Partition by time_zone) AS total_rides_per_time_zone,
  CONCAT (CAST (COUNT (time_zone) * 100.0/ SUM (COUNT (time_zone)) OVER (Partition by time_zone) AS DECIMAL (10,2)), '%') AS percentage_of_rides
  FROM cte 
  GROUP BY time_zone, membership_type
  ORDER BY time_zone, membership_type;
