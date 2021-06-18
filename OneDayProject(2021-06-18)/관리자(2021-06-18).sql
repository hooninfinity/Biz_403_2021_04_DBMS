-- 여기는 관리자 접속

-- 먼저 테이블스페이스 생성
CREATE TABLESPACE scoreDB
DATAFILE 'C:/oraclexe/data/scoreDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 유저생성
CREATE USER scoreUser IDENTIFIED BY scoreUser
DEFAULT TABLESPACE scoreDB;

-- 권한 주기
GRANT DBA TO scoreUser;