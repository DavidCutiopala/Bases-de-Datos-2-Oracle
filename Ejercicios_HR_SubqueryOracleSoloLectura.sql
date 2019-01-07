--__________________TALLER_________________________________

--1. Write a query to display the name (first name and last name) for those employee who gets more salary than the employee whose ID is 163 2.
--2. Write a query to display the name (first name and last name),salary, department id, job id 
--for those employees who works in same designation as the employee works whose id is 169. 


--3. Write a query to display the name (first name and last name),salary, department id 
--for those employees who earn such amount of salary which is the smallest salary of any department. 


--4. Write a query to display the employee id, employee name (first name and last name ) for all employees who earn more than the average salary. 
select first_name,last_name,salary from employees 
where salary >(
select  avg(salary) from employees);
--5. Write a query to display the employee name ( first name and last name ), employee id and salary of all employees who report to Payam 

select employee_id from employees 


--6. Write a query to display the department number, name ( first name and last name ), job and department name for all employees in the Finance department.
--7. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121 respectively.
--8. Display all the information of an employee whose id is any of the number 134, 159 and 183.
--9. Write a query to display all the information of the employees whose salary is within the range 1000 and 3000 
--10. Write a query to display all the information of the employees whose salary if within the range of smallest salary and 2500
