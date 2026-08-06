# Marketing Campaign Performance Analysis

Excel | SQL | Pivot Tables

## Business Question
How did the marketing campaign perform across different channels, regions, and customer segments, and what should the team do next?

## Data
A 6,000-record sales dataset containing transaction-level campaign data, with common real-world issues: duplicate records, missing values, and inconsistent formatting.

## What I Did
- Cleaned the dataset using SQL - fixed inconsistent date formats across multiple patterns, nulled out blank values, and cast columns to correct data types (decimal, int, datetime).
- Checked for duplicate records and handled missing values before analysis.
- Wrote SQL queries to analyze ad spend, revenue potential, channel/region/segment performance, click-through rate, and customer lifetime value, including ranked comparisons across channels and regions.
- Built 5 pivot table reports in Excel to track performance trends across channels, regions, campaign duration, and customer segments.
- Designed an Excel dashboard with KPI cards (Total Impressions, Avg CTR, Total Ad Spend, Avg CLV) and supporting charts to monitor performance at a glance.
- Cross-checked outputs for accuracy before finalizing results.

## Key Findings & Recommendations
- Identified the strongest and weakest performing channels and regions by CTR, impressions, and ad spend.
- Found that Premium customers have a dramatically higher average customer lifetime value than Standard or Budget segments.
- Delivered 6 data-driven recommendations based on the findings, covering where to increase spend and where performance needed attention.

## Files in This Repo
- `Sales_dataset.xlsx` cleaned dataset, pivot tables, and dashboard
- `SQL.sql` SQL used for cleaning, type casting, and analysis

## Tools Used
Excel (Pivot Tables, KPI Dashboard) SQL (data cleaning, joins, window functions)
