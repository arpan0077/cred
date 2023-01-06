use market_star_schema;
SELECT cust_id, data_type 
FROM cust_dimen
WHERE city ='kolkata';
select distinct * from cust_dimen;
select distinct customer_segment from cust_dimen;
select  city , customer_segment,count(city) as no_of_city, count(customer_segment) as typ_of_business,
case when city in('kolkata') then 'westbengal' 
else 'other_city'
end as 'city_classification'from cust_dimen
group by city,customer_segment
having city_classification = 'other_city'
order by no_of_city desc;