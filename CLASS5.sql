select count (*) as ������ from xs;
--��ѧ����������
select count(distinct sno) from cj;
--��ѡ���˿γ̵�ѧ������
select avg(totalcredit) from xs where dept='�����'; 
--������ѧ����ƽ��ѧ��
select max(grade),min(grade),avg(grade) from cj where cno='101';
--��ѡ���˿γ�101�ĳɼ����ֵ��������

select cno,avg(grade),sum(grade) from cj group by cno;
--����ſγ̵�ƽ���ɼ����ܳɼ�
select dept,count(*)from xs group by dept;
--���רҵ������
select dept,count(*)from xs
group by dept
having count(*)>10;
--��������10�����ϵ�רҵ������
select dept,sex,count(*) ����
from xs 
group by dept,sex;
--
select dept,count(*)
from xs where sname like'��%'
group by dept;
--���רҵ����������

select * from xs order by totalcredit desc;
--���ɼ���������
select * from cj where cno in('101','102') order by sno asc,cno desc;
--select * from cj where cno='101'or cno='102' order by cno desc;
--��ѡ�޿γ�('101')��γ�('102')ѧ����ѧ����ѧ���������У��γ̽�������

select xs.*,cj.* from xs,cj where xs.sno=cj.sno;
--92
select xs.*,cj.* from xs join cj on xs.sno=cj.sno;
--99

select sno,sname,cname,grade from xs,cj,kc 
where xs.sno=cj.sno and cj.cno=kc.cno and kc.cname='���������' and cj.grade>80;