create table part(
 pno int(10) primary key,
 pname varchar(20),
 colour varchar(20)
);



create table warehouse(
 wno varchar(10) primary key NOT NULL,
 wname varchar(20),
 city varchar(10)
);



create table shipment(
 pno int(10),
 wno varchar(10),
 quantity varchar(20),
 datee date, 
 primary key(pno,wno),
 foreign key(pno) references part(pno)on delete cascade,
 foreign key(wno) references warehouse(wno)on delete cascade
);




INSERT INTO PART VALUES('01','ABC','RED');
INSERT INTO PART VALUES('02','DEF','BLUE');
INSERT INTO PART VALUES('03','LMN','GREEN');
INSERT INTO PART VALUES('04','PQR','YELLOW');
INSERT INTO PART VALUES('05','XYZ','PINK');




INSERT INTO WAREHOUSE VALUES('10','AAA','KUMTA');
INSERT INTO WAREHOUSE VALUES('20','BBB','MUMBAI');
INSERT INTO WAREHOUSE VALUES('30','CCC','BANGALORE');
INSERT INTO WAREHOUSE VALUES('40','DDD','UDUPI');
INSERT INTO WAREHOUSE VALUES('50','EEE','KARWAR');



INSERT INTO SHIPMENT VALUES('01','20','300','2013-02-28');
INSERT INTO SHIPMENT VALUES('02','30','400','2013-01-30');
INSERT INTO SHIPMENT VALUES('03','10','00','2013-01-31');
INSERT INTO SHIPMENT VALUES('04','40','600','2013-03-31');





SELECT WNAME FROM WAREHOUSE
	WHERE WNO IN(SELECT WNO FROM SHIPMENT WHERE PNO=(SELECT PNO FROM
		PART WHERE COLOUR='RED'));


SELECT PNO,WNAME
	FROM SHIPMENT s join WAREHOUSE w on(s.WNO=w.WNO);



SELECT COUNT(PNO),WNO FROM SHIPMENT GROUP BY WNO;



SELECT W.WNO,W.WNAME,W.CITY FROM WAREHOUSE W JOIN SHIPMENT S ON (W.WNO=S.WNO) WHERE QUANTITY IN(SELECT MAX(QUANTITY) FROM SHIPMENT);




//MONGO


db.createCollection("SHIPMENT")


db.SHIPMENT.insert({"PNO":11,"PNAME":'bolts',"COLOUR":'Black',"WNO":99,"WNAME":'ABC',"QUANTITY":45,"DATE":'2017-09-25'})
db.SHIPMENT.insert({"PNO":12,"PNAME":'nuts',"COLOUR":'Black',"WNO":99,"WNAME":'ABC',"QUANTITY":38,"DATE":'2017-09-28'})
db.SHIPMENT.insert({"PNO":13,"PNAME":'chain',"COLOUR":'white',"WNO":97,"WNAME":'DEF',"QUANTITY":68,"DATE":'2017-08-28'})
db.SHIPMENT.insert({"PNO":14,"PNAME":'bolts',"COLOUR":'Black',"WNO":88,"WNAME":'PQR',"QUANTITY":10,"DATE":'2017-01-25'})
db.SHIPMENT.insert({"PNO":19,"PNAME":'wheel',"COLOUR":'Blue',"WNO":99,"WNAME":'ABC',"QUANTITY":54,"DATE":'2017-01-01'})


db.SHIPMENT.find().pretty()


db.SHIPMENT.find({"WNAME":'ABC'}).pretty()


db.SHIPMENT.aggregate([{ $group:{_id:"$WNAME",total:{$sum:"$QUANTITY"}}}])



//PLSQL


create table emp1(
   ssn varchar(20),
    name char(20),
    deptno number(10),
   salary int,
  primary key(ssn));

insert into emp1('&ssn','&name','deptno','salary');

create table emp2(
   ssn varchar(20),
    name char(20),
    deptno number(10),
   salary int,
  primary key(ssn));

set serveroutput on

DECLARE
 	cursor cur is select* from emp1;
	counter int;
	rows emp1%rowtype;
BEGIN
	open cur;
	loop
	fetch cur into rows;
	exit when cur%notfound;
	insert into emp2 values(rows.ssn,rows.name,rows.deptno,rows.salary);
	end loop;
	counter:=cur%rowcount;
	close cur;
	dbms_output.put_line(counter||'rows inserted into table emp2');
END;
/
