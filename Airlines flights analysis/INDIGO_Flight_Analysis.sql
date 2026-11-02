CREATE DATABASE indigo_analysis;

use indigo_analysis;

select database();

CREATE TABLE flight(
    `index` INT,
    airline VARCHAR(50),
    flight VARCHAR(50),
    source_city VARCHAR(50),
    departure_time VARCHAR(30),
    stops VARCHAR(30),
    arrival_time VARCHAR(30),
    destination_city VARCHAR(50),
    class VARCHAR(30),
    duration FLOAT,
    days_left INT,
    price INT
);

LOAD DATA LOCAL INFILE 'C:/Data Analyst Projects/INDIGO/Airlines flights analysis/airlines_flights_cleaned.csv'
INTO TABLE flight
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(airline, flight, source_city, departure_time, stops, arrival_time,
 destination_city, `class`, duration, days_left, price);

SELECT*FROM flight
LIMIT 10;

/* =====================================================
   INDIGO FLIGHT PRICE ANALYSIS
   SECTION 01: AIRLINE DISTRIBUTION

   Objective:
   Identify all airlines and count their total flights.
   ===================================================== */

-- Q1. Total number of flights operated by each airline

SELECT airline,
count(*) as total_flights
from flight
group by airline
order by total_flights DESC;

-- Business Insights:
-- 1. Vistara has the highest flight count (127,859).
-- 2. SpiceJet has the lowest flight count (9,011).
-- 3. Vistara and Air India together account for
--    approximately 69.5% of total flight records.
-- ----------------------------------------------------------------

-- Q2: Count flights by departure time

select departure_time,
count(*) as total_flights
from flight
group by departure_time
order by total_flights;

-- Business Insights:
-- 1. Morning has the highest number of flights (71,146).
-- 2. Late Night has the lowest number of flights (1,306).
-- 3. Most flight departures are concentrated between
--    Morning, Early Morning and Evening.
-- -----------------------------------------------------------

-- Q3: Count flights by arrival time

select arrival_time,
count(*) as total_flights
from flight
group by arrival_time 
order by total_flights DESC;

-- Business Insights:
-- 1. Night has the highest number of arrivals (91,538).
-- 2. Late Night has the lowest number of arrivals (14,001).
-- 3. Most flights arrive during Night and Evening hours.
-- ----------------------------------------------------------

-- Q4: Count flights by source city

SELECT
    source_city,
    COUNT(*) AS total_flights
FROM flight
GROUP BY source_city
ORDER BY total_flights DESC;

-- Business Insights:
-- 1. Delhi has the highest number of originating flights.
-- 2. Chennai has the lowest number of originating flights.
-- 3. Delhi and Mumbai contribute the largest flight volumes.
-- ------------------------------------------------------------

-- Q5: Count flights by destination city

SELECT
    destination_city,
    COUNT(*) AS total_flights
FROM flight
GROUP BY destination_city
ORDER BY total_flights DESC;

-- Business Insights:
-- 1. Mumbai has the highest number of arriving flights.
-- 2. Chennai has the lowest number of arriving flights.
-- 3. Mumbai and Delhi are the top two destinations by flight count.
-- ------------------------------------------------------------------

-- Q6: Average ticket price by airline

select airline, ROUND(AVG(price),2) as avg_ticket_price
from flight 
group by airline
order by avg_ticket_price DESC;

-- Business Insights:
-- 1. Vistara has the highest average ticket price (₹30,396.54).
-- 2. AirAsia has the lowest average ticket price (₹4,091.07).
-- 3. Vistara and Air India have significantly higher
--    average ticket prices than the other airlines.
-- -----------------------------------------------------------

-- Q7: Average ticket price by departure time

SELECT
    departure_time,
    ROUND(AVG(price), 2) AS avg_ticket_price
FROM flight
GROUP BY departure_time
ORDER BY avg_ticket_price DESC;

-- Business Insights:
-- 1. Night departures have the highest average ticket price (₹23,062.15).
-- 2. Late Night departures have the lowest average ticket price (₹9,295.30).
-- 3. Ticket prices vary across different departure time slots.


SELECT
    arrival_time,
    ROUND(AVG(price), 2) AS avg_ticket_price
FROM flight
GROUP BY arrival_time
ORDER BY avg_ticket_price DESC;

-- Business Insights:
-- 1. Evening arrivals have the highest average ticket price (₹23,044.37).
-- 2. Late Night arrivals have the lowest average ticket price (₹11,284.91).
-- 3. Arrival time is associated with variations in average ticket prices.
-- -----------------------------------------------------------------

-- Q8: Average ticket price by route

SELECT
    source_city,
    destination_city,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS avg_ticket_price
FROM flight
GROUP BY
    source_city,
    destination_city
ORDER BY avg_ticket_price DESC;

-- Business Insights:
-- 1. Chennai to Bangalore has the highest average ticket price (₹25,081.85).
-- 2. Hyderabad to Delhi has the lowest average ticket price (₹17,243.95).
-- 3. Average ticket prices vary across different routes and directions.
-- ------------------------------------------------------------------------------

-- Q9: Average ticket price when booked 1 or 2 days before departure

SELECT
    days_left,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS avg_ticket_price
FROM flight
WHERE days_left IN (1, 2)
GROUP BY days_left
ORDER BY days_left;

-- Business Insights:
-- 1. Average ticket price is higher for bookings made 2 days before departure.
-- 2. Bookings made 1 day before departure have a lower average price.
-- 3. The dataset does not show a consistent increase in price
--    as departure approaches.
-- ---------------------------------------------------------------------------

-- Q10: Average ticket price by travel class

SELECT
    class,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS avg_ticket_price
FROM flight
GROUP BY class
ORDER BY avg_ticket_price DESC;

-- Business Insights:
-- 1. Business class has a significantly higher average ticket price.
-- 2. Business class average price is approximately 8 times
--    higher than Economy class.
-- 3. Economy class accounts for a larger share of flight records.
-- -----------------------------------------------------------------

-- Q11: Average Vistara ticket price for Delhi to Hyderabad in Business Class

SELECT
    airline,
    source_city,
    destination_city,
    class,
    COUNT(*) AS total_flights,
    ROUND(AVG(price), 2) AS avg_ticket_price
FROM flight
WHERE airline = 'Vistara'
    AND source_city = 'Delhi'
    AND destination_city = 'Hyderabad'
    AND class = 'Business'
GROUP BY
    airline,
    source_city,
    destination_city,
    class;
    
    -- Business Insights:
-- 1. Vistara has 1,660 flight records for this route and class.
-- 2. The average Business Class ticket price is ₹47,939.84.
-- --------------------------------------------------------------


