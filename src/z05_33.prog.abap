*&---------------------------------------------------------------------*
*& Report Z05_33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05_33.

DATA : BEGIN OF gs_line,
  col1 TYPE c,
  col2(7) TYPE c,
  END OF gs_line.

  DATA gt_itab LIKE SORTED TABLE OF gs_line WITH UNIQUE KEY col1.
  DATA gs_wa LIKE LINE OF gt_itab.

  gs_line-col1 = 'A'.
  gs_line-col2 = 'First'.
  INSERT gs_line INTO TABLE gt_itab.

  CLEAR gs_line.

  gs_line-col1 = 'B'.
  gs_line-col2 = 'Second'.
  INSERT gs_line INTO TABLE gt_itab.

  CLEAR gs_line.

  gs_line-col1 = 'A'.

  READ TABLE gt_itab WITH TABLE KEY col1 = 'A' INTO gs_wa TRANSPORTING col2.

  WRITE : / 'Col1 is :', gs_wa-col1, 'Col2 is :', gs_wa-col2.
