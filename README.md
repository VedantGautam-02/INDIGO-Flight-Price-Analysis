# INDIGO Flight Price Analysis

## Project Overview

This project focuses on analyzing flight booking data to understand the factors influencing airline ticket prices.

The analysis explores airline-wise pricing, flight schedules, travel routes, ticket classes, and the relationship between the number of days left before departure and ticket prices.

The objective is to extract meaningful insights from flight data using Python and SQL.

## Tools & Technologies

- **Python:** Data cleaning, exploratory data analysis (EDA), and visualization
- **Pandas:** Data manipulation and analysis
- **Jupyter Notebook:** Python-based analysis
- **MySQL:** Data querying and SQL analysis
- **SQL:** Aggregations, grouping, filtering, and analytical queries
- **Git & GitHub:** Version control and project hosting

## Dataset Information

- **Dataset:** Airlines Flight Price Dataset
- **Total Records:** 300,153
- **Total Columns:** 12
- **Data Type:** Structured tabular data
- **Key Features:**
  - Airline
  - Flight Number
  - Source City
  - Departure Time
  - Stops
  - Arrival Time
  - Destination City
  - Class
  - Duration
  - Days Left
  - Price

  ## Analysis Questions

The project addresses the following analytical questions:

1. What are the airlines in the dataset, and how frequently does each appear?
2. What is the distribution of flights across different departure times?
3. What is the distribution of flights across different arrival times?
4. Does the average ticket price vary across airlines?
5. How do departure and arrival times affect average ticket prices?
6. Which source-destination routes have the highest and lowest average ticket prices?
7. How does the number of days left before departure relate to ticket prices?
8. How does ticket pricing differ between Business and Economy classes?
9. What is the average ticket price for Vistara Business Class flights from Delhi to Hyderabad?

## Key Insights

1. **Airline Distribution:** Vistara has the highest number of flight records (127,859), while SpiceJet has the lowest (9,011).

2. **Airline Pricing:** Vistara has the highest average ticket price (₹30,396.54), whereas AirAsia has the lowest (₹4,091.07).

3. **Departure Time:** Night departures have the highest average ticket price (₹23,062.15), while Late Night departures have the lowest (₹9,295.30).

4. **Arrival Time:** Evening arrivals have the highest average ticket price (₹23,044.37).

5. **Route Pricing:** Chennai to Bangalore has the highest average ticket price (₹25,081.85) among the analyzed routes.

6. **Days Left:** Flights with 2 days left have a higher average price (₹30,211.30) than flights with 1 day left (₹21,591.87).

7. **Class Comparison:** Business Class has an average ticket price of ₹52,540.08, compared to ₹6,572.34 for Economy Class.

8. **Specific Route Analysis:** Vistara Business Class flights from Delhi to Hyderabad have an average ticket price of ₹47,939.84.

## Project Structure

```text
INDIGO-Flight-Price-Analysis/
│
├── Airlines flights analysis/
│   ├── INDIGO_Flight_Analysis.ipynb
│   ├── INDIGO_Flight_Analysis.sql
│   └── airlines_flights_cleaned.csv
│
├── airlines_flights_data.csv
├── .gitignore
└── README.md
```

### File Description

- `airlines_flights_data.csv` – Original dataset.
- `airlines_flights_cleaned.csv` – Cleaned dataset used for analysis.
- `INDIGO_Flight_Analysis.ipynb` – Python analysis and visualizations.
- `INDIGO_Flight_Analysis.sql` – SQL queries used for analysis.
- `.gitignore` – Excludes temporary and unnecessary files.
- `README.md` – Project documentation.

## Conclusion

This project demonstrates how Python and SQL can be used together to clean, explore, and analyze real-world flight booking data.

The analysis highlights differences in airline pricing, travel schedules, routes, booking timelines, and ticket classes.

By converting raw flight data into meaningful insights, this project showcases practical data analysis skills, including data cleaning, exploratory data analysis, SQL querying, and data visualization.

## Author

**Vedant Gautam**

[GitHub Profile](https://github.com/VedantGautam-02)