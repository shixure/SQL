create user user1 IDENTIFIED by 123;
grant create session to user1;
grant resource to user1;
grant select on xs to user1;

--给用户授予在xs表insert和update权限
grant insert,update on xs to user1;
--给所有用户授予xs表上的update
grant update on xs to public;
--给user1用户授予表xs的delete权力，并使
grant delete on xs to user1 with grant option;
create user user2 identified by 123;