SELECT * FROM XS;
--查询整表
SELECT * FROM XS WHERE DEPT ='计算机' AND SNAME='王林';
--查询同时满足两者条件
SELECT SNAME,DEPT FROM XS;
--投影运算
SELECT DISTINCT DEPT FROM XS;
--筛选

select * from xs,kc;
--广义笛卡尔积（无意义）
select sno,sname,cno,cname from xs,kc where sno='001101';
select sno,sname,cno,cname from xs,kc where xs.sno=cj.sno and sno='001101';

select * from xs where sno='001101';
select sno,sname,cno,cname from xs,kc where xs.sno=cj.sno;

create table student
as
select * from xs where dept='计算机';