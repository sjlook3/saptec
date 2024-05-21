*&---------------------------------------------------------------------*
*& Report Z03_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_06.
* sflight 테이블에는 항공사 이름이 존재하지 않지만, scarr 테이블에는 항공사 ID에 해당하는 이름이 저장되어 있다.
* 이 2개 테이블을 JOIN으로 연결하면 항공사 이름을 가져올 수 있다.

TYPES: BEGIN OF t_str,
         carrid   TYPE sflight-carrid,
         carrname TYPE scarr-carrname,
       END OF t_str.
DATA : gs_str TYPE t_str.

SELECT SINGLE a~carrid b~carrname
  INTO CORRESPONDING FIELDS OF gs_str
  FROM sflight AS a INNER JOIN scarr AS b
  ON a~carrid EQ b~carrid
  WHERE a~carrid = 'AA'.

WRITE : gs_str-carrid, gs_str-carrname.
