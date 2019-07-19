select * 
from xs a join xs b on a.sno<>b.sno 
where (a.sname='王燕' and a.birthday>b.birthday) or (b.sname='程明' and a.dept=b.dept); 

select * from xs
where dept=(select dept from xs where sname='程明')
or birthday<(select birthday from xs where sname='王燕');
--求与程明同姓或年龄大于王燕的学生信息
select sno,sname,totalcredit,(select max(totalcredit)from xs)
from xs;
--求每个学生的学号姓名最高学分
delete from xs where totalcredit is null;
select *
from (select*from xs order by totalcredit desc)
where rownum<6;
--求学分最高的5名学生
select sname from xs where sno in (select sno from cj where cno='102');
select sname from xs 
where exists(select * from cj where sno=xs.sno and cno='102');
--查询所有选修了102号课程的学生姓名
select sname from xs
where not exists
(select cno from kc where not exists
(select * from cj where sno=xs.sno and cno=kc.cno));
--求出选修全部课程学生姓名
select sno from cj where cno in ('101','102');
select sno from cj where cno='101'
union ALL select sno from cj where cno='102';
--查询所有选修了101或102号课程的学生学号,all保留重复行
select sno from cj where cno ='101'
intersect select sno from cj where cno='102';
--查询所有选修了101和102号课程的学生学号
select sno from xs 
minus select sno from cj where cno='102';
select sno from xs where sno not in (select sno from cj where cno ='102');


select * from (select rownum id,t.* from(select * from xs order by totalcredit desc)t)where id >5 and id<9;