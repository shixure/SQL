--�����û�
create user test identified by 123;
--�޸��û�
alter user test identified by 012;
--ɾ���û�
drop user test;

--��ѯ��ɫ��Ȩ��
select * from role_sys_privs where role='DBA';
select * from role_sys_privs where role='CONNECT';
select * from role_sys_privs where role='RECOURES';

--������ɫ
create role role1;
select * from dba_roles;
--ɾ����ɫ
drop role role1;

--��������Ȩ��
--grant connect to test;
--����ỰȨ��
grant create session to test;
--������ԴȨ�ޣ�ʹ�ñ�ռ䣩
grant resource to test;
--���贴����Ȩ��
grant create table to test;

create user test2 identified by test2;