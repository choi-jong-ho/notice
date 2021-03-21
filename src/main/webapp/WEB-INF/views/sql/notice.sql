drop table notice;
CREATE TABLE notice(
		noticeno                      NUMBER(10)		     NOT NULL		 PRIMARY KEY,
		title                         	VARCHAR2(100)		 NOT NULL,
		id                     	        VARCHAR2(50)		 NOT NULL,
        contents                    VARCHAR2(200)		 NOT NULL,
        c_date                     	     DATE		         NOT NULL,
        u_date                     	     DATE		         NULL,
		file1                          VARCHAR2(100)		 NULL
);



DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO notice(noticeno, title, id, contents, c_date)
VALUES(notice_seq.nextval, '공지사항', '관리자1', '테스트입니다.', sysdate);

INSERT INTO notice(noticeno, title, id, contents, c_date)
VALUES(notice_seq.nextval, '공지사항2', '관리자2', '테스트입니다.', sysdate);

INSERT INTO notice(noticeno, title, id, contents, c_date)
VALUES(notice_seq.nextval, '공지사항3', '관리자3', '테스트입니다.', sysdate);

-- 삭제
delete from notice
where noticeno = 15;

-- 수정
UPDATE notice 
SET title='제목', contents='본문 입니다.', u_date=sysdate
WHERE noticeno=1;


commit;

--수정날짜 널값일때 치환
SELECT  NVL(TO_CHAR(u_date, 'yyyy-mm-dd'), '0000-00-00') as u_date
from notice;

SELECT  TO_CHAR(c_date, 'yyyy-mm-dd') as c_date
from notice;


-- 목록
select noticeno, title, id, TO_CHAR(c_date, 'yyyy-mm-dd') as c_date, NVL(TO_CHAR(u_date, 'yyyy-mm-dd'), '0000-00-00') as u_date, NVL(file1, '-') as file1
from notice
order by noticeno asc;

-- 조회
select noticeno, title, id, contents, TO_CHAR(c_date, 'yyyy-mm-dd') as c_date, NVL(TO_CHAR(u_date, 'yyyy-mm-dd'), '0000-00-00') as u_date, NVL(file1, '-') as file1
from notice
where noticeno = 10;

-- 1 페이지 
SELECT noticeno, title, id, TO_CHAR(c_date, 'yyyy-mm-dd') as c_date, NVL(TO_CHAR(u_date, 'yyyy-mm-dd'), '0000-00-00') as u_date, NVL2(file1, file1, '-') as file1, r
FROM (
           SELECT noticeno, title, id, c_date, u_date, file1, rownum as r
           FROM (
                     SELECT noticeno, title, id, c_date, u_date, file1
                     FROM notice
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- 2 페이지
SELECT noticeno, title, id, TO_CHAR(c_date, 'yyyy-mm-dd') as c_date, NVL(TO_CHAR(u_date, 'yyyy-mm-dd'), '0000-00-00') as u_date, NVL2(file1, file1, '-') as file1, r
FROM (
           SELECT noticeno, title, id, c_date, u_date, file1, rownum as r
           FROM (
                     SELECT noticeno, title, id, c_date, u_date, file1
                     FROM notice
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 11 AND r <= 20;


