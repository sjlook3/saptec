*&---------------------------------------------------------------------*
*& Report Z03_20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_20.
* DML문을 입력받아서 SQL 실행

PARAMETERS: p_sql(255) TYPE c.

DATA: go_sql TYPE REF TO cl_sql_statement.
DATA: gv_sql TYPE string.
DATA: gd_ret TYPE i.

CREATE OBJECT go_sql.
gv_sql = p_sql.

TRANSLATE gv_sql TO UPPER CASE.

CALL METHOD go_sql->execute_update
  EXPORTING
    statement       = gv_sql
  RECEIVING
    rows_processed = gd_ret.
