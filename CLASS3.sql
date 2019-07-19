create table stu
(sno char(6)primary key,
sname varchar2(20) unique,
--唯一性约束
sex char(3) default('男'),
--默认为男
dept varchar2(20)not null,
--非空
constraint stu_sex_cons check(sex in ('男','女'))
--约束
);

drop table stu;
--删除表

select * from stu;
insert into stu values('001','aaaa','女','计算机');
insert into stu values('002','bbbb','女','计算机');
insert into stu(sno,sname,dept) values('003','cccc','计算机');
insert into stu values('004','dddd','中','计算机');

alter table stu modify sname varchar2(10);
--将sname列长度由20改为10
insert into stu values('005','欧阳娜娜','女','计算机');
--测试sname长度
alter table stu add nativeplace varchar2(50);
--在表stu中加入一个新列nativeplace
alter table stu drop column nativeplace;
--在表stu中删除nativeplace列
alter table stu drop constraint SYS_C007068;
--删除表中的唯一性约束
alter table stu add constraint stu_sname_uniq unique(sname);
--添加stu表sname字段的唯一性约束

insert into stu(sno,sname,sex,dept)
--插入一行
select sno,sname,sex,dept
from xs
where dept='计算机';
--将学生表中计算机系中的学生插入到表stu中
create table stu1 as
select * from xs;
--创建表stu1并插入xs的全部数据

update xs set totalcredit=totalcredit+10;
--把xs表所有学生总学分加10
update xs set dept ='计算机',remarks='三好学生' where sname='罗林琳';
--修改多数据
delete from stu where dept='计算机';
--删除计算机系所有学生信息

create tablespace test
datafile 'D:\oraclexe\app\oracle\oradata\XE\test01.dbf'
size 50M;