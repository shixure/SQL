select * 
from xs a join xs b on a.sno<>b.sno 
where (a.sname='����' and a.birthday>b.birthday) or (b.sname='����' and a.dept=b.dept); 

select * from xs
where dept=(select dept from xs where sname='����')
or birthday<(select birthday from xs where sname='����');
--�������ͬ�ջ�������������ѧ����Ϣ
select sno,sname,totalcredit,(select max(totalcredit)from xs)
from xs;
--��ÿ��ѧ����ѧ���������ѧ��
delete from xs where totalcredit is null;
select *
from (select*from xs order by totalcredit desc)
where rownum<6;
--��ѧ����ߵ�5��ѧ��
select sname from xs where sno in (select sno from cj where cno='102');
select sname from xs 
where exists(select * from cj where sno=xs.sno and cno='102');
--��ѯ����ѡ����102�ſγ̵�ѧ������
select sname from xs
where not exists
(select cno from kc where not exists
(select * from cj where sno=xs.sno and cno=kc.cno));
--���ѡ��ȫ���γ�ѧ������
select sno from cj where cno in ('101','102');
select sno from cj where cno='101'
union ALL select sno from cj where cno='102';
--��ѯ����ѡ����101��102�ſγ̵�ѧ��ѧ��,all�����ظ���
select sno from cj where cno ='101'
intersect select sno from cj where cno='102';
--��ѯ����ѡ����101��102�ſγ̵�ѧ��ѧ��
select sno from xs 
minus select sno from cj where cno='102';
select sno from xs where sno not in (select sno from cj where cno ='102');


select * from (select rownum id,t.* from(select * from xs order by totalcredit desc)t)where id >5 and id<9;