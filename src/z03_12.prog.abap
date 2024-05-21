*&---------------------------------------------------------------------*
*& Report Z03_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_12.
* group by, order by 연습

DATA: gv_carrid     TYPE sflight-carrid,
      gv_connid     TYPE sflight-connid,
      gv_paymentsum TYPE i.

SELECT carrid connid AVG( paymentsum ) AS paymentsum
  INTO (gv_carrid, gv_connid, gv_paymentsum)
  FROM sflight
  GROUP BY carrid connid
  ORDER BY paymentsum.
  WRITE: / gv_carrid, gv_connid, gv_paymentsum.
ENDSELECT.
