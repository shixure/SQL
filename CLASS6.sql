select a.sno,sname,c.cno,grade
from xs a join cj b on a.sno=b.sno join kc c on b.cno=c.cno
where cname ='���������' and grade=80;
--����ѡ���ˡ�������������γ��ҳɼ���80�����ϵ�ѧ��ѧ�š��������γ������ɼ�
select sname,dept,birthday
from xs where birthday<'1990-01-03';
select * 
from xs a join xs b on a.sn<>b.sno 
where a.sname='����' and a.birthday>b.birthday;
--������������������ѧ����������רҵ���ͳ�������
select *
from xs a left join cj b on a.sno=b.sno
where b.sno is null;
--��û��ѡ�޿γ̵�ѧ��
select *
from xs natural join cj natural join kc
where cname='���������';
--��Ȼ����
select sno 
from cj
where cno=
(select cno from kc where cname ='��ɢ��ѧ');
--����ѡ����ɢ��ѧ��ѧ����ѧ��
select sname from xs where sno in
(select sno from cj where cno=
(select cno from kc where cname ='��ɢ��ѧ'));
--����ѧ��ѡ����ɢ��ѧ�ĵ�����

select *
from xs
where dept<>'�����' and birthday<all(select birthday from xs where dept='�����');
select *
from xs
where dept<>'�����' and birthday<(select min(birthday) from xs where dept='�����');
--���ұ����м����ϵ���䶼���ѧ��
update xs set birthday='1985-01-01'where sname='����';
rollback;
--����
update xs set dept='ͨ�Ź���'where sname='����';

select sno from cj
where cno=206 and grade>=any(select grade from cj where cno=101); 
select sno from cj
where cno=206 and grade>=(select min(grade) from cj where cno=101); 
--���ҿγ̺�206�ĳɼ������ڿγ̺�101����ͳɼ���ѧ��ѧ��