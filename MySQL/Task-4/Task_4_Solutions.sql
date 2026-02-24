-- Combine Two Tables

select p.firstname,p.lastname,a.city,a.state
from person p
left join address a
on p.personid = a.personid;

-- Replace Employee ID With The Unique Identifier

select u.unique_id,e.name
from employees e
left join employeeuni u
on e.id = u.id;

-- Customer Who Visited but Did Not Make Any Transactions

select v.customer_id,count(*) as count_no_trans
from visits v
left join transactions t
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id;

-- Project Employees I

select 
    p.project_id,
    cast(avg(cast(e.experience_years as decimal(10,2))) as decimal(10,2)) as average_years
from project p
join employee e
on p.employee_id = e.employee_id
group by p.project_id
order by p.project_id;

-- Sales Person

select name
from salesperson
where sales_id not in (
    select o.sales_id
    from orders o
    join company c
    on o.com_id = c.com_id
    where c.name = 'RED'
);

-- Rising Temperature

select w1.id
from weather w1
join weather w2
on w1.recorddate = dateadd(day, 1, w2.recorddate)
where w1.temperature > w2.temperature;

-- Average Time of Process per Machine

select 
    machine_id,
    round(avg(case when activity_type = 'end' then timestamp end) - 
          avg(case when activity_type = 'start' then timestamp end), 3) as processing_time
from activity
group by machine_id;

-- Students and Examinations

select 
    s.student_id,
    s.student_name,
    sub.subject_name,
    coalesce(count(e.student_id), 0) as attended_exams
from students s
cross join subjects sub
left join examinations e
    on s.student_id = e.student_id and sub.subject_name = e.subject_name
group by s.student_id, s.student_name, sub.subject_name
order by s.student_id, sub.subject_name;

-- Managers with at Least 5 Direct Reports

select 
    e.name
from employee e
join employee r
    on e.id = r.managerid
group by e.id, e.name
having count(r.id) >= 5;

-- Confirmation Rate

select 
    s.user_id,
    round(coalesce(sum(case when c.action = 'confirmed' then 1 else 0 end) * 1.0 / nullif(count(c.user_id),0), 0), 2) as confirmation_rate
from signups s
left join confirmations c
    on s.user_id = c.user_id
group by s.user_id;

-- Product Sales Analysis III

select 
    s.product_id,
    s.year as first_year,
    s.quantity,
    s.price
from sales s
join (
    select product_id, min(year) as first_year
    from sales
    group by product_id
) f
on s.product_id = f.product_id and s.year = f.first_year;

-- Market Analysis I

select 
    u.user_id as buyer_id,
    u.join_date,
    count(o.order_id) as orders_in_2019
from users u
left join orders o
    on u.user_id = o.buyer_id and year(o.order_date) = 2019
group by u.user_id, u.join_date;