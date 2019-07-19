--1. (�洢����) ����һ����ʾѧ���������Ĵ洢����STU_COUNT��--
create or replace procedure STU_COUNT 
is
stucount number;
begin
    select count(sno) into stucount from student;
    dbms_output.put_line('������'||stucount);
end;
/
set serveroutput on;
execute STU_COUNT;
begin 
     STU_COUNT;
     end;
/

--2. (�洢����) ������ʾѧ����Ϣ�Ĵ洢����STUDENT_LIST��--
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

--3. (�洢����) ����һ����ʾѧ��ƽ���ɼ��Ĵ洢���̡�--
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

--4. (�洢����) ������ʾ����ѧ��ƽ���ɼ��Ĵ洢���̡�--
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
--5.(�洢����) ����һ����ѧ����������ģ�����ҵĴ��δ洢���̡�--
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
execute qname('��');
/
--6.(������) �����������롢ɾ�����޸Ķ��ִ����¼��Ĵ�����Trig_student����student��course��score����в��������Թ�ϵ��ά����
--��1������score���в���һ����¼ʱ��Ҫ�����ѧ����student���кͿγ̺���course�����Ƿ���ڣ�����������������롣
create or replace trigger Trig_student_1 before insert on score
begin
    if not exists(select * from score,student,course where score.sno=student.sno and score.cno=student.cno)
    then dbms_output.put_line('��ѧ����student���л�γ̺���course���в�����');
    rollback;
    end if;
end;
/
--��2����student�����ɾ����������ɾ��score���ж�Ӧѧ�ŵ����м�¼����student���ѧ�Ž��и��²����������score���ж�Ӧѧ�ŵ����м�¼��
create or replace trigger Trig_student_2 before delete or update on student
for each row
begin
    if deleting then delete from score where sno=:old.sno;
    elsif updating then update score set sno=:new.sno;
    end if;
end;
/
--��3����course�����ɾ����������ɾ��score���ж�Ӧ�γ̺ŵ����м�¼����course��Ŀγ̺Ž��и��²����������score���ж�Ӧ�γ̺ŵ����м�¼��
create or replace trigger Trig_student_3 after delete or update on course
for each row
begin
    if deleting then delete from score where cno=:old.cno;
    elsif updating then update score set cno=:new.cno;
    end if;
end;
/
-----------------------------------------------------------------------------------------------------------------
--��1�� (��������)  ΪScore���γ̺����򡢷���������������������ΪSC_GRADE��
create index SC_GRADE on score(cno asc,score desc);
--��2�� (ɾ������)  ɾ������SC_GRADE��
drop index SC_GRADE;
--��3�� (������ͼ)  ���������ϵ��ѧ������ͼSTUDENT_CS��
create or replace view STUDENT_CS as (select *from student where sdept='cs'); 
--��4�� (������ͼ)  ������ѧ�ź�ƽ���ɼ������ֶε���ͼSTUDENT_GR��
create or replace view STUDENT_GR as (select sno ѧ��,avg(score) ƽ���ɼ� from score group by sno);
--��5�� (��ͼ��ѯ)  ������ͼSTUDENT_CS�����������19���ѧ����ȫ����Ϣ��
select * from student_cs where sage>19;
--��6�� (��ͼ��ѯ)  ������ͼSTUDENT_GR����ƽ���ɼ�Ϊ88�����ϵ�ѧ����ѧ�ź�ƽ���ɼ���
select ѧ��,ƽ���ɼ� from student_gr where ƽ���ɼ�>88;
--��7�� (��ͼ����)  ������ͼSTUDENT_CS������ѧ��( ��96006��������Ȼ������CS������02�������С���19 )��
insert into student_cs values('96006','��Ȼ','cs','02','��',19);
--��8��(��ͼ����)  ������ͼSTUDENT_CS����ѧ����������1�ꡣ�۲������н��������ԭ��  
update student_cs set sage=sage+1;
--��9�� (��ͼ����)  ������ͼSTUDENT_GR����ƽ���ɼ�����2�֡��۲������н��������ԭ��
update student_gr set "ƽ���ɼ�"="ƽ���ɼ�"+2;
--��10�� (��ͼ����)  ɾ����ͼSTUDENT_CS��ѧ��Ϊ ��96006�� ��ѧ����ȫ�����ݡ�
delete from student_cs where sno='96006';
--��11�� (��ͼ����)  ɾ����ͼSTUDENT_GR��ȫ�����ݡ�
delete view student_gr;
--(12)  (ɾ����ͼ)  ɾ����ͼSTUDENT_CS��STUDENT_GR��
drop view student_cs;
drop view student_gr;