*&---------------------------------------------------------------------*
*& Report Z05_19
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_19.
* Table Key를 이용한 여러 라인 추가

DATA: BEGIN OF gs_line,
        col1 TYPE c,
        col2 TYPE i,
      END OF gs_line.

DATA gt_itab1 LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1.
DATA gt_itab2 LIKE SORTED TABLE OF gs_line WITH NON-UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab1.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab1.

gs_line-col1 = 'c'.
gs_line-col2 = 3.
INSERT gs_line INTO TABLE gt_itab1.

INSERT LINES OF gt_itab1 INTO TABLE gt_itab2.
*INSERT LINES OF gt_itab1 FROM 1 TO 3 INTO TABLE gt_itab2.

LOOP AT gt_itab2 INTO gs_line.
  WRITE: / gs_line-col1, gs_line-col2.
ENDLOOP.
