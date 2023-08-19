-- select all customers
select concat(firstName,' ',lastName) as Customer from customer group by Customer order by Customer asc;

-- client contact info
select firstName, phone, email from customer;

-- see the newest vehicles that came to the workshop
select * from vehicle where vyear > '2023';

-- retrieve info about the client and his Car
select concat(firstName,' ',lastName) as Client, v.make, v.model as CarModel from customer c
  join vehicle v on c.idCustomer = v.vCustomerID;

-- The employees by salary
select eName, jobTitle, salary from employee order by salary DESC;

-- see the most expensive services
select serviceName, servPrice from service order by servPrice DESC LIMIT 5;

-- count the number of aapointments per service:
select GROUP_CONCAT(CONCAT(c.firstName, ' ', c.lastName)) as CustomerNames, s.serviceName, COUNT(*) as numAppointments
from appointment a
join service s on a.serviceID = s.idService
join customer c on a.aCustomerID = c.idCustomer
group by s.serviceName;

-- Looking for a specific customer:
select * from customer where firstName = 'Wanda';

-- retrieve older vehicles:
select * from vehicle where vyear < '1999';

-- Looking for range of appointment of dates:
select * from appointment where appointmentDate between '2023-08-01' and '2023-09-31';

-- Mechanic that have a salary greater than 5000:
select * from employee where jobTitle = 'Mechanic' and salary > 5000;

-- DDI from Argentina:
select * from customer where phone like '54%';

-- see the vehicles with missing VIN:
select * from vehicle where VIN is null;

-- Lookin for a specific service at specific date:
select * from appointment where appointmentDate = '2023-09-12' and serviceID = 5;

-- Looking for jobs that aren't Mechanic:
select * from employee where not jobTitle = 'Mechanic';

-- See the customer name, birthdate and age.
select idCustomer, firstName, lastName, birthdate, 
  year(CURDATE()) - year(birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birthdate, '%m%d')) as age
  from customer;

-- order by Year of car.
select * from vehicle order by vyear desc;

-- return the number of appointments group by service.
select s.serviceName, COUNT(*) as numAppointments from appointment a
  join service s on a.serviceID = s.idService
  group by s.serviceName
  having COUNT(*) > 1;

-- return the salary avg by job having avg salary < 3000
select jobTitle, AVG(salary) as avgSalary from employee
  group by jobTitle
  having AVG(salary) < 3000;

-- return the salary avg by job having avg salary > 3000
select jobTitle, AVG(salary) as avgSalary from employee
  group by jobTitle
  having AVG(salary) > 3000;

-- return client/vehicle join info
select customer.firstName, vehicle.make, vehicle.model from customer
  inner join vehicle on customer.idCustomer = vehicle.vCustomerID;

-- self join to see the employees that aren't 'Manager'.
select e1.eName, e2.eName as managerName from employee e1
  left join employee e2 on e1.jobTitle = e2.eName
  where e1.jobTitle != 'Manager';