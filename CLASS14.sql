create user user1 IDENTIFIED by 123;
grant create session to user1;
grant resource to user1;
grant select on xs to user1;

--���û�������xs��insert��updateȨ��
grant insert,update on xs to user1;
--�������û�����xs���ϵ�update
grant update on xs to public;
--��user1�û������xs��deleteȨ������ʹ
grant delete on xs to user1 with grant option;
create user user2 identified by 123;