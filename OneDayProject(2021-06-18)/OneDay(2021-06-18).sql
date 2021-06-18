USE MYSQL;
CREATE DATABASE myScore;
USE myScore;

CREATE TABLE tbl_student (
	st_num	CHAR(8)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	INT	NOT NULL,	
	st_tel	VARCHAR(15)	NOT NULL,	
	st_addr	VARCHAR(125)		
);
DROP TABLE tbl_score;
CREATE TABLE tbl_score (
	sc_seq	BIGINT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,	
	sc_subject	VARCHAR(20)	NOT NULL,	
	sc_score	INT	NOT NULL	
);

INSERT INTO tbl_student (st_num, st_name, st_dept, st_grade, st_tel, st_addr)
VALUES (20210001,'홍길동','컴퓨터공학', 2, '010-111-1111', '광주광역시');

SELECT * FROM tbl_student;
