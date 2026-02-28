-- Duplicate emails

select 
    email
from person
group by email
having count(id) > 1;


-- Remove Duplicate emails

delete from person
where id not in (
    select 
        id
    from (
        select 
            min(id) as id
        from person
        group by email
    ) as temp
);


-- Nth Highest Salary

create function getnthhighestsalary (n INT) returns int
begin
    return (
        select 
            distinct salary
        from (
            select 
                salary,
                dense_rank() over(order by salary desc) as rnk
            from employee
        ) as ranked
        where rnk = n
    );
end;


-- Rank Scores

select 
    score,
    dense_rank() over(order by score desc) as rank
from scores;


-- Department Highest Salary

select 
    d.name as department,
    e.name as employee,
    e.salary as salary
from department d
inner join employee e
    on d.id = e.departmentid
inner join (
    select 
        departmentid,
        max(salary) as maxsalary
    from employee
    group by departmentid
) as temp
    on e.departmentid = temp.departmentid
    and e.salary = temp.maxsalary;