select * 
from xs,cj
where xs.sno=cj.sno;

select sname,cname,grade 
from xs,cj,kc
where xs.sno=cj.sno and kc.cno=cj.cno and xs.sno='001101';
--等值连接

select * 
from xs natural join cj;
--自然连接

insert into xs(sno,sname) values('001244','张三'); 
select * 
from xs full join cj on xs.sno=cj.sno;
select * 
from xs left join cj on xs.sno=cj.sno;
select * 
from xs right join cj on xs.sno=cj.sno;