  
  -- Manipulate data to separate minutes, hours, days and months into new folder 'analyze_annual_trip_data'

  IF OBJECT_ID('analyze_annual_trip_data', 'U') IS NOT NULL
  DROP TABLE analyze_annual_trip_data
  CREATE TABLE analyze_annual_trip_data
  (
  ride_id nvarchar(255),
  rideable_type nvarchar(255),
  started_at smalldatetime,
  ended_at smalldatetime,
  member_casual nvarchar(255),
  ride_length time(0),
  months nvarchar(255),
  weekdays nvarchar(255),
  hours int,
  duration_minutes int
);

INSERT INTO analyze_annual_trip_data 
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  member_casual,
  ride_length,
  DATENAME(MONTH, started_at) AS months,
  DATENAME(WEEKDAY, started_at) AS weekdays,
  DATENAME (HOUR, started_at) AS hours,
  DATEDIFF(minute, started_at, ended_at) AS minutes_diff
FROM annual_trip_data_2022;

SELECT *
FROM analyze_annual_trip_data
WHERE member_casual is not null 
ORDER BY started_at ASC
