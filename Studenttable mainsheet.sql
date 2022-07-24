create database project1
create table salarysheet
( EmpID int identity primary key ,
 Name nvarchar(20),
Monthly_Income int,
Government_Tax float(5),
In_hand_salary int
)

Alter Table salarysheet Add Empid int Identity(1,1)

SET IDENTITY_INSERT project1.dbo.salarysheet  ON  


drop table salarysheet
select * from salarysheet

alter table salarysheet

update salarysheet
set Government_Tax= 0.25
where EmpID=2

update salarysheet
set EmpID  identity column

truncate table salarysheet

insert into salarysheet (
Name,
Monthly_Income,
Government_Tax
)
values(
'Sankar',
21000,
0.34
),
(
'Shiva',
30000,
0.25),
('Maya',
25000,
0.21)
update salarysheet
set In_hand_salary =Monthly_income-Monthly_income*Government_Tax

select * from salarysheet



---creating a store procedure to insert values into table
alter procedure sp_insertValuesintotable
@Name nvarchar(20),
@Monthly_income int,
@Government_Tax float(20)
as
begin
insert into salarysheet
(Name, Monthly_Income,Government_Tax)
Values(@Name,@Monthly_Income,@Government_Tax)
update salarysheet
set In_hand_salary =Monthly_income-Monthly_income*Government_Tax

end
delete from salarysheet where empid=7
execute sp_insertValuesintotable 'Mahesh',31000,0.22

--creating a new column in existing table salarysheet
alter table salarysheet
add Sanchaya_Kosh float(20)

---updating the value of sanchayakosh from salarysheet
update salarysheet
set Sanchaya_Kosh= In_hand_salary*0.1

---adding another column as final salary to be transferred into bank

alter table salarysheet
add Final_Salary float(20)
update salarysheet
set Final_Salary=In_hand_salary-Sanchaya_Kosh

select* from salarysheet

--now we will drop this table and compact all code into a store procedure
drop table salarysheet

---creating a table named as StudentDetails for one school which contains following columns
create table StudentDetails
(
[S.N] int identity primary key,
[Student's Name] nvarchar(20),
Department nvarchar(20),
[Tuition Fees] int,
[Hostel Fees] int,
[Library Fees] int,
[Discount Percent] int,
[Total Fees] int
)

select * from StudentDetails

---Creating store procedure to Insert the values
create proc Sp_forinsertdetails
@studentname nvarchar(20),
@Department nvarchar(20),
@tuitionfees int,
@hostelfees int,
@Libraryfees int,
@Discpercent int
as 
begin
insert into StudentDetails

([Student's Name] ,Department ,[Tuition Fees],[Hostel Fees] ,[Library Fees] ,[Discount Percent])

values
(@studentname ,@Department ,@tuitionfees ,@hostelfees, @Libraryfees ,@Discpercent )
update StudentDetails
Set [Total Fees] = ([Tuition Fees]+[Hostel Fees]+[Library Fees])-([Tuition Fees]+[Hostel Fees]+[Library Fees])*[Discount Percent]/100
end

---now executing this store procedure

execute Sp_forinsertdetails 'Sunil', 'ECE', 1500, 1500, 1200, 10
execute Sp_forinsertdetails 'Pawan', 'Aero', 1300, 1500, 1200, 8
execute Sp_forinsertdetails 'Sandeep', 'Mech', 1800, 1500, 1200, 9
execute Sp_forinsertdetails 'Bikram', 'CSE', 2000, 1500, 1200, 10

select * from studentdetails

---now creating a insert trigger for a audit table





