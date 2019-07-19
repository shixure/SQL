select a.sno,sname,c.cno,grade
from xs a join cj b on a.sno=b.sno join kc c on b.cno=c.cno
where cname ='计算机基础' and grade=80;
--查找选修了“计算机基础”课程且成绩在80分以上的学生学号、姓名、课程名、成绩
select sname,dept,birthday
from xs where birthday<'1990-01-03';
select * 
from xs a join xs b on a.sn<>b.sno 
where a.sname='王燕' and a.birthday>b.birthday;
--求年龄大于王燕的所有学生的姓名、专业名和出生日期
select *
from xs a left join cj b on a.sno=b.sno
where b.sno is null;
--求没有选修课程的学生
select *
from xs natural join cj natural join kc
where cname='计算机基础';
--自然连接
select sno 
from cj
where cno=
(select cno from kc where cname ='离散数学');
--查找选修离散数学的学生的学号
select sname from xs where sno in
(select sno from cj where cno=
(select cno from kc where cname ='离散数学'));
--查找学生选修离散数学的的姓名

select *
from xs
where dept<>'计算机' and birthday<all(select birthday from xs where dept='计算机');
select *
from xs
where dept<>'计算机' and birthday<(select min(birthday) from xs where dept='计算机');
--查找比所有计算机系年龄都大的学生
update xs set birthday='1985-01-01'where sname='张三';
rollback;
--回退
update xs set dept='通信工程'where sname='张三';

select sno from cj
where cno=206 and grade>=any(select grade from cj where cno=101); 
select sno from cj
where cno=206 and grade>=(select min(grade) from cj where cno=101); 
--查找课程号206的成绩不低于课程号101的最低成绩的学生学号