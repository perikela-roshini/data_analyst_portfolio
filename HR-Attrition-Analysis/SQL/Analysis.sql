-- Total Count
select count( * ) from hr_data;
-- Attrition Count
select Attrition , count(*)  as total 
from hr_data
group by Attrition;
-- Attrition rate
SELECT 
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr_data;
-- Attrition rate by overtime
select OverTime,
count(*) as total ,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
from hr_data
group by OverTime;
-- Attrition rate by income
select case when
MonthlyIncome < 3000 then 'Low'
when MonthlyIncome between 3000 and 7000 then 'Medium'
else 'High'
end as income_group, 
count(*) as total,
count( case when Attrition = 'Yes' then 1 end) * 100.0 / count(*) as attrition_rate 
from hr_data
group by income_group 
order by attrition_rate DESC;
-- Attrition by overtime and income
select OverTime, case
when MonthlyIncome < 3000 then 'Low'
when MonthlyIncome between 3000 and 7000 then 'Medium'
else 'High'
end as income_group,
count(*) as total ,
count( case when Attrition = 'Yes' then 1 end) * 100.0 / count(*) as attrition_rate 
from hr_data
group by OverTime,income_group 
order by attrition_rate desc;
-- Attrition by JobRole
select JobRole , count(*) as total ,
count( case when Attrition = 'Yes' then 1 end) * 100.0 / count(*) as attrition_rate 
from hr_data
group by JobRole
order by attrition_rate desc ;
-- Avg income & Attrition by Sales Representative 
select JobRole, avg(MonthlyIncome) as avg_income ,
count( case when Attrition = 'Yes' then 1 end) * 100.0 / count(*) as attrition_rate 
from hr_data
where JobRole = "Sales Representative"
group by JobRole 
order by attrition_rate;
-- Overtime by Sales Representative
select JobRole , OverTime 
from hr_data
where JobRole = "Sales Representative" and OverTime = "Yes";
-- Job satisfaction & wlb by JobRole
select JobRole ,
avg(JobSatisfaction) as avg_satisfaction,
avg(WorkLifeBalance) as avg_wlb
from hr_data 
group by JobRole 
order by avg_satisfaction asc ;
-- Attrition,jobsatisfaction & wlb by JobRoles
select jobrole,
count(*) as total ,
count( case when Attrition = 'Yes' then 1 end) * 100.0 / count(*) as attrition_rate ,
avg(JobSatisfaction) as avg_satisfaction,
avg(WorkLifeBalance) as avg_wlb
from hr_data
group by JobRole
order by attrition_rate desc;
-- Dept wise Attrition
select Department,
count(*) as total,
count( case when Attrition = 'Yes' then 1 end) * 100.0 / count(*) as attrition_rate 
from hr_data
group by Department
order by attrition_rate desc;
-- Avg income
select * from project_db.hr_data;
select avg(MonthlyIncome) from hr_data;





