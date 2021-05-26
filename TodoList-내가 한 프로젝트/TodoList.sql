-- 여기는 todolist 작성

CREATE TABLE tbl_todolist(
    td_seq	NUMBER		PRIMARY KEY,
    td_date	VARCHAR(10)	NOT NULL,	
    td_time	VARCHAR(10)	NOT NULL,	
    td_todo	VARCHAR(2000)	NOT NULL,	
    td_place	NVARCHAR2(125)		
);

CREATE SEQUENCE seq_todolist
START WITH 1 INCREMENT BY 1;

COMMIT;
