# NHS Scotland Waiting Times & Performance Analysis

An end-to-end data analytics project analysing NHS Scotland Stage of Treatment waiting-time data from **September 2024 to September 2026**.

The project uses **PostgreSQL, SQL, Tableau and Excel** to explore waiting-list trends, long waits, health board performance, specialty-level patterns and completed activity.

## Interactive Dashboard

[View the live Tableau dashboard](https://public.tableau.com/views/NHSScotlandWaitingTimesPerformanceDashboard/Dashboard1?:language=en-GB&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Project Objectives

The analysis aims to answer:

- How have ongoing waiting lists changed across Scotland?
- How have waits over 52 weeks changed over time?
- Which health boards have the highest share of long waits?
- Which specialties contribute most to the >52-week waiting backlog?
- How has completed activity changed over the analysis period?

## Tools Used

- **PostgreSQL** — database storage and querying
- **SQL** — data cleaning, validation, aggregation and analysis
- **Tableau Public** — interactive dashboard and visualisation
- **Excel** — initial data inspection and CSV handling

## Dataset

**Source:** Public Health Scotland — Stage of Treatment Waiting Times

**Analysis period:** September 2024 – September 2026

The raw dataset contained **41,077 records across 21 fields**.

The analysis includes:

- New Outpatient waiting lists
- Inpatient/Day Case waiting lists
- Ongoing waits
- Completed waits
- Waits over 12, 26, 52 and 104 weeks
- Health board comparisons
- Specialty-level analysis

## Data Cleaning & Validation

The SQL workflow included:

- Converting reporting dates into PostgreSQL `DATE` format
- Creating a cleaned analytical view while preserving the raw data
- Checking duplicate records and missing values
- Investigating quality flags associated with missing measures
- Retaining unavailable values as `NULL` rather than replacing them with zero
- Identifying aggregate rows to prevent double counting
- Creating a health board lookup table
- Joining official specialty codes to readable specialty names

## Key Findings

Between September 2024 and September 2026:

- **New Outpatient ongoing waits decreased by 11.33%**, from 572,897 to 508,014.
- **Inpatient/Day Case ongoing waits remained broadly stable**, increasing by approximately 0.11%.
- New Outpatient waits over 52 weeks fell from **63,463 to 12,683**, a reduction of approximately **80%**.
- Inpatient/Day Case waits over 52 weeks fell from **37,565 to 15,064**, a reduction of approximately **60%**.
- The share of New Outpatient waits exceeding 52 weeks decreased from **11.08% to 2.50%**.
- The equivalent Inpatient/Day Case share decreased from **23.98% to 9.61%**.
- In September 2026, **Grampian** had the highest published New Outpatient >52-week waiting share among the territorial health boards analysed.
- **Dermatology** had the largest absolute New Outpatient >52-week specialty backlog in September 2026.

## Tableau Dashboard

The dashboard presents:

- Scotland ongoing waiting-list trend
- Ongoing waits over 52 weeks
- Share of ongoing waits over 52 weeks
- Health board comparison
- Top 10 specialties by >52-week waits
- Monthly completed waits

> Tableau Public dashboard link will be added here.

## Repository Contents

`nhs_waiting_times_analysis.sql` — SQL cleaning, validation and analytical queries.

`README.md` — project methodology, findings and documentation.

## Skills Demonstrated

**SQL:** filtering, aggregation, `CASE`, joins, subqueries, CTEs, views, date conversion, NULL handling and data validation.

**Data Analysis:** data-quality assessment, trend analysis, benchmarking, KPI analysis and identification of potential double-counting issues.

**Tableau:** line charts, ranked bar charts, percentage analysis, dashboard design and data storytelling.

## Notes

Published waiting counts should not automatically be interpreted as counts of unique individual patients. The analysis also avoids combining aggregate specialty rows with their component specialties to reduce the risk of double counting.

---

**Created by Alby Sojan**  
MSc Business Analytics | University of Greenwich
