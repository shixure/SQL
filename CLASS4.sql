select sno,sname from xs;
--��ȫ��ѧ����ѧ�ź�����
select * from xs;
--��ȫ��ѧ������Ϣ
select sno,extract(year from sysdate)-extract(year from birthday) from xs;
--��ѧ����ѧ�ŵ�����
select sno as ѧ��, extract(year from sysdate)-extract(year from birthday)as ���� from xs;
--��ʾʱ��ʾ������ѧ�š��͡�������

select 3+2 from xs;
select 3+2 from dual;
select 3+2 as "3+2" from dual;

select distinct sno from cj;
--��ѡ���˿γ̵�ѧ��ѧ��

select * from v$nls_parameters;

select sname,totalcredit from xs where totalcredit>=50;
--��ѧ�ִ��ڵ���50��ѧ��������ѧ��
select sno,totalcredit from xs where totalcredit between 40 and 49;
--��ѧ��40-49֮�䣨����40��49����ѧ��ѧ�ź�ѧ��
select sno,totalcredit from xs where totalcredit not between 40 and 49;

select * from xs 
where dept in('ͨ�Ź���','�����','���繤��'); 
--�������и�ϵ��ѧ��
select * from xs 
where dept not in('ͨ�Ź���','�����','���繤��');

alter table xs
modify sname varchar2(20);
insert into xs(sno,sname) values('001242','˾������');
select * from xs where sname like '��%';
--�����������ͷ��ѧ����Ϣ
select * from xs where sname like '%��%';
--�������к������ѧ����Ϣ
select * from xs where sname like '%��__';

insert into kc(cno,cname) values('401','DBASE');
insert into kc(cno,cname) values('402','DB_DESINGN');
select * from kc where cname like 'DB%';
select * from kc where cname like 'DB_%';
select * from kc where cname like 'DB\_%' escape '\';
--����ת���ַ�
select * from kc where term is not null ;
select * from kc ;
update kc set credit=credit+5;
update kc set credit=nvl(credit,0)-5;

select sname,dept,totalcredit from xs where dept in('�����','ͨ�Ź���') and totalcredit > 50;
--
select sno,cno,grade from cj where grade between 85 and 95;