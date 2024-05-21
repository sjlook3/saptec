*&---------------------------------------------------------------------*
*& Report Z03_16
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_16.
* 항공사 운항 일정을 저장하고 있는 spfli 테이블에 데이터 추가
* 인터널 테이블의 모든 값을 한번에 테이블에 삽입, 같은 key 값을 insert 하게 되면,
* dump error가 발생하는데 이를 방지하기 위해, accepting duplicate keys 구문을 사용
* insert 구문 실패하면 sy-subrc값 4를 반환

DATA: gt_spfli TYPE TABLE OF spfli,
      gs_spfli TYPE spfli.

gs_spfli-carrid = 'KO'.
gs_spfli-connid = '0001'.
gs_spfli-cityfrom = 'Seoul'.
gs_spfli-cityto = 'Beijing'.
APPEND gs_spfli to gt_spfli.

gs_spfli-carrid = 'KO'.
gs_spfli-connid = '0002'.
gs_spfli-cityfrom = 'Seoul'.
gs_spfli-cityto = 'Bangalore'.
APPEND gs_spfli to gt_spfli.

INSERT spfli FROM TABLE gt_spfli ACCEPTING DUPLICATE KEYS.
