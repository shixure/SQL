SELECT * FROM XS;
--��ѯ����
SELECT * FROM XS WHERE DEPT ='�����' AND SNAME='����';
--��ѯͬʱ������������
SELECT SNAME,DEPT FROM XS;
--ͶӰ����
SELECT DISTINCT DEPT FROM XS;
--ɸѡ

select * from xs,kc;
--����ѿ������������壩
select sno,sname,cno,cname from xs,kc where sno='001101';
select sno,sname,cno,cname from xs,kc where xs.sno=cj.sno and sno='001101';

select * from xs where sno='001101';
select sno,sname,cno,cname from xs,kc where xs.sno=cj.sno;

create table student
as
select * from xs where dept='�����';