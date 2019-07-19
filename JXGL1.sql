--1. (存储过程) 创建一个显示学生总人数的存储过程STU_COUNT。--
create or replace procedure STU_COUNT 
is
stucount number;
begin
    select count(sno) into stucount from student;
    dbms_output.put_line('总人数'||stucount);
end;
/
set serveroutput on;
execute STU_COUNT;
begin 
     STU_COUNT;
     end;
/

--2. (存储过程) 创建显示学生信息的存储过程STUDENT_LIST。--
create or replace procedure STUDENT_LIST
as
sno student.sno%type;
sname student.sname%type;
cursor STUDENT_cur is (select sno,sname from student);
begin
    for rec in student_cur loop
    dbms_output.put_line(rec.sno||rec.sname);
    end loop;
end;
/
set serveroutput on;
execute STUDENT_LIST;
/

--3. (存储过程) 创建一个显示学生平均成绩的存储过程。--
create or replace procedure score_avg
as
cursor allscore_cur is (select sno,avg(score) a from score GROUP by sno);
begin
    for rec in allscore_cur loop
    dbms_output.put_line(rec.sno||rec.a);
    end loop;
end;
/
set serveroutput on;
execute score_avg;
/

--4. (存储过程) 创建显示所有学生平均成绩的存储过程。--
create or replace procedure allscore_avg
as
savg score.score%type;
begin
    select avg(score) into savg from score;
    dbms_output.put_line(savg);
end;
/
set serveroutput on;
execute allscore_avg;
/
--5.(存储过程) 创建一个对学生姓名进行模糊查找的带参存储过程。--
create or replace PROCEDURE qname(name student.sname%type)
is
cursor name_cur is SELECT * FROM student WHERE sname like '%'||name||'%';
begin
    for rec in name_cur loop
    dbms_output.put_line(rec.sno||rec.sname);
    end loop;
end;
/
set serveroutput on;
execute qname('李');
/
--6.(触发器) 创建包含插入、删除、修改多种触发事件的触发器Trig_student，对student、course和score表进行参照完整性关系的维护。
--（1）当在score表中插入一条记录时，要检查其学号在student表中和课程号在course表中是否存在，若不存在则不允许插入。
create or replace trigger Trig_student_1 before insert on score
begin
    if not exists(select * from score,student,course where score.sno=student.sno and score.cno=student.cno)
    then dbms_output.put_line('其学号在student表中或课程号在course表中不存在');
    rollback;
    end if;
end;
/
--（2）对student表进行删除操作，则删除score表中对应学号的所有记录；对student表的学号进行更新操作，则更新score表中对应学号的所有记录。
create or replace trigger Trig_student_2 before delete or update on student
for each row
begin
    if deleting then delete from score where sno=:old.sno;
    elsif updating then update score set sno=:new.sno;
    end if;
end;
/
--（3）对course表进行删除操作，则删除score表中对应课程号的所有记录；对course表的课程号进行更新操作，则更新score表中对应课程号的所有记录。
create or replace trigger Trig_student_3 after delete or update on course
for each row
begin
    if deleting then delete from score where cno=:old.cno;
    elsif updating then update score set cno=:new.cno;
    end if;
end;
/
-----------------------------------------------------------------------------------------------------------------
--（1） (建立索引)  为Score表按课程号升序、分数降序建立索引，索引名为SC_GRADE。
create index SC_GRADE on score(cno asc,score desc);
--（2） (删除索引)  删除索引SC_GRADE。
drop index SC_GRADE;
--（3） (建立视图)  建立计算机系的学生的视图STUDENT_CS。
create or replace view STUDENT_CS as (select *from student where sdept='cs'); 
--（4） (建立视图)  建立由学号和平均成绩两个字段的视图STUDENT_GR。
create or replace view STUDENT_GR as (select sno 学号,avg(score) 平均成绩 from score group by sno);
--（5） (视图查询)  利用视图STUDENT_CS，求年龄大于19岁的学生的全部信息。
select * from student_cs where sage>19;
--（6） (视图查询)  利用视图STUDENT_GR，求平均成绩为88分以上的学生的学号和平均成绩。
select 学号,平均成绩 from student_gr where 平均成绩>88;
--（7） (视图更新)  利用视图STUDENT_CS，增加学生( ‘96006’，‘张然’，‘CS’，‘02’，‘男’，19 )。
insert into student_cs values('96006','张然','cs','02','男',19);
--（8）(视图更新)  利用视图STUDENT_CS，将学生年龄增加1岁。观察其运行结果并分析原因。  
update student_cs set sage=sage+1;
--（9） (视图更新)  利用视图STUDENT_GR，将平均成绩增加2分。观察其运行结果并分析原因。
update student_gr set "平均成绩"="平均成绩"+2;
--（10） (视图更新)  删除视图STUDENT_CS中学号为 ‘96006’ 的学生的全部数据。
delete from student_cs where sno='96006';
--（11） (视图更新)  删除视图STUDENT_GR的全部数据。
delete view student_gr;
--(12)  (删除视图)  删除视图STUDENT_CS和STUDENT_GR。
drop view student_cs;
drop view student_gr;