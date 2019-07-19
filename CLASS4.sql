select sno,sname from xs;
--求全体学生的学号和姓名
select * from xs;
--求全体学生的信息
select sno,extract(year from sysdate)-extract(year from birthday) from xs;
--求学生的学号的姓名
select sno as 学号, extract(year from sysdate)-extract(year from birthday)as 年龄 from xs;
--显示时显示别名“学号”和“姓名”

select 3+2 from xs;
select 3+2 from dual;
select 3+2 as "3+2" from dual;

select distinct sno from cj;
--求选修了课程的学生学号

select * from v$nls_parameters;

select sname,totalcredit from xs where totalcredit>=50;
--求学分大于等于50的学生姓名和学分
select sno,totalcredit from xs where totalcredit between 40 and 49;
--求学分40-49之间（包括40和49）的学生学号和学分
select sno,totalcredit from xs where totalcredit not between 40 and 49;

select * from xs 
where dept in('通信工程','计算机','网络工程'); 
--求在下列各系的学生
select * from xs 
where dept not in('通信工程','计算机','网络工程');

alter table xs
modify sname varchar2(20);
insert into xs(sno,sname) values('001242','司马相如');
select * from xs where sname like '马%';
--求姓名是马打头的学生信息
select * from xs where sname like '%马%';
--求姓名中含有马的学生信息
select * from xs where sname like '%马__';

insert into kc(cno,cname) values('401','DBASE');
insert into kc(cno,cname) values('402','DB_DESINGN');
select * from kc where cname like 'DB%';
select * from kc where cname like 'DB_%';
select * from kc where cname like 'DB\_%' escape '\';
--定义转义字符
select * from kc where term is not null ;
select * from kc ;
update kc set credit=credit+5;
update kc set credit=nvl(credit,0)-5;

select sname,dept,totalcredit from xs where dept in('计算机','通信工程') and totalcredit > 50;
--
select sno,cno,grade from cj where grade between 85 and 95;