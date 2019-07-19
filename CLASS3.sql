create table stu
(sno char(6)primary key,
sname varchar2(20) unique,
--Ψһ��Լ��
sex char(3) default('��'),
--Ĭ��Ϊ��
dept varchar2(20)not null,
--�ǿ�
constraint stu_sex_cons check(sex in ('��','Ů'))
--Լ��
);

drop table stu;
--ɾ����

select * from stu;
insert into stu values('001','aaaa','Ů','�����');
insert into stu values('002','bbbb','Ů','�����');
insert into stu(sno,sname,dept) values('003','cccc','�����');
insert into stu values('004','dddd','��','�����');

alter table stu modify sname varchar2(10);
--��sname�г�����20��Ϊ10
insert into stu values('005','ŷ������','Ů','�����');
--����sname����
alter table stu add nativeplace varchar2(50);
--�ڱ�stu�м���һ������nativeplace
alter table stu drop column nativeplace;
--�ڱ�stu��ɾ��nativeplace��
alter table stu drop constraint SYS_C007068;
--ɾ�����е�Ψһ��Լ��
alter table stu add constraint stu_sname_uniq unique(sname);
--���stu��sname�ֶε�Ψһ��Լ��

insert into stu(sno,sname,sex,dept)
--����һ��
select sno,sname,sex,dept
from xs
where dept='�����';
--��ѧ�����м����ϵ�е�ѧ�����뵽��stu��
create table stu1 as
select * from xs;
--������stu1������xs��ȫ������

update xs set totalcredit=totalcredit+10;
--��xs������ѧ����ѧ�ּ�10
update xs set dept ='�����',remarks='����ѧ��' where sname='������';
--�޸Ķ�����
delete from stu where dept='�����';
--ɾ�������ϵ����ѧ����Ϣ

create tablespace test
datafile 'D:\oraclexe\app\oracle\oradata\XE\test01.dbf'
size 50M;