 create table student(
sno char(5)primary key,
sname varchar2(12) not null,
sdept char(2) not null,
sclass char(2) not null,
ssex char(3),
sage number(2)
);
insert into student values('96001','��С��','cs','01','Ů','21');
insert into student values('96002','����','cs','01','��','18');
insert into student values('96003','������','ma','01','��','18');
insert into student values('96004','��־��','is','02','��','20');
insert into student values('97001','����','ma','02','Ů','19');
insert into student values('97002','��ɹ�','cs','01','��','20');
insert into student values('97003','����','is','03','Ů','19');
insert into student values('97004','����','cs','02','Ů','19');
insert into student values('97005','˾��־��','cs','02','��','18');

create table course
(cno char(3)primary key,
cname varchar(20),
ctime number(3)
);
insert into course values('001','��ѧ����','144');
insert into course values('002','��ͨ����','144');
insert into course values('003','΢��ԭ��','80');
insert into course values('004','���ݽṹ','72');
insert into course values('005','����ϵͳ','80');
insert into course values('006','���ݿ�ԭ��','80');
insert into course values('007','����ԭ��','60');
insert into course values('008','�������','40');

create table teach
(tname varchar(12),
tsex char(3),
cno char(3),
tdate date,
tdept char(2),
primary key(tname,cno,tdept),
constraint fk_cno foreign key(cno) references course(cno)
);
insert into teach values('���ɸ�','��','004','1999-9-5','cs');
insert into teach values('������','��','003','1999-9-5','cs');
insert into teach values('����','Ů','001','1999-6-8','ma');
insert into teach values('�Ը�','��','004','1999-3-12','is');
insert into teach values('������','��','003','2000-2-23','ma');
insert into teach values('������','Ů','006','2000-2-23','cs');
insert into teach values('���ɸ�','��','004','2000-3-30','is');
insert into teach values('����','Ů','008','1999-9-5','cs');

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
insert into dept values('cs','�����ϵ');
insert into dept values('is','��Ϣϵ');
insert into dept values('ma','��ѧϵ');
select * from dept;

alter table dept
add constraint pk_dept primary key(dno);
alter table student
add constraint fk_sdept foreign key(sdept)
references dept(dno);

alter table student add birthday date;
--�ڱ�student������birthday�ֶ�
alter table student drop column birthday;
--ɾ��birthday�ֶ�
alter table student modify sname varchar2(20) not null;
--��Student���а�Sname �ֶ��޸�ΪSname(VCHAR2,20)��Ϊ�ǿ�
alter table student add constraint stu_sname_uniq unique(sname);
--�ڱ�student�е�sname���Ψһ��Լ��

create table S1 as select * from student where 1=2;
--����student�ı�ṹ���±�S1
select * from S1;
insert into S1 select * from student where sdept='cs'; 
--����student�еļ����ϵѧ�����ݲ嵽S1��
create table stu as select * from student;
--����student���е����ݵ�stu��
update S1 set sage=sage+2;
--��S1��������ѧ�������2
update course set ctime=100 where cname='�������';
--��course���пγ���ƿ�ʱ��Ϊ100
insert into score values('98001','001','95');
--��Score���в������ݣ���98001��, ��001��, 95��
insert into score values('97001','010',80);
--��Score���в������ݣ���97001��, ��010��, 80��
delete from score where sno='96001';
--ɾ��Score����ѧ��Ϊ��96001���ĳɼ���Ϣ
delete from score where cno='003';
--ɾ��Score���пγ̺�Ϊ��003�� �ĳɼ���Ϣ
delete from stu where sdept='cs';
--ɾ��ѧ����stu�м����ϵ(��CS��)��ѧ����Ϣ
delete from S1;
--ɾ�����ݿ��S1������ѧ��������
drop table s1;
drop table stu;
--ɾ�����ݿ��S1��stu


--------------------------��ҵ--------------------------
select sno,sname,ssex,sage from student; 
--��1�� (ѡ����е�������)  ��ȫ��ѧ����ѧ�š��������Ա�����䡣
select count(DISTINCT sno) from score;
--��2�� (��ѡ���ظ���)  ��ѡ���˿γ̵�ѧ��ѧ�š�
select * from student;
--��3�� (ѡ����е�������)  ��ȫ��ѧ������ϸ��Ϣ��
select sno,sname,2019-sage from student;
--��4�� (ʹ�ñ��ʽ)  ��ȫ��ѧ����ѧ�š������ͳ�����ݡ�
select sno ѧ��,2019-sage ������� from student;
--��5�� (ʹ���еı���)  ��ѧ����ѧ�źͳ�����ݣ���ʾʱʹ�ñ�����ѧ�š��͡�������ݡ���
select sname,sage from student where sage>19;
--��6��(�Ƚϴ�С����)  ���������19���ѧ�������������䡣
select sname,sdept,sage from student where sage>19 and(sdept='cs'or sdept='is');
--��7�� (�Ƚϴ�С����)  ������ϵ����Ϣϵ�������18���ѧ����������ϵ�����䡣
select sno,sage from student where sage>19 and sage<=22;
--��8�� (ȷ����Χ����)  ��������19����22��(��20���22��)֮���ѧ����ѧ�ź����䡣
select sno,sage from student where sage<=19 or sage>22;
--��9�� (ȷ����Χ����)  �����䲻��19����22��֮���ѧ����ѧ�ź����䡣
select * from student where sdept='cs'or sdept='is';
--��10��(ȷ����������)  �������и�ϵ��ѧ����Ϣ����ѧϵ�������ϵ��
select * from student where sdept<>'cs'and sdept<>'is';
--��11��(ȷ����������)  ������ѧϵ�������ϵ��ѧ����Ϣ��
select * from student where sname like '��%';
--��12��(ƥ���ѯ)  ���������ԡ����ͷ��ѧ����
select * from student where sname like '%־%';
--��13��(ƥ���ѯ)  �������к��С�־����ѧ����
select * from student where sname like '%��__';
--��14��(ƥ���ѯ)  �������������������������ҵ������������ֱ����ǡ�����ѧ����
select sno,cno,score from score where cno in('001','003')and score<90 and score>80 and sno like'96___';
--��15��(ƥ���ѯ)  ��ѡ�޿γ�001��003���ɼ���80��90֮�䣬ѧ��Ϊ96xxx��ѧ����ѧ�š��γ̺źͳɼ���
select sno,cno from score where score is null;
--��16��(�漰��ֵ��ѯ)  ��ȱ��ѧϰ�ɼ���ѧ����ѧ�źͿγ̺š�
select sno,cno,score from score where cno=001 order by score desc;
--��17��(�����е���ʾ˳��)  ��ѡ��001�γ̵�ѧ����ѧ�š��γ̺źͷ����������������������
select count(*) from student;
--��18��(�麯��)  ��ѧ����������
select count(distinct sno) from score;
--��19��(�麯��)  ��ѡ���˿γ̵�ѧ��������
select avg(sage) from student where sdept='cs';
--��20��(�麯��)  ������ϵѧ����ƽ�����䡣
select max(score),min(score),avg(score) from score where cno='001';
--��21��(�麯��)  ��ѡ���˿γ�001����ߡ������ƽ���ɼ���
select avg(score),sum(score) from score group by cno;
--��22��(�����ѯ)  ����ſγ̵�ƽ���ɼ����ܳɼ���
select avg(score),sum(score) from score group by cno order by sum(score);
--��23��(�����ѯ)  ����ſγ̵�ƽ���ɼ����ܳɼ�,������ܳɼ�����
select sdept,sclass,count(sno),avg(sage) from student group by sdept,sclass;
--��24��(�����ѯ)  ���ϵ�����༶��������ƽ�����䡣
SELECT SNAME,COUNT(*) FROM STUDENT WHERE SDEPT='CS' GROUP BY SDEPT;
--��25��ԭ��selsct�б���group by��һ��
SELECT SAGE FROM STUDENT GROUP BY SNO,sage;
--��26��group by �����sage
select sdept,count(*) from student group by sdept having count(*)<3;
--��27��(�����ѯ)  ��ѧ����������3�˵�ϵ������Ӧ��ѧ������
select sdept,sclass,count(*) from student group by sdept,sclass having sclass!=01;
--��28��(�����ѯ)  ���ϵ�г�01��֮��ĸ����ѧ��������
-------------------------------��ҵ2-------------------------------------------
select sname,cname,score 
from student 
join score on student.sno=score.sno 
join course on score.cno=course.cno
where course.cno='001' and (score<70 or score>90);
--��1��(���Ӳ�ѯ)  ��ѡ���˿γ�001�ҳɼ���70�����»�ɼ���90�����ϵ�ѧ�����������γ����ƺͳɼ���
select sname,cname,score 
from student a 
join score b on a.sno=b.sno 
join course c on b.cno=c.cno
where c.cno='001' and (score<70 or score>90);
--��2��(���Ӳ�ѯ���ı���)  ��ѡ���˿γ�001�ҳɼ���70�����»�ɼ���90�����ϵ�ѧ�����������γ����ƺͳɼ���
select sno,sname,cno,score 
from student natural join score;
--��3��(��Ȼ���Ӳ�ѯ)  ��ѧ��ѧ�š������Լ���ѡ�޿γ̵Ŀγ̺źͳɼ���
select b.sname,b.sdept,b.sage
from student a join student b on a.sno<>b.sno
where a.sname='����' and a.sage<b.sage;
--��4��(�������Ӳ�ѯ)  ���������'����' ������ѧ����������ϵ�����䡣
select *
from student a left join score b on a.sno=b.sno
where b.cno is null;
--��5��(�ⲿ���Ӳ�ѯ)  ��δѡ���κογ̵�ѧ����������
select sname,sdept from student 
where sname<>'����'
and sage=(select sage from student where sname='����');
--��6��(�Ӳ�ѯ)  ���롮������ ������ͬ��ѧ����������ϵ��
select sno,sname from student 
where sno=(select sno from score 
where cno=(select cno from course where cname='���ݽṹ'));
--��7��(�Ӳ�ѯ)  ��ѡ���˿γ���Ϊ�����ݽṹ�� ��ѧ����ѧ�ź�������
select sname,sdept from student
where sdept<>'ma' and sage>any(select sage from student where sdept='ma');
--��8��(�Ӳ�ѯANY)  �����ѧϵ��ĳһѧ��������ѧ����������ϵ�� 
select sname,sdept from student
where sdept<>'ma' and sage>all(select sage from student where sdept='ma');
--��9��(�Ӳ�ѯALL����MAX())  �����ѧϵ��ȫ��ѧ��������ѧ����������ϵ��
select sname,sdept from student 
where exists(select * from score where sno=student.sno and cno='004');
--��10��(����Ӳ�ѯEXISTS)  ��ѡ����004�γ̵�ѧ����������ϵ��
select sname,sdept from student 
where not exists(select * from score where sno=student.sno and cno='004');
--��11�� (����Ӳ�ѯ NOT EXIST)  ��δѡ����004�γ̵�ѧ����������ϵ��
select sname,sdept from student 
where sname<>'����'
and sage=(select sage from student where sname='����')
and sdept=(select sdept from student where sname='����');
--��12��(�Ӳ�ѯ)  ���� '����' ͬϵ��ͬ���ѧ����������ϵ��