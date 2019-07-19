insert into guset(gname,gphone) values('王涛','17855512033');

insert into book(gid,rid,btime) values('1000001','101',to_date(sysdate,'yyyy-mm-dd'));
insert into book(gid,rid,btime) values((select gid from guset where gname='孙小勤'),'102',to_date(sysdate,'yyyy-mm-dd'));

--查询入住情况（简）
select a.RID,GNAME from ROOM a
join BOOK B on B.RID = a.RID
join GUSET c on c.GID = B.GID
where sid=1;

select a.rid,gname,gphone,bednum,price,pname from room a 
join book b on b.rid = a.rid 
join guset c on c.gid = b.gid 
join rtype d on d.tid=a.tid 
join principal e on e.pid=a.pid;

select * from room where rid=101 and sid=0;
--查询入住情况
select a.rid,gname,gphone,bednum,price,pname from room a 
join book b on b.rid = a.rid 
join guset c on c.gid = b.gid 
join rtype d on d.tid=a.tid 
join principal e on e.pid=a.pid 
where sid=1;

select rid,tname,price,pname,sname from room a 
join rtype b on b.tid = a.tid 
join principal c on c.pid=a.pid 
join rstatus d on d.sid=a.sid order by rid;
update book set utime=to_date(sysdate,'yyyy-mm-dd hh24:mi:ss') where rid=104 and gid=(select gid from guset where gname='孙小勤') and utime is null;
select* from guset;
select* from room;
select * from book;
delete from book;
set serveroutput on;
execute pro_checkout('孙小勤',103);
execute pro_reserve('孙小勤',104);
execute pro_reserve('崔大军',101);
execute pro_change('孙小勤',102,103);
------------------------------------------------------------------------------------------------------------------------

create sequence seq_gid 
minvalue 100001
maxvalue 999999 
start with 100001
increment by 1 
nocache;

create sequence seq_bid 
minvalue 10000001
maxvalue 99999999
start with 10000001
increment by 1 
nocache;
/

--------------------------------------------------------------------------------------------------------------------------
create or replace trigger Trig_0 before insert on guset
for each row
begin
   select seq_gid.nextval into :new.gid from dual;
end;
/
create or replace trigger Trig_1 after insert on book
for each row
begin
    update room set sid='1' where rid=:new.rid;
end;
/
create or replace trigger Trig_1_1 before insert on book
for each row
begin
    select seq_bid.nextval into :new.bid from dual;
end;
/
create or replace trigger Trig_2 before update on book
for each row
begin
   update room set sid='0' where rid=:new.rid;
end;
/
create or replace procedure pro_reserve(gna in guset.gname%type,rno in room.rid%type)
is
begin
    insert into book(gid,rid,btime) values((select gid from guset where gname=gna),rno,sysdate);
end;
/
create or replace procedure pro_checkout(gna in guset.gname%type,rno in room.rid%type)
is
begin
    update book set utime=sysdate where rid=rno and gid=(select gid from guset where gname=gna);
end;
/
create or replace procedure pro_change(gna in guset.gname%type,rno_1 in room.rid%type,rno_2 in room.rid%type)
is
begin
    pro_checkout(gna,rno_1);
    pro_reserve(gna,rno_2);
end;