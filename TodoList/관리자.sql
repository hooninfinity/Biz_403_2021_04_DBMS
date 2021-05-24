-- 여기는 관리자 접속

CREATE TABLESPACE TodoListDB
DATAFILE 'C:/oraclexe/data/TodoListDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K; 

CREATE USER todolist IDENTIFIED BY todolist
DEFAULT TABLESPACE TodoListDB;

GRANT DBA TO todolist;
