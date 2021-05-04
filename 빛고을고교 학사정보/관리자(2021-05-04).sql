-- 여기는 관리자 접속
-- KschoolDB, kschool.dbf
CREATE TABLESPACE KschoolDB
DATAFILE 'C:/oraclexe/data/kschool.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- kscuser, kscuser, KShoolDB
CREATE USER kscuser IDENTIFIED BY kscuser
DEFAULT TABLESPACE KschoolDB;

GRANT DBA TO kscuser;
