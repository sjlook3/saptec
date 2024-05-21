*&---------------------------------------------------------------------*
*& Report Z05_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_24.
* sflight 테이블에서 현재 항공기 운항 연결 ID별로 예약 총 비용을 추출
* group by 대신 collect 활용

DATA: BEGIN OF gs_line,
        carrid     TYPE sflight-carrid,
        connid     TYPE sflight-connid,
        paymentsum TYPE sflight-paymentsum,
      END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line WITH NON-UNIQUE KEY carrid connid WITH HEADER LINE.
DATA gt_sum LIKE TABLE OF gs_line WITH NON-UNIQUE KEY carrid connid WITH HEADER LINE.

SELECT carrid connid paymentsum
  INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight.

  LOOP AT gt_itab.
    COLLECT gt_itab INTO gt_sum.
  ENDLOOP.

  LOOP AT gt_sum.
    WRITE: / gt_sum-carrid, gt_sum-connid, gt_sum-paymentsum.
  ENDLOOP.
