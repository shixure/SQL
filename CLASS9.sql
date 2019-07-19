set serveroutput on;
DECLARE 
    n number;
    result number;
BEGIN
    n:=0;result:=0;
    while n<=100 loop
        result:=result+n;
        n:=n+1;
    end loop;
    dbms_output.put_line('结果是'||result);
END;
--求1到100
/
set serveroutput on;
DECLARE
stuno xs.sno%type;
stuname xs.sname%type;
BEGIN
select sno,sname into stuno,stuname from  xs where sno='001101';
DBMS_OUTPUT.put_line(stuno||stuname);
END;
--查询学号为“001101”的学生的信息。
/
set serveroutput on;
DECLARE
	Stu xs%rowtype;
BEGIN
	select * into stu from  xs where sno='001101';
	DBMS_OUTPUT.put_line(stu.sno||stu.sname);
END;
--查询所有学生的学号与姓名。（利用游标变量循环）
/
DECLARE
	stu xs%rowtype;
	cursor cur_stu is select * from xs;
BEGIN
	open cur_stu;
	loop
   	fetch cur_stu into stu;
   	exit when cur_stu%notfound;
   	DBMS_OUTPUT.put_line(stu.sno||stu.sname);
	end loop;
	close cur_stu;
END;
--查询所有学生的学号与姓名。（利用游标变量循环）
/
DECLARE
	cursor cur_stu is select * from xs;
BEGIN
	for stucur in cur_stu loop
    	DBMS_OUTPUT.put_line(stucur.sno||stucur.sname);
	end loop;
END;
--查询所有学生的学号与姓名。（利用for循环）
/
DECLARE
	cursor cur_stu is select * from xs;
BEGIN
	for stucur in (select * from xs)loop
    DBMS_OUTPUT.put_line(stucur.sno||stucur.sname);
	end loop;
END;
--查询所有学生的学号与姓名。（利用for循环）
/
DECLARE
	stuno xs.sno%type;
	stuname xs.sname%type;
BEGIN
	select sno,sname into stuno,stuname from  xs ;
	DBMS_OUTPUT.put_line(stuno||stuname);
EXCEPTION
    WHEN no_data_found then
      dbms_output.put_line('数据没找到');
    WHEN too_many_rows then
      dbms_output.put_line('结果集超过一行');
END;
/

