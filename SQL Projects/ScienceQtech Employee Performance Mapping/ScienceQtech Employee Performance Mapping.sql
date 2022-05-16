-- SQL Project 1 - ScienceQtech Employee Performance Mapping 
--------------------------------------------------------------------------------------------

# 1. Create a database named employee, then inport given datasets into employee database
show databases;
create database employee;
use employee;
show tables;



# 2. Create an ER diagram for the given employee database
-- it will be submit during project submission



/*
# 3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, 
and make a list of employees and details of their department
 */

select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT from employee.emp_record_table;



/* 
# 4. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
less than two
greater than four 
between two and four 
*/

# less than two
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from employee.emp_record_table where EMP_RATING <2;

# greater than four
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from employee.emp_record_table where EMP_RATING >4;

#between two and four
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from employee.emp_record_table where EMP_RATING between 2 and 4;



/*
# 5. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department 
from the employee table and then give the resultant column alias as NAME. 
*/

select concat(FIRST_NAME, ' ', LAST_NAME) as NAME from employee.emp_record_table where DEPT = 'Finance';



/*
# 6. Write a query to list only those employees who have someone reporting to them. 
Also, show the number of reporters (including the President)
*/

select * from employee.emp_record_table where ROLE in ('MANAGER','PRESIDENT');
select count(ROLE) as Reporters_including_the_President from employee.emp_record_table;


/* 
# 7. Write a query to list down all the employees from the healthcare and finance departments using union. 
Take data from the employee record table.
*/

select FIRST_NAME, LAST_NAME, DEPT from employee.emp_record_table where DEPT = 'HEALTHCARE' union select FIRST_NAME, LAST_NAME, DEPT from employee.emp_record_table where DEPT = 'FINANCE';  



/* 
# 8. Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. 
Also include the respective employee rating along with the max emp rating for the department.
*/

select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, max(EMP_RATING) as MAX_EMP_RATING from employee.emp_record_table group by DEPT order by MAX_EMP_RATING desc;


# 9. Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.

select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, min(SALARY) as MIN_SALARY, max(SALARY) as MAX_SALARY from employee.emp_record_table group by ROLE;



# 10. Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

select concat(FIRST_NAME,' ',LAST_NAME) as Name, EXP, rank() over(order by EXP desc) as Rank_With_EXP from employee.emp_record_table;



# 11. Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.

select EMP_ID, concat(FIRST_NAME, ' ', LAST_NAME) as Name, COUNTRY, SALARY as SALARY_Above_6K from employee.emp_record_table where SALARY >6000 order by SALARY_Above_6K desc;



# 12. Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.

select EMP_ID, concat(FIRST_NAME, ' ', LAST_NAME) as Name, EXP from employee.emp_record_table where EMP_ID in (select EMP_ID where EXP >10 order by EXP desc);
 
 /* 
 # 13. Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. 
Take data from the employee record table.
*/

delimiter $$
create procedure EXP_More_Than_3()
begin
select * from emp_record_table where EXP >3 
order by EXP;
end $$
call EXP_More_Than_3();


/*
# 14. Write a query using stored functions in the project table to check whether the job profile assigned to each employee 
in the data science team matches the organization’s set standard.

The standard being:

For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.
*/

select FIRST_NAME, LAST_NAME, ROLE, EXP,
case

when exp <= 2 then 'Junior Data Scientist'
when exp between 2 and 5 then 'Associate Data Scientist'
when exp between 5 and 10 then 'Senior Data Scientist'
when exp between 10 and 12 then 'Lead Data Scientist'
When exp between 12 and 16 then 'Manager'
 
else 'Not Assign A Value' 

end as Role_Assigned from emp_record_table;


/*
# 15. Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ 
in the employee table after checking the execution plan.
*/
# method one 
create index index_F_NAME on emp_record_table(FIRST_NAME = Eric);

# method two 
create table lookup (FIRST_NAME char) FIRST_NAME = Eric;

# method three 
create index FIRST_NAME_index ON lookup (FIRST_NAME = Eric) using btree;



/*
# 16. Write a query to calculate the bonus for all the employees, 
based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
*/

select FIRST_NAME, LAST_NAME, SALARY, EMP_RATING from emp_record_table round((0.05% * SALARY)* EMP_RATING) as Bonus order by Bonus desc;


/*
# 17. Write a query to calculate the average salary distribution based on the continent and country. 
Take data from the employee record table.
*/

select CONTINENT, COUNTRY, round(avg(SALARY)) as Average_SALARY from emp_record_table group by CONTINENT, COUNTRY order by Average_SALARY desc;

select continent , avg(salary) as "avergae salary continent" from emp_record_table group by continent;

select country , avg(salary) as "average country salary " from emp_record_table group by country; 