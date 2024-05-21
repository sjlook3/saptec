*&---------------------------------------------------------------------*
*& Report Z05_20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_20.
* Index 이용해 라인 추가시 인터널 테이블 타입에 따른 효과

DATA: BEGIN OF gs_line,
        col1 TYPE c,
        col2 TYPE n,
      END OF gs_line.

*DATA gt_itab LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1.
*DATA gt_itab LIKE SORTED TABLE OF gs_line WITH UNIQUE KEY col1.
DATA gt_itab LIKE HASHED TABLE OF gs_line WITH UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab.

gs_line-col1 = 'A'.
gs_line-col2 = 3.
INSERT gs_line INTO TABLE gt_itab.

gs_line-col1 = 'C'.
gs_line-col2 = 4.
INSERT gs_line INTO TABLE gt_itab.
*BREAK-POINT.

LOOP AT gt_itab INTO gs_line.
  WRITE: / gs_line-col1, gs_line-col2.
ENDLOOP.
