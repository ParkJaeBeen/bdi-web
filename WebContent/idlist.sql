
/* Drop Triggers */

DROP TRIGGER TRI_IDLIST_ID_NUM;



/* Drop Tables */

DROP TABLE IDLIST CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_IDLIST_ID_NUM;




/* Create Sequences */

CREATE SEQUENCE SEQ_IDLIST_ID_NUM INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE IDLIST
(
	ID_NUM number(10,0) NOT NULL,
	ID_ID varchar2(100) NOT NULL,
	ID_PWD varchar2(200),
	PRIMARY KEY (ID_NUM)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_IDLIST_ID_NUM BEFORE INSERT ON IDLIST
FOR EACH ROW
BEGIN
	SELECT SEQ_IDLIST_ID_NUM.nextval
	INTO :new.ID_NUM
	FROM dual;
END;

/




