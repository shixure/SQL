--创建用户
create user test identified by 123;
--修改用户
alter user test identified by 012;
--删除用户
drop user test;

--查询角色名权限
select * from role_sys_privs where role='DBA';
select * from role_sys_privs where role='CONNECT';
select * from role_sys_privs where role='RECOURES';

--创建角色
create role role1;
select * from dba_roles;
--删除角色
drop role role1;

--赋予连接权限
--grant connect to test;
--赋予会话权限
grant create session to test;
--赋予资源权限（使用表空间）
grant resource to test;
--赋予创建表权限
grant create table to test;

create user test2 identified by test2;