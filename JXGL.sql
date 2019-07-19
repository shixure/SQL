 create table student(
sno char(5)primary key,
sname varchar2(12) not null,
sdept char(2) not null,
sclass char(2) not null,
ssex char(3),
sage number(2)
);
insert into student values('96001','马小燕','cs','01','女','21');
insert into student values('96002','黎明','cs','01','男','18');
insert into student values('96003','刘东明','ma','01','男','18');
insert into student values('96004','赵志勇','is','02','男','20');
insert into student values('97001','马蓉','ma','02','女','19');
insert into student values('97002','李成功','cs','01','男','20');
insert into student values('97003','黎明','is','03','女','19');
insert into student values('97004','李丽','cs','02','女','19');
insert into student values('97005','司马志明','cs','02','男','18');

create table course
(cno char(3)primary key,
cname varchar(20),
ctime number(3)
);
insert into course values('001','数学分析','144');
insert into course values('002','普通物理','144');
insert into course values('003','微机原理','80');
insert into course values('004','数据结构','72');
insert into course values('005','操作系统','80');
insert into course values('006','数据库原理','80');
insert into course values('007','编译原理','60');
insert into course values('008','程序设计','40');

create table teach
(tname varchar(12),
tsex char(3),
cno char(3),
tdate date,
tdept char(2),
primary key(tname,cno,tdept),
constraint fk_cno foreign key(cno) references course(cno)
);
insert into teach values('王成刚','男','004','1999-9-5','cs');
insert into teach values('李正科','男','003','1999-9-5','cs');
insert into teach values('严敏','女','001','1999-6-8','ma');
insert into teach values('赵高','男','004','1999-3-12','is');
insert into teach values('李正科','男','003','2000-2-23','ma');
insert into teach values('刘玉兰','女','006','2000-2-23','cs');
insert into teach values('王成刚','男','004','2000-3-30','is');
insert into teach values('马悦','女','008','1999-9-5','cs');

create table score
(sno char(5),
cno char(3),
score number(4,1),
primary key(sno,cno),
constraint sno foreign key(sno) references student(sno),
constraint cno foreign key(cno) references course(cno)
);
insert into score values('96001','001','77.5');
insert into score values('96001','003','89');
insert into score values('96001','004','86');
insert into score values('96001','005','82');
insert into score values('96002','001','88');
insert into score values('96002','003','92.5');
insert into score values('96002','006','90');
insert into score values('96005','004','92');
insert into score values('96005','005','90');
insert into score values('96005','006','89');
insert into score values('96005','007','76');
insert into score values('96003','001','69');
insert into score values('97001','001','96');
insert into score values('97001','008','95');
insert into score values('96004','001','87');
insert into score values('96003','003','91');
insert into score values('97002','003','91');
insert into score values('97002','004',null);
insert into score values('97002','006','92');
insert into score values('97004','005','90');
insert into score values('97004','006','85');

create table dept(
dno char(2),
dname varchar2(50)
);
insert into dept values('cs','计算机系');
insert into dept values('is','信息系');
insert into dept values('ma','数学系');
select * from dept;

alter table dept
add constraint pk_dept primary key(dno);
alter table student
add constraint fk_sdept foreign key(sdept)
references dept(dno);

alter table student add birthday date;
--在表student中增加birthday字段
alter table student drop column birthday;
--删除birthday字段
alter table student modify sname varchar2(20) not null;
--将Student表中把Sname 字段修改为Sname(VCHAR2,20)且为非空
alter table student add constraint stu_sname_uniq unique(sname);
--在表student中的sname添加唯一性约束

create table S1 as select * from student where 1=2;
--复制student的表结构到新表S1
select * from S1;
insert into S1 select * from student where sdept='cs'; 
--将表student中的计算机系学生数据插到S1中
create table stu as select * from student;
--拷贝student表中的数据到stu表
update S1 set sage=sage+2;
--将S1表中所有学生年龄加2
update course set ctime=100 where cname='程序设计';
--将course表中课程设计课时改为100
insert into score values('98001','001','95');
--向Score表中插入数据（‘98001’, ‘001’, 95）
insert into score values('97001','010',80);
--向Score表中插入数据（‘97001’, ‘010’, 80）
delete from score where sno='96001';
--删除Score表中学号为‘96001’的成绩信息
delete from score where cno='003';
--删除Score表中课程号为‘003’ 的成绩信息
delete from stu where sdept='cs';
--删除学生表stu中计算机系(‘CS’)的学生信息
delete from S1;
--删除数据库表S1中所有学生的数据
drop table s1;
drop table stu;
--删除数据库表S1和stu


--------------------------作业--------------------------
select sno,sname,ssex,sage from student; 
--（1） (选择表中的若干列)  求全体学生的学号、姓名、性别和年龄。
select count(DISTINCT sno) from score;
--（2） (不选择重复行)  求选修了课程的学生学号。
select * from student;
--（3） (选择表中的所有列)  求全体学生的详细信息。
select sno,sname,2019-sage from student;
--（4） (使用表达式)  求全体学生的学号、姓名和出生年份。
select sno 学号,2019-sage 出生年份 from student;
--（5） (使用列的别名)  求学生的学号和出生年份，显示时使用别名“学号”和“出生年份”。
select sname,sage from student where sage>19;
--（6）(比较大小条件)  求年龄大于19岁的学生的姓名和年龄。
select sname,sdept,sage from student where sage>19 and(sdept='cs'or sdept='is');
--（7） (比较大小条件)  求计算机系或信息系年龄大于18岁的学生的姓名、系和年龄。
select sno,sage from student where sage>19 and sage<=22;
--（8） (确定范围条件)  求年龄在19岁与22岁(含20岁和22岁)之间的学生的学号和年龄。
select sno,sage from student where sage<=19 or sage>22;
--（9） (确定范围条件)  求年龄不在19岁与22岁之间的学生的学号和年龄。
select * from student where sdept='cs'or sdept='is';
--（10）(确定集合条件)  求在下列各系的学生信息：数学系、计算机系。
select * from student where sdept<>'cs'and sdept<>'is';
--（11）(确定集合条件)  求不是数学系、计算机系的学生信息。
select * from student where sname like '李%';
--（12）(匹配查询)  求姓名是以“李”打头的学生。
select * from student where sname like '%志%';
--（13）(匹配查询)  求姓名中含有“志”的学生。
select * from student where sname like '%马__';
--（14）(匹配查询)  求姓名长度至少是三个汉字且倒数第三个汉字必须是“马”的学生。
select sno,cno,score from score where cno in('001','003')and score<90 and score>80 and sno like'96___';
--（15）(匹配查询)  求选修课程001或003，成绩在80至90之间，学号为96xxx的学生的学号、课程号和成绩。
select sno,cno from score where score is null;
--（16）(涉及空值查询)  求缺少学习成绩的学生的学号和课程号。
select sno,cno,score from score where cno=001 order by score desc;
--（17）(控制行的显示顺序)  求选修001课程的学生的学号、课程号和分数，结果按分数降序排序。
select count(*) from student;
--（18）(组函数)  求学生总人数。
select count(distinct sno) from score;
--（19）(组函数)  求选修了课程的学生人数。
select avg(sage) from student where sdept='cs';
--（20）(组函数)  求计算机系学生的平均年龄。
select max(score),min(score),avg(score) from score where cno='001';
--（21）(组函数)  求选修了课程001的最高、最低与平均成绩。
select avg(score),sum(score) from score group by cno;
--（22）(分组查询)  求各门课程的平均成绩与总成绩。
select avg(score),sum(score) from score group by cno order by sum(score);
--（23）(分组查询)  求各门课程的平均成绩与总成绩,结果按总成绩排序。
select sdept,sclass,count(sno),avg(sage) from student group by sdept,sclass;
--（24）(分组查询)  求各系、各班级的人数和平均年龄。
SELECT SNAME,COUNT(*) FROM STUDENT WHERE SDEPT='CS' GROUP BY SDEPT;
--（25）原因：selsct列表与group by不一致
SELECT SAGE FROM STUDENT GROUP BY SNO,sage;
--（26）group by 后加上sage
select sdept,count(*) from student group by sdept having count(*)<3;
--（27）(分组查询)  求学生人数不足3人的系及其相应的学生数。
select sdept,sclass,count(*) from student group by sdept,sclass having sclass!=01;
--（28）(分组查询)  求各系中除01班之外的各班的学生人数。
-------------------------------作业2-------------------------------------------
select sname,cname,score 
from student 
join score on student.sno=score.sno 
join course on score.cno=course.cno
where course.cno='001' and (score<70 or score>90);
--（1）(连接查询)  求选修了课程001且成绩在70分以下或成绩在90分以上的学生的姓名、课程名称和成绩。
select sname,cname,score 
from student a 
join score b on a.sno=b.sno 
join course c on b.cno=c.cno
where c.cno='001' and (score<70 or score>90);
--（2）(连接查询与表的别名)  求选修了课程001且成绩在70分以下或成绩在90分以上的学生的姓名、课程名称和成绩。
select sno,sname,cno,score 
from student natural join score;
--（3）(自然连接查询)  求学生学号、姓名以及其选修课程的课程号和成绩。
select b.sname,b.sdept,b.sage
from student a join student b on a.sno<>b.sno
where a.sname='李丽' and a.sage<b.sage;
--（4）(自身连接查询)  求年龄大于'李丽' 的所有学生的姓名、系和年龄。
select *
from student a left join score b on a.sno=b.sno
where b.cno is null;
--（5）(外部连接查询)  求未选修任何课程的学生的姓名。
select sname,sdept from student 
where sname<>'李丽'
and sage=(select sage from student where sname='李丽');
--（6）(子查询)  求与‘李丽’ 年龄相同的学生的姓名和系。
select sno,sname from student 
where sno=(select sno from score 
where cno=(select cno from course where cname='数据结构'));
--（7）(子查询)  求选修了课程名为‘数据结构’ 的学生的学号和姓名。
select sname,sdept from student
where sdept<>'ma' and sage>any(select sage from student where sdept='ma');
--（8）(子查询ANY)  求比数学系中某一学生年龄大的学生的姓名和系。 
select sname,sdept from student
where sdept<>'ma' and sage>all(select sage from student where sdept='ma');
--（9）(子查询ALL或用MAX())  求比数学系中全体学生年龄大的学生的姓名和系。
select sname,sdept from student 
where exists(select * from score where sno=student.sno and cno='004');
--（10）(相关子查询EXISTS)  求选修了004课程的学生的姓名和系。
select sname,sdept from student 
where not exists(select * from score where sno=student.sno and cno='004');
--（11） (相关子查询 NOT EXIST)  求未选修了004课程的学生的姓名和系。
select sname,sdept from student 
where sname<>'李丽'
and sage=(select sage from student where sname='李丽')
and sdept=(select sdept from student where sname='李丽');
--（12）(子查询)  求与 '李丽' 同系且同龄的学生的姓名和系。