create table a(
id char(4),name varchar2(20)
);
drop table a;
insert into a values('01','�Ѻ�΢��');
insert into a values('02','����΢��');
insert into a values('03','��Ѷ΢��');
select *from a;
delete a where id='01';
update a set id='01' where name='����΢��'; 