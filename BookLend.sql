CREATE TABLE Book(
bookID number(10) primary key,
bookName varchar2(50),
states varchar2(20) 
);
--状态（states）有'在馆、借出、丢失'三种。
INSERT INTO BOOK VALUES(1112221111,'JAVA程序设计','在馆');
INSERT INTO BOOK VALUES(1112221112,'VB程序设计','在馆');
--第2步 创建学生表并插入数据
CREATE TABLE Student
(stuID number(10) primary key,
stuName varchar2(50)
);
INSERT INTO student VALUES(169074264,'韩刘');
INSERT INTO student VALUES(169044109,'李盟盟');
--第3步 创建借阅表
CREATE TABLE BookLend(
lendID number(10) primary key,
stuID number(10) not null,
bookID number(10) not null,
lendDate date,
returnDate date
);
--第4步 创建序列对象
CREATE SEQUENCE lendID_Seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999999 
CYCLE ;
/
--第5步 创建借书触发器
CREATE OR REPLACE TRIGGER LEND_TRIG
AFTER INSERT ON BookLend FOR EACH ROW
BEGIN
    update Book set states='借出' where bookID=:new.bookID;
END;
--第6步 创建还书触发器
/
CREATE OR REPLACE TRIGGER RETURN_TRIG
after update on BookLend for each row
begin
    update Book set states='在馆' where bookID=:old.bookID;
end; 
/
--第7步 执行以下操作，观察数据库的变化
INSERT INTO BookLend values(lendID_Seq.nextval,169074264,1112221111,sysdate,null);
select * from booklend;
select * from book;
update BookLend set returnDate=sysdate where bookID=1112221111 AND STUID=169074264;
select * from booklend;
select * from book;