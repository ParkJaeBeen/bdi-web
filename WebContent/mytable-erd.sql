
/* Drop Triggers */

DROP TRIGGER TRI_mytable_mt_num;
DROP TRIGGER TRI_NEW_TABLE_mt_num;



/* Drop Tables */

DROP TABLE mytable CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_mytable_mt_num;
DROP SEQUENCE SEQ_NEW_TABLE_mt_num;




/* Create Sequences */

CREATE SEQUENCE SEQ_mytable_mt_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NEW_TABLE_mt_num INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE mytable
(
	mt_num number(10,0) NOT NULL,
	mt_title varchar2(2000),
	mt_user varchar2(50),
	mt_content varchar2(4000),
	mt_credat char(10),
	mt_cretim char(8),
	mt_moddat char(10),
	mt_modtim char(8),
	PRIMARY KEY (mt_num)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_mytable_mt_num BEFORE INSERT ON mytable
FOR EACH ROW
BEGIN
	SELECT SEQ_mytable_mt_num.nextval
	INTO :new.mt_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_NEW_TABLE_mt_num BEFORE INSERT ON NEW_TABLE
FOR EACH ROW
BEGIN
	SELECT SEQ_NEW_TABLE_mt_num.nextval
	INTO :new.mt_num
	FROM dual;
END;

/




