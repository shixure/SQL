select count (*) as 总人数 from xs;
--求学生的总人数
select count(distinct sno) from cj;
--求选修了课程的学生人数
select avg(totalcredit) from xs where dept='计算机'; 
--求计算机学生的平均学分
select max(grade),min(grade),avg(grade) from cj where cno='101';
--求选修了课程101的成绩最大值。。。。

select cno,avg(grade),sum(grade) from cj group by cno;
--求各门课程的平均成绩与总成绩
select dept,count(*)from xs group by dept;
--求各专业的人数
select dept,count(*)from xs
group by dept
having count(*)>10;
--求人数在10人以上的专业及人数
select dept,sex,count(*) 人数
from xs 
group by dept,sex;
--
select dept,count(*)
from xs where sname like'王%'
group by dept;
--求各专业姓王的人数

select * from xs order by totalcredit desc;
--将成绩降序排列
select * from cj where cno in('101','102') order by sno asc,cno desc;
--select * from cj where cno='101'or cno='102' order by cno desc;
--求选修课程('101')或课程('102')学生的学生的学号升序排列，课程降序排列

select xs.*,cj.* from xs,cj where xs.sno=cj.sno;
--92
select xs.*,cj.* from xs join cj on xs.sno=cj.sno;
--99

select sno,sname,cname,grade from xs,cj,kc 
where xs.sno=cj.sno and cj.cno=kc.cno and kc.cname='计算机基础' and cj.grade>80;