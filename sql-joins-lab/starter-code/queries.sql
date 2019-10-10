
select employee.first, employee.last from employee inner join job on employee.id = job.id where job.company = 'Macy''s';

select job.company from job inner join employee on job.id = employee.id where employee.city='Boston';

select employee.first, employee.last, job.salary from employee inner join job on employee.id = job.id order by salary desc limit 1;

