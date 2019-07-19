create or replace procedure pro_delcj(stuno in 
xs.sno%type,stucno in kc.cno%type)
is
begin
    delete from cj where sno=stuno and cno=stucno;
end;
/
set serveroutput on;
select *from cj;
execute pro_delcj('001241','101');
begin
    pro_delcj('001221','101');
end;
/


create table cj_log(
   operate_type varchar2(20),
   operate_date date,
   operate_user varchar2(20)
); 
create or replace trigger tri_cj before insert or update or delete  on cj
declare
   ope_type varchar2(20);
begin
  if    inserting then    ope_type:='Ìí¼Ó';
  elsif updating  then    ope_type:='¸üÐÂ';
  elsif deleting  then    ope_type:='É¾³ý';
  end if;
    insert into cj_log values(ope_type,sysdate,ora_login_user);
end;
/
update cj set grade='00' where sno='001101'and cno='101';
select*from cj_log;
rollback;
delete from cj where sno='001101'and cno='101';
insert into cj values('001101','101','80');

/
create or replace trigger tri_del_cj after delete on xs 
for each row 
begin
delete from cj where sno =:old.sno;
end;
/
delete from xs where sno='001241';
