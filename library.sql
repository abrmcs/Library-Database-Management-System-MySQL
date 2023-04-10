DROP TABLE CATEGORY
DROP TABLE MEMBER
DROP TABLE LOAN
DROP TABLE ROOM
DROP TABLE BOOK
DROP TABLE LIBRARIAN
DROP TABLE AUTHOR

CREATE TABLE CATEGORY(
category_code varchar(3) Not Null,
category_type char(3) Not Null,
primary key (category_code));

CREATE TABLE MEMBER(
member_id varchar(9) Not Null,
member_name char(20) Not Null,
member_email char(25) Not Null,
category_code varchar(3) Not Null,
primary key (member_id),
foreign key (category_code) references CATEGORY(category_code));

CREATE TABLE LOAN(
loan_id varchar(9) Not Null,
member_id varchar(9) Not Null,
loan_date date Not Null,
book_id varchar(7) Not Null,
librarian_id varchar(6) Not Null,
primary key (loan_id),
foreign key (librarian_id) references librarian(librarian_id),
foreign key (member_id) references member(member_id),
foreign key (book_id) references book(book_id));



CREATE TABLE BOOK(
book_id varchar(7) Not Null,
book_name char(20) Not Null,
author_name char(20) Not Null,
primary key (book_id),
foreign key (author_name) references author(author_name));

CREATE TABLE ROOM(
room_no varchar(3) Not Null,
librarian_id varchar(6) Not Null,
member_id varchar(9) Not Null,
primary key (room_no),
foreign key (member_id) references member(member_id),
foreign key (librarian_id) references librarian(librarian_id));

CREATE TABLE LIBRARIAN(
librarian_id varchar(6) Not Null,
librarian_name char(20) Not Null,
librarian_email char(30) Not Null,
primary key (librarian_id));


Select * from AUTHOR

INSERT into CATEGORY VALUES(327, "PLT");
INSERT into CATEGORY VALUES(201, "DMD");
INSERT into CATEGORY VALUES(122, "GLD");
INSERT into CATEGORY VALUES(211, "DMD");
INSERT into CATEGORY VALUES(322, "PLT");

SELECT * FROM CATEGORY

INSERT into MEMBER VALUES(123456789, 'Abraar', 'abraar@gmail.com', 327);
INSERT into MEMBER VALUES(023456789, 'Durgesh', 'durgesh@gmail.com', 201);
INSERT into MEMBER VALUES(223456789, 'John', 'john@gmail.com', 122);
INSERT into MEMBER VALUES(323456789, 'Simon', 'simon@gmail.com', 211);
INSERT into MEMBER VALUES(423456789, 'Dave', 'dave@gmail.com', 322);

SELECT * FROM MEMBER

insert into book values(1000001, 'The Big Bang', 'Jake Dowell');
insert into book values(1000002, 'Harry Potter', 'JK Rowling');
insert into book values(1000003, 'Harry Boys', 'James Bond');
insert into book values(1000004, 'Shakespeare', 'Tom Grundy');
insert into book values(1000005, 'Chaos', 'Abraar Mohiuddin');


SELECT * FROM BOOK

insert into librarian values(600001, 'Harry Styles', 'harry@yahoo.com');
insert into librarian values(600002, 'Kyle Knight', 'kyle@yahoo.com');
insert into librarian values(600003, 'Trevor Noah', 'trevor@yahoo.com');
insert into librarian values(600004, 'Mehdi Hasan', 'mehdi@yahoo.com');
insert into librarian values(600005, 'Lionel Messi', 'messi@yahoo.com');

SELECT * FROM LIBRARIAN

insert into loan values(987654321, 123456789, '2022-08-20', 1000001, 600001);
insert into loan values(887654321, 023456789, '2022-08-21', 1000002, 600002);
insert into loan values(787654321, 223456789, '2022-08-23', 1000003, 600003);
insert into loan values(687654321, 323456789, '2022-08-24', 1000004, 600004);
insert into loan values(587654321, 423456789, '2022-08-25', 1000005, 600005);

SELECT * FROM LOAN

insert into author values('Jake Dowell', 'Science');
insert into author values('JK Rowling', 'Fantasy');
insert into author values('James Bond', 'Mystery');
insert into author values('Tom Grundy', 'Classic');
insert into author values('Abraar Mohiuddin', 'Horror');

SELECT * FROM AUTHOR

insert into room values(101, 600001,123456789);
insert into room values(102, 600002,023456789);
insert into room values(103, 600003,223456789);
insert into room values(104, 600004,323456789);
insert into room values(105, 600005,423456789);

SELECT * FROM ROOM

ALTER TABLE CATEGORY ADD COLUMN AMOUNT_DUE INT NULL DEFAULT 0;

UPDATE CATEGORY SET AMOUNT_DUE = 100 where category_code > 200;
UPDATE CATEGORY SET AMOUNT_DUE = 200 where category_code > 300;

SELECT * FROM CATEGORY

SELECT room.room_no, room.member_id
FROM room
INNER JOIN member
ON room.member_id = member.member_id
ORDER BY room.room_no;

CREATE VIEW AUTHOROFBOOK
AS
SELECT book.book_name, book.author_name
FROM BOOK
JOIN AUTHOR
ON book.author_name = author.author_name;
SELECT * FROM AUTHOROFBOOK

SELECT loan_id, loan_date,
DATEDIFF(SYSDATE(), loan_date) AS "Days since loan granted"
FROM loan; 