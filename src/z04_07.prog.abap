*&---------------------------------------------------------------------*
*& Report Z04_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_07.
* using, changing으로 인터널 테이블을 Subroutine의 파라미터로 사용

TYPES : BEGIN OF t_str,
          col1 TYPE c,
          col2 TYPE i,
        END OF t_str.

TYPES: t_itab TYPE TABLE OF t_str.
DATA : gs_str  TYPE t_str,
       gt_itab TYPE t_itab.

gs_str-col1 = 'A'.
gs_str-col2 = 1.
APPEND gs_str TO gt_itab.

gs_str-col1 = 'B'.
gs_str-col2 = 2.
APPEND gs_str TO gt_itab.

PERFORM test_itab USING gt_itab.

FORM test_itab USING pt_itab TYPE t_itab.
  READ TABLE pt_itab WITH KEY col1 = 'A' INTO gs_str.
  IF sy-subrc EQ 0.
    WRITE : gs_str-col1, gs_str-col2.
  ENDIF.
ENDFORM.
