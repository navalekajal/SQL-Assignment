create table dept1(
dept1id int primary key identity(1,1),
deptname varchar(20)
)
select*from dept1

create table employee(
id int primary key identity(1,1),
empname varchar(20),
city varchar(20),
salary decimal,
dept1id int,
constraint fk_employee_dept1 foreign key(dept1id)references dept1(dept1id)
)
insert into dept1 values('HR')
insert into dept1 values('Development')
insert into dept1 values('Testing')
insert into dept1 values('Sales')

select*from employee

insert into employee values('Kajal','Pune',63000,1)
insert into employee values('Pooja','Mumbai',47000,4)
insert into employee values('Nikita','Pune',65000,2)
insert into employee values('Roshna','Nagpur',35000,5)
insert into employee values('Gauri','Delhi',25000,1)
insert into employee values('Vidya','Nashik',56000,2)
insert into employee values('Priya','Mumbai',45000,3)

alter table employee add managerid int
update employee set managerid =1 where id in(2,3)
update employee set managerid =6 where id in(4,5)
update employee set managerid =8 where id in(7,9,10)

select e.*,d.deptname  from employee e
inner join dept1 d on d.dept1id=e.dept1id

select e.*,d.deptname  from employee e
left join dept1 d on d.dept1id=e.dept1id

select e.*,d.deptname  from employee e
right join dept1 d on d.dept1id=e.dept1id

select e.*,d.deptname  from employee e
full join dept1 d on d.dept1id=e.dept1id

select e.empname as EmployeeName,m.empname as managername
from employee e,employee m
where m.id=e.managerid