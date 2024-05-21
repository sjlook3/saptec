*&---------------------------------------------------------------------*
*& Report Z03_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_10.
* 항공기 스케쥴 정보를 저장하고 있는 spfli 테이블의 모든 데이터를 가져와,
* for all entries 구문을 이용하여 일자별 항공기 운항 정보 테이블에서,
* 관련 데이터를 select

DATA gt_spfli TYPE TABLE OF spfli.
DATA gt_sflight TYPE TABLE OF sflight.
DATA gs_sflight TYPE sflight.

SELECT * FROM spfli
  INTO TABLE gt_spfli.

SELECT * FROM sflight
  INTO TABLE gt_sflight
  FOR ALL ENTRIES IN gt_spfli
  WHERE carrid = gt_spfli-carrid
  AND connid = gt_spfli-connid.

LOOP AT gt_sflight INTO gs_sflight.
  WRITE : / gs_sflight-carrid, gs_sflight-connid.
ENDLOOP.
