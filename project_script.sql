
--1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT(*) FROM 
data_analyst_jobs;


--2.Write a query to look at just the first 10 rows.
--What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ans:EXXon mobil

--3.	How many postings are in Tennessee? 
--How many are there in either Tennessee or Kentucky?

SELECT COUNT(*) AS NUM_POSTINGS
FROM data_analyst_jobs
WHERE location ='TN';

SELECT COUNT(location) AS NUM_POSTINGS
FROM data_analyst_jobs
WHERE location ='TN' OR location='KY';

--4.	How many postings in Tennessee have a star rating above 4?
SELECT COUNT(location) 
FROM data_analyst_jobs
WHERE star_rating>4 AND location='TN';

--5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--6.	Show the average star rating for companies in each state.
--The output should show the state as `state` and the average rating for the state as `avg_rating`.
--Which state shows the highest average rating?


SELECT location AS state,avg(star_rating) AS avg_rating
FROM data_analyst_jobs
where star_rating is NOT NULL
GROUP BY location 
ORDER BY avg_rating desc;

SELECT location AS state,avg(star_rating) AS avg_rating
FROM data_analyst_jobs
where star_rating is NOT NULL
GROUP BY location 
ORDER BY avg_rating desc
LIMIT 1;


--7.	Select unique job titles from the data_analyst_jobs table.
--How many are there?
SELECT distinct title
FROM data_analyst_jobs;

SELECT count(distinct title)
FROM data_analyst_jobs;


--8.	How many unique job titles are there for California companies?


SELECT COUNT(distinct title)
FROM data_analyst_jobs
WHERE location='CA';

--9.Find the name of each company and its average star rating for all companies
--that have more than 5000 reviews across all locations.
--How many companies are there with more that 5000 reviews across all locations?
SELECT  company,avg(star_rating) as average_rating 
FROM data_analyst_jobs
WHERE review_count >5000 AND location IS NOT NULL
GROUP BY company
;

SELECT count(company)
FROM data_analyst_jobs
WHERE review_count>5000 and location is not null
;

SELECT COUNT(company),location
FROM data_analyst_jobs
WHERE review_count>5000
GROUP BY location
;

--10.	Add the code to order the query in #9 
--from highest to lowest average star rating.
--Which company with more than 5000 reviews across
--all locations in the dataset has the highest star rating?
--What is that rating?

SELECT  company,avg(star_rating) as average_rating 
FROM data_analyst_jobs
where review_count >5000 and location is not null
GROUP BY company
ORDER BY average_rating desc;
--rating 4.19999

--11.	Find all the job titles that contain the word ‘Analyst’.
--How many different job titles are there? 

SELECT  DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

SELECT count( DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';


--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
--What word do these positions have in common?

SELECT  title 
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%';



SELECT COUNT( title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE'%analytics%';

--bonus

SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'AND days_since_posting>21 AND DOMAIN IS NOT null
;



SELECT domain,count(domain)as hard_to_fill 
FROM data_analyst_jobs
WHERE skill ilike '%SQL%'and days_since_posting>21 and domain is not null
GROUP BY domain
ORDER BY hard_to_fill DESC
; 


SELECT domain,COUNT(domain)AS hard_to_fill
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'AND days_since_posting>21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill DESC
LIMIT 4; 

select * from data_analyst_jobs;



