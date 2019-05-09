CREATE TABLE Book(
bookID number(10) primary key,
bookName varchar2(50),
states varchar2(20) 
);
--״̬��states����'�ڹݡ��������ʧ'���֡�
INSERT INTO BOOK VALUES(1112221111,'JAVA�������','�ڹ�');
INSERT INTO BOOK VALUES(1112221112,'VB�������','�ڹ�');
--��2�� ����ѧ������������
CREATE TABLE Student
(stuID number(10) primary key,
stuName varchar2(50)
);
INSERT INTO student VALUES(169074264,'����');
INSERT INTO student VALUES(169044109,'������');
--��3�� �������ı�
CREATE TABLE BookLend(
lendID number(10) primary key,
stuID number(10) not null,
bookID number(10) not null,
lendDate date,
returnDate date
);
--��4�� �������ж���
CREATE SEQUENCE lendID_Seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999999 
CYCLE ;
/
--��5�� �������鴥����
CREATE OR REPLACE TRIGGER LEND_TRIG
AFTER INSERT ON BookLend FOR EACH ROW
BEGIN
    update Book set states='���' where bookID=:new.bookID;
END;
--��6�� �������鴥����
/
CREATE OR REPLACE TRIGGER RETURN_TRIG
after update on BookLend for each row
begin
    update Book set states='�ڹ�' where bookID=:old.bookID;
end; 
/
--��7�� ִ�����²������۲����ݿ�ı仯
INSERT INTO BookLend values(lendID_Seq.nextval,169074264,1112221111,sysdate,null);
select * from booklend;
select * from book;
update BookLend set returnDate=sysdate where bookID=1112221111 AND STUID=169074264;
select * from booklend;
select * from book;