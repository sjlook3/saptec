*&---------------------------------------------------------------------*
*& Report Z03_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_08.
* scarr 테이블의 carrid 필드 값이 'AC'인 테이터를 select

DATA gs_where TYPE c LENGTH 72.
DATA gv_carrname TYPE scarr-carrname.
DATA gv_carrid TYPE scarr-carrid VALUE 'AC'.

CONCATENATE 'CARRID = ''' gv_carrid '''' INTO gs_where.

SELECT SINGLE carrname
  INTO gv_carrname
  FROM scarr
  WHERE (gs_where).
WRITE / gv_carrname.
