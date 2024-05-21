*&---------------------------------------------------------------------*
*& Report Z05_26
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_26.
* where 조건을 이용해 여러 라인 변경

DATA: BEGIN OF gs_line,
        carrid   TYPE sflight-carrid,
        carrname TYPE scarr-carrname,
        fldate   TYPE sflight-fldate,
      END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line.

SELECT carrid connid INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight.

LOOP AT gt_itab INTO gs_line.

  AT NEW carrid.
    SELECT SINGLE carrname INTO gs_line-carrname FROM scarr WHERE carrid = gs_line-carrid.
    MODIFY gt_itab FROM gs_line TRANSPORTING carrname WHERE carrid = gs_line-carrid.
  ENDAT.

  WRITE : / gs_line-carrid, gs_line-carrname.
ENDLOOP.
