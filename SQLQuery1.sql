use Tesla
select * from employee
select * from dept1
--1
select * from employee where salary>
(select avg(salary) from employee)

--2

select * from employee where salary>
(select salary from employee where id=5)


--3
select * from employee where salary>
(select avg(salary)from employee where dept1id=
(select dept1id from dept1 where deptname in('Development')))

--4

select * from employee where salary>all
(select avg(salary) from employee
group by dept1id)

select * from dept1
update dept1 set deptname='Development' where dept1id='1'

update dept1 set deptname='HR' where dept1id='2'

update dept1 set deptname='Sales' where dept1id='3'

update dept1 set deptname='Manager' where dept1id='4'

--write sp for update the dpt
create proc SP_updatee_dept1(
@deptname varchar(20),@id int
)
as begin
update dept1 set deptname=@deptname where dept1id=@id
return
end

exec SP_updatee_dept1
@deptname='Team lead',
@id=5
--write sp for delete the dept

create proc SP_delet_dept1(
@id varchar(20)
)
as begin
delete from dept1 where dept1id=@id
return
end

exec SP_delet_dept1
@id=5


altr fumction dis_price_products
(@price decimal)

returns decimal
as begin
declare @disprice decimal;
set @disprice-@price(@price*0.10);
return @disprice
end

select productname,price,dbo.dis_price_products(price) from products

select * from products