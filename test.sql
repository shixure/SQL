create table a(
id char(4),name varchar2(20)
);
drop table a;
insert into a values('01','ËÑºüÎ¢²©');
insert into a values('02','ĞÂÀËÎ¢²©');
insert into a values('03','ÌÚÑ¶Î¢²©');
select *from a;
delete a where id='01';
update a set id='01' where name='ĞÂÀËÎ¢²©'; 