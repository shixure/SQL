create index xs_sname_idx on xs(sname);
--对XS表的姓名列创建索引
select * from xs where sname like '张%';
create unique index xs_sname_uniq_idx on xs(sname);
--对XS表的姓名列创建唯一索引。
drop index xs_sname_idx;
create index cj_idx on cj(sno,cno);
--为CJ表创建学号列和课程号列的复合索引
create view v_xs
as
select * from xs where dept='计算机';
select * from v_xs;
--建立计算机系的学生视图xs_dept_view 
create or replace view v_xs
as
select * from xs where dept='计算机'
with check option;
--建立计算机系的学生视图xs_dept_view 
select * from v_xs;
update v_xs set dept='信息工程'where sno='001101';
--
create or replace view cj_avg_view(sno,avg_grade) 
as
select sno,avg(grade) from cj group by sno;
--把学生的学号及它的平均成绩定义为视图cj_avg_view 。别名
select * from cj_avg_view where avg_grade>90;

create or replace synonym cj_v for cj_avg_view;
select * from cj_v;
--

create sequence xs_seq
maxvalue 999999
start with 999000
increment by 1;

insert into xs(sno,sname) values(xs_seq.nextval,'aaa');
select xs_seq.currval from dual;
select xs_seq.nextval from dual;
