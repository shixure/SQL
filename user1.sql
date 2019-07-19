select * from sx.xs;
update sx.xs set totalcredit=totalcredit+1;
insert into sx.xs values('000000','**','****','ÄÐ','1900-01-01','00',null);
delete from sx.xs where sno='000000';
grant delete on sx.xs to user2;

select * from sx.cj;