select * 
from "brewery_data";

select "SALES_ID", "BRANDS", "QUANTITY", "COUNTRIES"
FROM "brewery_data"
where "COUNTRIES" = 'Nigeria'
and "QUANTITY" > 800
AND "BRANDS" = 'trophy';

select "SALES_ID", "BRANDS", "QUANTITY", "COUNTRIES"
FROM "brewery_data"
where "COUNTRIES" not in ('Nigeria', 'Ghana', 'Togo')
and "QUANTITY" between 700 and 800
and "BRANDS" not LIKE '%gra%';

select distinct "BRANDS"
FROM "brewery_data";

select "SALES_ID", "BRANDS", "QUANTITY", "COUNTRIES"
FROM "brewery_data"
where "COUNTRIES" not in ('Nigeria', 'Ghana', 'Togo')
and "QUANTITY" > 800
and "BRANDS" not LIKE '%gra%'
ORDER BY "QUANTITY" DESC
LIMIT 5;

-- BRAND WITH THE HIGHEST SALE IN SENEGAL IN 2017
select "BRANDS", SUM("QUANTITY") AS "SUM_QUANTITY"
from "brewery_data"
where "COUNTRIES" = 'Senegal'
and "YEARS" = 2017
GROUP BY "BRANDS"
ORDER BY "SUM_QUANTITY" DESC
LIMIT 1;

/** find the max quantity of beta malt produced in
togo in year 2017 and 2019**/
select "QUANTITY"
from "brewery_data"
where "COUNTRIES" = 'Togo'
and "YEARS" IN (2017, 2019)
and "BRANDS" ='beta malt'
order by "QUANTITY" desc
limit 1
;

/** select the top3 brands in brewery data that have
their cost-profit btwn 100000 and 200000 but produced in
2018 in feb,oct and dec **/
select "BRANDS", ("COST" - "PROFIT") as "REVENUE"
from brewery_data
WHERE "YEARS" = 2018
and "MONTHS" in ('February', 'October', 'December')
order by "REVENUE" desc
;



/** TOP 3 BRANDS IN FRANCOPHONE COUNTRIES **/
select "BRANDS"
from "brewery_data"
where "COUNTRIES" in ('Senegal', 'Benin', 'Togo')
and "YEARS" in (2018 , 2019)
;
/**top 2 choice in ghana**/
select "BRANDS", sum("QUANTITY") as "total_quantity"
FROM "brewery_data"
where "COUNTRIES" = 'Ghana'
GROUP BY"BRANDS"
ORDER BY "total_quantity" DESC
LIMIT 2;


/** beer consumed in the past 3 years in the most oil rich country**/
select "BRANDS",sum("QUANTITY") as "total_quantity"
from "brewery_data"
where "COUNTRIES" = 'Nigeria'
and "YEARS" in (2017,2018,2019)
and "BRANDS" not like '%malt'
GROUP BY "BRANDS";


/** FAVORITE MALT BRANDS IN ANGLOPHONE COUNTRIES **/
select "BRANDS", sum("QUANTITY") as "total_quantity"
from "brewery_data" 
where "COUNTRIES" in ('Nigeria','Ghana')
and "YEARS" in (2018,2019)
and "BRANDS" like '%malt'
GROUP BY "BRANDS"
ORDER BY "total_quantity" desc;

/** Which brands sold the highest in 2019 in Nigeria**/
select "BRANDS",sum("QUANTITY") as "total_quantity"
FROM "brewery_data"
where "COUNTRIES" = 'Nigeria'
and "YEARS" = 2019
GROUP BY "BRANDS"
ORDER BY "total_quantity" DESC;

/** Favorites brand in South_South region in Nigeria **/
select "BRANDS", sum("QUANTITY") as "total_quantity"
FROM "brewery_data"
WHERE "COUNTRIES" ='Nigeria'
and "YEARS" = 2019
and "REGION" = 'southsouth'
GROUP BY "BRANDS"
ORDER BY "total_quantity" DESC
LIMIT 1;

/** Country that generated the highest profit in 2019**/
select "COUNTRIES", sum("PROFIT") as "total_profit"
FROM "brewery_data"
WHERE "YEARS" = 2019
GROUP BY "COUNTRIES"
ORDER BY "total_profit" DESC;

/** Help him find the year with the highest profit **/
select "YEARS", sum("PROFIT") as "total_profit"
FROM "brewery_data"
GROUP BY "YEARS"
ORDER BY "total_profit" desc;

