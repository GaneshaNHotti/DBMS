//SQL DATABASE
create table emp
(
ssn varchar(6),
name varchar(20),
deptno int,
salary int,
primary key(ssn));


create table assign
(
ssn varchar(6),
projectno varchar(10),
foreign key(ssn) references emp(ssn) on delete cascade,
foreign key(projectno)references pro(projectno) on delete cascade
);




create table pro
(
projectno varchar(10),
projectarea varchar(10),
primary key(projectno));





insert into emp values(1,'aaa',100,10000);
insert into emp values(2,'bbb',200,20000);
insert into emp values(3,'ccc',300,30000);




insert into pro values(10,'DB');
insert into pro values(20,'SL');
insert into pro values(30,'CN');



insert into assign values(1,10);
insert into assign values(2,20);
insert into assign values(3,30);


select ssn from assign
   where projectno IN (select projectno from pro
		where projectarea='DB');


select count(ssn),deptno from emp group by deptno;



update assign set projectno='200' where ssn='3';





//MONGO DATABASE;


db.createCollection("EMPLOYEE")

db.EMPLOYEE.insert({"SSN":4567,"Name":'James',"DeptNo":'XYZ',"ProjectNo":101})
db.EMPLOYEE.insert({"SSN":3256,"Name":'Jack',"DeptNo":'XYZ',"ProjectNo":102})
db.EMPLOYEE.insert({"SSN":7894,"Name":'Chris',"DeptNo":'ABC',"ProjectNo":103})
db.EMPLOYEE.insert({"SSN":4587,"Name":'dwayne',"DeptNo":'DEF',"ProjectNo":104})
db.EMPLOYEE.insert({"SSN":6644,"Name":'trump',"DeptNo":'DEF',"ProjectNo":104})


db.EMPLOYEE.find().pretty()

1...
db.EMPLOYEE.find({"DeptNo":'XYZ'}).pretty()

2...
db.EMPLOYEE.find({"ProjectNo":104}).pretty()



//PLSQL

set server output on

 BEGIN
       UPDATE EMP
       SET sal=(1.15*sal)+sal
       where dept=10;
       dbms_output.put_line('number of rows updated'||sql%rowcount);
    END;
    /
