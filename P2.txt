create table part(
 pno int(10) primary key,
 pname varchar(20),
 colour varchar(20));




create table supplier(	
 sno int(10) primary key,
 sname varchar(20),
 address varchar(20)
);



create table supply(
 pno int(10),
 sno int(10),
 quantity varchar(20),
 primary key(pno,sno),
 foreign key(pno) references part(pno)on delete cascade,
 foreign key(sno) references supplier(sno)on delete cascade
);




insert into part values(10,'guard','red');
insert into part values(20,'bolt','blue');
insert into part values(30,'sheet','pink');


insert into supplier values(100,'abc','banglore');
insert into supplier values(200,'def','manglore');
insert into supplier values(300,'xyz','udupi');



insert into supply values(10,100,'30');
insert into supply values(20,200,'20');
insert into supply values(30,300,'10');




select pno from supply
      where sno IN(select sno from supplier 
                      where sname='abc');



select sname,pname from supplier,supply,part
     where pname='Bolt' AND supply.sno=supplier.sno AND part.pno=supply.pno;


delete from part where colour='Pink';



//MONGO DB

db.createCollection("WAREHOUSE")

db.WAREHOUSE.insert({"PNO":1947,"Pname":'bolts',"Colour":'Black',"SNO":1234,"Sname":'ABC',"Address":'blore'})
db.WAREHOUSE.insert({"PNO":1950,"Pname":'chain',"Colour":'Blue',"SNO":4567,"Sname":'DEF',"Address":'chen'})
db.WAREHOUSE.insert({"PNO":1950,"Pname":'chain',"Colour":'Blue',"SNO":3964,"Sname":'GHI',"Address":'mum'})
db.WAREHOUSE.insert({"PNO":1919,"Pname":'wheel',"Colour":'White',"SNO":4879,"Sname":'PQR',"Address":'delhi'})
db.WAREHOUSE.insert({"PNO":1956,"Pname":'nuts',"Colour":'Black',"SNO":9988,"Sname":'STU',"Address":'kol'})


db.WAREHOUSE.find().pretty()

db.WAREHOUSE.update({"PNO":1950},{$set:{"PNO":2017}},{multi:true})

db.WAREHOUSE.find({"PNO":2017}).pretty()



//PLSQL


BEGIN
       UPDATE SUPPLY
       SET quantity = (1.15 * quantity) + quantity;
       dbms_output.put_line('number of rows updated'||sql%rowcount);

 END;
    /


