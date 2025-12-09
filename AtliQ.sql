create table dim_campaign(
 campaign_id varchar(20) NOT NULL,
  campaign_name varchar(50) NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL,
  PRIMARY KEY (campaign_id)
);
select * from dim_campaign;

CREATE TABLE dim_products (
  product_code varchar(10) NOT NULL,
  product_name varchar(255) NOT NULL,
  category varchar(50) NOT NULL,
  PRIMARY KEY (product_code)
);
select * from dim_products;

CREATE TABLE dim_stores (
  store_id varchar(15) NOT NULL,
  city varchar(50) NOT NULL,
  PRIMARY KEY (store_id)
);

select * from dim_stores;

CREATE TABLE fact_events (
  event_id varchar(10) NOT NULL,
  store_id varchar(10) NOT NULL,
  campaign_id varchar(20) NOT NULL,
  product_code varchar(10) NOT NULL,
  base_price int NOT NULL,
  promo_type varchar(50) DEFAULT NULL,
  quantity_sold_before_promo int NOT NULL,
  quantity_sold_after_promo int NOT NULL
);
select * from fact_events;

--store performance analysis
--1.top 10 according to incremental revenue
select f.store_id,
       s.city,
	   f.campaign_id,
	   round((quantity_sold_after_promo-quantity_sold_before_promo)*base_price)as incremental_revenue,
	   promo_type
from fact_events f
left join dim_stores s
on f.store_id= s.store_id
order by 4 desc
limit 10;

--2.bottom 10 according to ISU
select f.store_id,
       s.city,
	   round(sum(quantity_sold_after_promo)-sum(quantity_sold_before_promo)) as incremental_sold_units  
from fact_events f
left join dim_stores s
on f.store_id= s.store_id
group by f.store_id,s.city
order by 3 asc 
limit 10;


--3.performance of stores by city
SELECT
    s.city,
    SUM(base_price * quantity_sold_before_promo) AS revenue_before_promo,
    SUM(base_price * quantity_sold_after_promo) AS revenue_after_promo,
    SUM((quantity_sold_after_promo - quantity_sold_before_promo) * base_price) AS incremental_revenue,
    SUM(quantity_sold_after_promo - quantity_sold_before_promo) AS incremental_units,
    ROUND(AVG((quantity_sold_after_promo - quantity_sold_before_promo) * 100.0 / quantity_sold_before_promo), 2) AS avg_sales_uplift_percent
FROM fact_events f
left join dim_stores s
on f.store_id= s.store_id
GROUP BY 1
ORDER BY incremental_revenue DESC;


--4.common characteristics of top stores

WITH top_stores AS (
    SELECT
        store_id
    FROM fact_events
    GROUP BY store_id
    ORDER BY SUM((quantity_sold_after_promo - quantity_sold_before_promo) * base_price) DESC
    LIMIT 10
)
SELECT
    f.promo_type,
    p.category,
    ROUND(AVG(f.base_price), 2) AS avg_base_price,
    SUM((f.quantity_sold_after_promo - f.quantity_sold_before_promo) * f.base_price) AS total_incremental_revenue,
    COUNT(DISTINCT f.product_code) AS unique_products_promoted
FROM fact_events f
JOIN dim_products p
    ON f.product_code = p.product_code
WHERE f.store_id IN (SELECT store_id FROM top_stores)
GROUP BY f.promo_type, p.category
ORDER BY total_incremental_revenue DESC;


--promotional 
--1.top 2 promo type accord to incremental revenue
select promo_type,
       sum((quantity_sold_after_promo-quantity_sold_before_promo) *base_price) as incremental_revenue
from fact_events
group by 1
order by 2 desc
limit 2;

--bottom 2 promo type accord to isu
select promo_type,
       sum(quantity_sold_after_promo-quantity_sold_before_promo) as incremental_sold_unit
from fact_events
group by 1
order by 2 
limit 2;
	   
--3.discount based vs 
SELECT
    CASE
        WHEN promo_type ILIKE '%OFF%' THEN 'Discount-Based'
        WHEN promo_type ILIKE '%BOGOF%' THEN 'BOGOF'
        WHEN promo_type ILIKE '%Cashback%' THEN 'Cashback'
        ELSE 'Other'
    END AS promo_category,
    SUM((quantity_sold_after_promo - quantity_sold_before_promo) * base_price) AS incremental_revenue,
    SUM(quantity_sold_after_promo - quantity_sold_before_promo) AS incremental_sold_units,
    ROUND(AVG((quantity_sold_after_promo - quantity_sold_before_promo) * 100.0 / quantity_sold_before_promo), 2) AS avg_sales_uplift_percent
FROM fact_events
GROUP BY 1
ORDER BY incremental_revenue DESC;


--product and category
--product category with most significant sales lift
select p.category,
       round(sum(quantity_sold_after_promo - quantity_sold_before_promo)) as incremental_sold_units,
       ROUND(AVG((quantity_sold_after_promo - quantity_sold_before_promo) * 100.0 / NULLIF(quantity_sold_before_promo, 0)), 2) AS avg_percent_lift
from fact_events f
left join dim_products p
on f.product_code=p.product_code
GROUP BY 1
ORDER BY 2 DESC;
	   
--Top 5 products that performed exceptionally well
SELECT 
    dp.product_name,
    dp.category,
    SUM(quantity_sold_after_promo - quantity_sold_before_promo) AS total_incremental_units,
    SUM((quantity_sold_after_promo - quantity_sold_before_promo)*base_price) AS total_incremental_revenue
FROM fact_events fe
JOIN dim_products dp 
    ON fe.product_code = dp.product_code
GROUP BY dp.product_name, dp.category
ORDER BY total_incremental_revenue DESC
limit 5;

--bottom 5 products that performed poorly
SELECT 
    dp.product_name,
    dp.category,
    SUM(quantity_sold_after_promo - quantity_sold_before_promo) AS total_incremental_units,
    SUM((quantity_sold_after_promo - quantity_sold_before_promo)*base_price) AS total_incremental_revenue
FROM fact_events fe
JOIN dim_products dp 
    ON fe.product_code = dp.product_code
GROUP BY dp.product_name, dp.category
ORDER BY total_incremental_revenue 
limit 5;


--correlation between promotion type and product
SELECT 
    dp.category AS product_category,
    fe.promo_type,dc.campaign_name,
    SUM(quantity_sold_after_promo - quantity_sold_before_promo) AS total_incremental_units,
    SUM((quantity_sold_after_promo - quantity_sold_before_promo)*base_price) AS total_incremental_revenue,
    ROUND(AVG((quantity_sold_after_promo - quantity_sold_before_promo)*base_price)::numeric, 2) AS avg_incremental_revenue_per_campaign
FROM fact_events fe
JOIN dim_products dp 
    ON fe.product_code = dp.product_code
JOIN dim_campaign dc 
    ON fe.campaign_id = dc.campaign_id
GROUP BY 1,2,3
ORDER BY 1,4 DESC;







