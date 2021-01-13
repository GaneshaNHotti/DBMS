create table books(
ISBN varchar(10),
title varchar(10),
author varchar(10),
publisher varchar(10),
primary key(ISBN));


create table student
(
usn varchar(10) PRIMARY KEY,
name varchar(10),
sem int,
dept varchar(3)
);

create table borrow 
(
ISBN varchar(10),
usn varchar(10),
dates date,
foreign key(ISBN) references books(ISBN) on delete cascade,
foreign key(usn) references student(usn) on delete cascade
);


Insert into books values('10','CN','ABC','XYZ');
Insert into books values('20','DBMS','DEF','XYZ');
Insert into books values('30','IPR','PQR','MNO');



Insert into student values('1','GAN',5,'ISE');
Insert into student values('2','CHE',5,'CSE');
Insert into student values('3','SHO',5,'CSE');


Insert into borrow values('10','1','2019-10-23');
Insert into borrow values('20','2','2019-11-05');
Insert into borrow values('30','3','2019-05-24');




select NAME from student where USN=(select USN from borrow where ISBN='10');


select NAME from student where USN=(select USN from borrow where ISBN=(select ISBN from books where TITLE='CN'));


select count(ISBN),USN from borrow group by USN;



//MONGO



db.createCollection("LIBRARY")

db.LIBRARY.insert({"ISBN":1122,"TITLE":'datbase',"AUTHOR":'ABC',"PUBLISHER":'selina',"SSN":2015,"date":'2017-05-29'})
db.LIBRARY.insert({"ISBN":2233,"TITLE":'datbase',"AUTHOR":'DEF',"PUBLISHER":'mcgraw',"SSN":2016,"date":'2017-06-29' })
db.LIBRARY.insert({"ISBN":3344,"TITLE":'dip',"AUTHOR":'GHI',"PUBLISHER":'gonzalez',"SSN":2017,"date":'2016-06-29' })
db.LIBRARY.insert({"ISBN":3355,"TITLE":'os',"AUTHOR":'LKB',"PUBLISHER":'pearson',"SSN":2018,"date":'2016-06-01' })



db.LIBRARY.find().pretty()


db.LIBRARY.find({"ISBN":1122},{"SSN":1,_id:0}).pretty()


db.LIBRARY.find({"TITLE":'datbase'},{"SSN":1,_id:0}).pretty()


//PLSQL


//FIBO PROG

DECLARE
	a number;
	b number;
	c number;
	n number;
	i number;
BEGIN
	n:=8;
	a:=0;
	b:=1;
	dbms_output.put_line(FIBO NUMBERS:);
	dbms_output.put_line(a);
	dbms_output.put_line(b);
	for i in 1..n-2
	loop
	  c:=a+b;
	  dbms_output.put_line(c);
	  a:=b;
	  b:=c;
	end loop;
END;
/


