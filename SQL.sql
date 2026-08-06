create database e_commerce;
use e_commerce;
select count(id) from sales;
set sql_safe_updates = 0;

-- Fixing datetime issue
alter table sales add column clean_date datetime;

UPDATE sales
SET clean_date = STR_TO_DATE(date,'%Y-%m-%d %H:%i:%s')
WHERE date REGEXP '^[0-9]{4}-';

UPDATE sales
SET clean_date = STR_TO_DATE(date,'%d-%m-%Y %H:%i:%s')
WHERE date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4} .*:.*:.*';

UPDATE sales
SET clean_date = STR_TO_DATE(date,'%d-%m-%Y %H:%i')
WHERE date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4} .*:.*$'
AND clean_date IS NULL;

UPDATE sales
SET clean_date = STR_TO_DATE(date,'%d-%m-%Y')
WHERE LENGTH(date)=10;

SELECT date, clean_date
FROM sales
LIMIT 20;

ALTER TABLE sales DROP COLUMN date;
ALTER TABLE sales CHANGE clean_date date DATETIME;

select cast(ad_spend as decimal(10,2)) from sales;
select count(*) from sales where ad_spend is null;

select date from sales where date is null;

-- Data Cleaning
update sales set ad_spend = null where ad_spend='';
update sales set price = null where price='';
update sales set discount_rate = null where discount_rate='';
update sales set market_reach = null where market_reach='';
update sales set impressions = null where impressions='';
update sales set click_through_rate = null where click_through_rate='';
update sales set competition_index = null where competition_index='';
update sales set seasonality_index = null where seasonality_index='';
update sales set campaign_duration_days = null where campaign_duration_days='';
update sales set customer_lifetime_value = null where customer_lifetime_value='';

-- Casting datatypes
describe sales;

-- Checking to cast before converting into datatypes
select cast(ad_spend as decimal(10,2)) from sales;

-- Converting datatypes
alter table sales
modify id int,
modify ad_spend decimal(12,2),
modify price decimal(10,2),
modify discount_rate decimal(10,4),
modify market_reach int,
modify impressions int,
modify click_through_rate decimal(10,4),
modify competition_index decimal(10,2),
modify seasonality_index decimal(10,4),
modify campaign_duration_days int,
modify customer_lifetime_value decimal(15,2);

-- Finding duplicates
select id,count(*) from sales group by id having count(*)>1;

-- Analytics
-- total ad spend
select sum(ad_spend) as total_marketing_spend from sales;

-- total revenue potential
select sum(price) as total_price from sales;

-- add spend by marketing channel
select sum(ad_spend) as total_spend, channel from sales group by channel order by total_spend desc;

-- best performing product category
select product_category, avg(customer_lifetime_value) as avg_clv from sales group by product_category order by avg_clv desc;

-- campaign performance by region
select region,sum(ad_spend) as total_spend, avg(click_through_rate) as clr from sales group by region;

-- date range
select min(date) as start_date, max(date) as end_date from sales;

-- ad spend by region
select sum(ad_spend) as total_spend, region from sales group by region order by total_spend;

-- MARKETING PERFORMANCE

-- average ctr by channel
select channel,avg(click_through_rate) as avg_ctr from sales group by channel order by avg_ctr desc;

-- market search by channel
select channel,avg(market_reach) as avg_reach from sales group by channel order by avg_reach;

-- CUSTOMER VALUE ANALYSIS

-- customer vallue by segment
select customer_segment, avg(customer_lifetime_value) as avg_clv from sales group by customer_segment order by avg_clv desc;

-- customer value by region
select region, avg(customer_lifetime_value) as avg_clv from sales group by region order by avg_clv desc;

-- PRODUCT ANALYSIS 
-- product category performance
select product_category, avg(customer_lifetime_value) as avg_clv from sales group by product_category order by avg_clv desc;

-- DISCOUNT STRATEGY 
-- impact of dicount on customer values
select discount_rate, avg(customer_lifetime_value) as avg_clv from sales group by discount_rate order by avg_clv desc;

-- campaign performance
select campaign_duration_days, avg(click_through_rate) as avg_ctr from sales group by campaign_duration_days order by avg_ctr desc;

-- rank regions by customer value
select region, avg(customer_lifetime_value) as avg_clv, rank() over(order by avg(customer_lifetime_value) desc) as region_rank from sales group by region;

-- Top markrting channels
select channel, avg(click_through_rate) as avg_ctr, rank() over (order by avg(click_through_rate) desc)AS ctr_rank from sales group by channel;

-- Best product categories by customer values
select product_category, avg(customer_lifetime_value) as avg_clv, rank() over(order by avg(customer_lifetime_value) desc) as category_rank from sales group by product_category;

-- Ad spend efficiency
select channel, avg(ad_spend) as avg_spend, avg(click_through_rate) as avg_ctr from sales group by channel order by avg_ctr desc;
select * from sales limit 1;

select * from sales;
