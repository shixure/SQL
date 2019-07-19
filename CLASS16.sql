insert into users values('zs','123');
select * from users where username='' or 1=1 or 1='' and pwd='';
select * from users where username='' or 1=1 or 1='' and pwd='';

create or replace procedure delstu_pro(sno1 in xs.sno%type)
as
begin
    delete from xs where sno=sno1;
end;
/
insert into users(username,pwd) values('ls',456);