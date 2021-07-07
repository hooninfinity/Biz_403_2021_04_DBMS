USE myLibs;

CREATE TABLE tbl_gallery (
	g_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	g_writer	VARCHAR(20)	NOT NULL,	
	g_date	VARCHAR(10)	NOT NULL,	
	g_time	VARCHAR(10)	NOT NULL,	
	g_subject	VARCHAR(50)	NOT NULL,	
	g_content	VARCHAR(1000)	NOT NULL,	
	g_image	VARCHAR(125)		
);
SHOW TABLES;
DROP TABLE tbl_gallery;

CREATE TABLE tbl_files (
	file_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	file_gseq	BIGINT	NOT NULL,	
	file_original	VARCHAR(125)	NOT NULL,
	file_upname	VARCHAR(125)	NOT NULL	
);
SHOW TABLES;
DROP TABLE tbl_files;
DROP TABLE tbl_books;

SELECT * FROM tbl_gallery;

INSERT INTO tbl_gallery
(g_writer,g_date,g_time,g_subject,g_content)
VALUES
('callor','2021-07-06','15:18:00','연습','진짜연습');

-- 현재 연결된 session에서 INSERT가 수행되고
-- 그 과정에서 AUTO_INCREMENT 칼럼이 변화가 있으면
-- 그 값을 알려주는 함수
SELECT LAST_INSERT_ID();

DESC tbl_gallery;

INSERT INTO tbl_files
(file_gseq, file_origin, file_upname)
VALUES
(1,'title1','uuid-title1'),
(1,'title2','uuid-title2'),
(1,'title3','uuid-title3')
;

-- INSERT를 수행할 때
-- AUTO_INCREMENT로 설정된 칼럼에
-- 0 또는 null, '' 등을 설정하면
-- AUTO_INCREMENT가 작동된다
INSERT INTO tbl_gallery
( g_seq, g_writer, g_date, g_time, g_subject, g_content )
VALUES
(0, 'callor', '2021', '00:00', '제목', '내용');

SELECT * FROM tbl_files;
SELECT * FROM tbl_gallery;

-- EQ JOIN
-- 카티션 곱
-- 두개의 table을 JOIN하여
-- table1 개수 * table2 개수 만큼 list 출력
SELECT * FROM tbl_gallery G, tbl_files F
	WHERE G.g_seq = F.file_gseq
    AND G.g_seq = 1;
    
SELECT 
	G.g_seq, G.g_writer, G.g_date, G.g_time, G.g_subject, G.g_content, G.g_image,
    F.file_seq, F.file_original, F.file_upname
FROM tbl_gallery G, tbl_files F
	WHERE G.g_seq = F.file_gseq
    AND G.g_seq = 1;





