-- 하나마트 

-- Database 생성
CREATE DATABASE nhDB;

-- 사용할 Database에 연결하기
USE nhDB;

-- Table 생성
DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist (
	io_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	io_date	VARCHAR(10)	NOT NULL,	
    io_time	VARCHAR(10)	NOT NULL,	
	io_pname	VARCHAR(50)	NOT NULL,
	io_dname	VARCHAR(50)	NOT NULL,	
	io_dceo	VARCHAR(20)	NOT NULL,	
	io_inout	VARCHAR(5)	NOT NULL,
	io_qty	INT	NOT NULL,	
	io_price	INT	NOT NULL,	
	io_total	INT		
);
-- 만들어진 테이블 구조 확인
DESC tbl_iolist;
-- 매입, 매출 데이터 임포트 후 몇개인지 확인
SELECT COUNT(*) FROM tbl_iolist;

-- 매입과 매출 합계
-- io_inout 칼럼 1이면 매입, 2이면 매출
-- 수량*단가를 곱하여 합계계산
SELECT (io_qty * io_price) 합계
FROM tbl_iolist;

-- 통계함수와 GROUP BY를 사용하여 매입, 매출 합계 계산
SELECT SUM(io_qty * io_price) 합계
FROM tbl_iolist
GROUP BY io_inout;

SELECT io_inout, SUM(io_qty * io_price) 합계
FROM tbl_iolist
GROUP BY io_inout;

-- Oracle의 DECODE(조건, true, false)와 같은 기능. 복잡해서 if를 더 많이 씀
SELECT CASE WHEN io_inout = '1' THEN '매입'
			WHEN io_inout = '2' THEN '매출'
		END AS '구분',
        SUM(io_qty * io_price) AS '합계'
FROM tbl_iolist
GROUP BY io_inout;

-- if(조건,true,false) : MySQL 전용함수
SELECT IF(io_inout = '1','매입','매출') AS 구분,
SUM(io_qty * io_price) AS 합계
FROM tbl_iolist
GROUP BY io_inout;

-- 매입합계와 매출합계를 PIVOT형식으로 조회하기
SELECT
SUM(IF(io_inout = '1', io_qty * io_price, 0)) AS 매입,
SUM(IF(io_inout = '2', io_qty * io_price, 0)) AS 매출
FROM tbl_iolist;

-- 일자별로 매입 매출 합계
SELECT io_date AS 일자,
SUM(IF(io_inout = '1', io_qty * io_price, 0)) AS 매입,
SUM(IF(io_inout = '2', io_qty * io_price, 0)) AS 매출
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

-- 각 거래처별로 매입 매출 합계
-- PIVOT 방식으로 조회하기
-- ~ 별로 : GROUP BY
SELECT io_dname AS 거래처,
SUM(IF(io_inout = '1', io_qty * io_price, 0)) AS 매입,
SUM(IF(io_inout = '2', io_qty * io_price, 0)) AS 매출
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;
-- 표준 SQL을 사용하여 거래처별로 매입 매출 합계(Oracle에서 사용가능)
SELECT io_dname,
SUM(CASE WHEN io_inout = '1' THEN io_qty * io_price ELSE 0 END) AS 매입,
SUM(CASE WHEN io_inout = '2' THEN io_qty * io_price ELSE 0 END) AS 매출
FROM tbl_iolist
GROUP BY io_dname;

-- 2020년 4월의 매입매출 리스트를 조회
SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-30';

-- 2020년 4월의 거래처별로 매입매출 합계
SELECT io_dname AS 거래처명,
	SUM(IF(io_inout = '1', io_qty * io_price, 0)) AS 매입,
	SUM(IF(io_inout = '2', io_qty * io_price, 0)) AS 매출
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-30'
GROUP BY io_dname
ORDER BY io_date;

-- LEFT, MID, RIGHT
-- 문자열 칼럼의 데이터를 일부만 추출할때
-- LEFT(칼럼, 개수) : 왼쪽부터 문자열 추출
-- MID(칼럼, 위치, 개수) : 중간문자열 추출
-- Oracle SUBSTR(칼럼, 위치, 개수)
-- RIGHT(칼럼, 개수) : 오른쪽부터 문자열 추출
SELECT *
FROM tbl_iolist
WHERE LEFT(io_date,7) = '2020-04';

SELECT LEFT('대한민국',2);
SELECT LEFT('Republic of',2);
-- MySQL은 언어와 관계없이 글자수로 인식
SELECT LEFT('대한민국',2), LEFT('Korea',2);
SELECT MID('대한민국',2,2), MID('Korea',2,2);
SELECT RIGHT('대한민국',2), RIGHT('Korea',2);

