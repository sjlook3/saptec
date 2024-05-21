*&---------------------------------------------------------------------*
*& Report Z05_30
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_30.
* adjacent duplicate 구문을 이용하여 중복된 라인 삭제.
* 이 구문을 수행하기 sort구문을 인터널 테이블 정렬해야 원하는 결과 출력 가능

DATA : BEGIN OF gs_line,
         carrid TYPE sflight-carrid,
         connid TYPE sflight-connid,
       END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line WITH HEADER LINE.

SELECT carrid connid INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight.

DELETE ADJACENT DUPLICATES FROM gt_itab.

LOOP AT gt_itab.
  WRITE : / gt_itab-carrid, gt_itab-connid.

ENDLOOP.
