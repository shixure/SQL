create index xs_sname_idx on xs(sname);
--��XS��������д�������
select * from xs where sname like '��%';
create unique index xs_sname_uniq_idx on xs(sname);
--��XS��������д���Ψһ������
drop index xs_sname_idx;
create index cj_idx on cj(sno,cno);
--ΪCJ����ѧ���кͿγ̺��еĸ�������
create view v_xs
as
select * from xs where dept='�����';
select * from v_xs;
--���������ϵ��ѧ����ͼxs_dept_view 
create or replace view v_xs
as
select * from xs where dept='�����'
with check option;
--���������ϵ��ѧ����ͼxs_dept_view 
select * from v_xs;
update v_xs set dept='��Ϣ����'where sno='001101';
--
create or replace view cj_avg_view(sno,avg_grade) 
as
select sno,avg(grade) from cj group by sno;
--��ѧ����ѧ�ż�����ƽ���ɼ�����Ϊ��ͼcj_avg_view ������
select * from cj_avg_view where avg_grade>90;

create or replace synonym cj_v for cj_avg_view;
select * from cj_v;
--

create sequence xs_seq
maxvalue 999999
start with 999000
increment by 1;

insert into xs(sno,sname) values(xs_seq.nextval,'aaa');
select xs_seq.currval from dual;
select xs_seq.nextval from dual;
