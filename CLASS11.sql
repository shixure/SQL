CREATE OR REPLACE PROCEDURE qname(name xs.sname%type)
is
cursor name_cur is SELECT * FROM XS WHERE sname like '%'||name||'%';
begin
    for rec in name_cur loop
    dbms_output.put_line(rec.sno||rec.sname);
    end loop;
end;
/
set serveroutput on;
execute qname('Íõ');