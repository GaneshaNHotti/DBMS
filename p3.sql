create table boat
(
bid varchar(6)not null,
bname varchar(20),
colour varchar(10),
primary key(bid)
);


create table sailor
(
sid varchar(6)not null,
sname varchar(20),
age varchar(3),
rating varchar(2),
primary key(sid)
);


create table reserves
(
bid varchar(6),
sid varchar(6),
day varchar(10),
foreign key(bid)references boat(bid)on delete cascade,
foreign key(sid)references sailor(sid)on delete cascade
);



insert into boat values('01','abc','red');
insert into boat values('02','xyz','pink');
insert into boat values('03','def','blue');


insert into sailor values('10','ram','30','5');
insert into sailor values('20','ravi','25','4');



insert into reserves values('01','20','monday');
insert into reserves values('02','10','tuesday');



SELECT BID FROM RESERVES
	WHERE SID IN(SELECT SID FROM
	 	SAILOR WHERE SNAME='RAM');


SELECT BID,SNAME
FROM RESERVES r join SAILOR s on(r.SID=s.SID);


SELECT COUNT(BID),SID FROM RESERVES GROUP BY SID;




//MONGO DB

db.createCollection("BOATRES")

db.BOATRES.insert({"BID":9988,"BNAME":'ABC',"COLOUR":'Black',"SNAME":'John',"SID":1234,"DAY":'2017-12-25'})
db.BOATRES.insert({"BID":8877,"BNAME":'DEF',"COLOUR":'Black',"SNAME":'Smith',"SID":4567,"DAY":'2017-11-24'})
db.BOATRES.insert({"BID":7766,"BNAME":'GHI',"COLOUR":'Blue',"SNAME":'Sucre',"SID":1122,"DAY":'2017-10-24'})
db.BOATRES.insert({"BID":6655,"BNAME":'PQR',"COLOUR":'white',"SNAME":'Sucre',"SID":1122,"DAY":'2017-10-29'})


db.BOATRES.find().pretty()


db.BOATRES.find({"SNAME":'Sucre'}).count()

db.BOATRES.find({"COLOUR":'Black'}).pretty()



//PLSQL


DECLARE
	flag number:=1;
	i number;
	n number;
BEGIN
	n:=&num;
	for i in 2..n/2 loop
	  if mod(n,i)=0 then
	     flag:=0;
    	     exit;
                 end if;
	end loop;
	if flag=0 then
		dbms_output.put_line('Not prime');
	else
		dbms_output.put_line('prime');
	end if;
END;
/



