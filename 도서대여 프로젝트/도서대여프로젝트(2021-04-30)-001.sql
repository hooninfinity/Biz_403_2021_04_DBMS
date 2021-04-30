-- 여기는 bookuser접속
DROP TABLE tbl_books;
DROP TABLE tbl_company;
DROP TABLE tbl_author;

CREATE TABLE tbl_books(
    bk_isbn	CHAR(13)		PRIMARY KEY,
    bk_title	NVARCHAR2(125)	NOT NULL,	
    bk_ccode	CHAR(5)	NOT NULL,	
    bk_acode	CHAR(5)	NOT NULL,	
    bk_date	VARCHAR2(10),		
    bk_price	NUMBER,		
    bk_pages	NUMBER		
);

CREATE TABLE tbl_company(
    cp_code	CHAR(5)		PRIMARY KEY,
    cp_title	NVARCHAR2(125)	NOT NULL,	
    cp_ceo	NVARCHAR2(20),		
    cp_tel	VARCHAR2(20),		
    cp_addr	NVARCHAR2(125),		
    cp_genre	NVARCHAR2(10)		
);

CREATE TABLE tbl_author(
    au_code	CHAR(5)		PRIMARY KEY,
    au_name	NVARCHAR2(50)	NOT NULL,	
    au_tel	VARCHAR2(20),		
    au_addr	NVARCHAR2(125),		
    au_genre	NVARCHAR2(30)		
);


SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

-- 3개의 table을 JOIN
DROP VIEW view_도서정보;
CREATE VIEW view_도서정보 AS
(
SELECT B.bk_isbn AS ISBN,
        B.bk_title AS 도서명,
        C.cp_title AS 출판사명,
        C.cp_ceo AS 출판사대표,
        A.au_name AS 저자명,
        A.au_tel AS 저자연락처,
        B.bk_date AS 출판일,
        B.bk_price AS 가격,
        B.bk_pages AS 페이지
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_ccode = C.cp_code
    LEFT JOIN tbl_author A
        ON B.bk_acode = A.au_code
);

-- 단독 Table로 생성된 VIEW는 INSERT, UPDATE, DELETE를 실행할 수 있다
-- Table을 JOIN한 결과로 생성된 VIEW는 읽기전용
--      INSERT, UPDATE, DELETE를 실행할 수 없다

-- 결과물 출력시 : ISBN 이상하게 출력될때  ="'"&A1 로 새롭게 칸을 만든후 값만 붙여넣기해서 텍스트로 만든다
-- ="A"&TEXT(RANDBETWEEN(1,34),"0000")

SELECT * FROM view_도서정보;

DELETE FROM tbl_books;
COMMIT;


-- bookUser 접속
-- books Table과 author, company table은 Relation 관계가 있다
--      books의 bk_ccode와 company의 cp_code
--      books의 bk_acode와 company의 au_code
-- 연관관계에 있는 Table을 EQ JOIN을 실행할때
-- 만약 author, company table에 없는 데이터(코드)가 
-- books에 있다면 EQ JOIN을 하면 데이터가 누락되어 버린다
-- 또한 LEFT JOIN을 하면 값이 (null) 로 출력된다
-- JOIN 데이터가 누락되거나 (null) 출력되는 것은
-- 데이터에 문제가 발생한 것이다. "참조무결성"이 무너졌다

SELECT * FROM view_도서정보;





















