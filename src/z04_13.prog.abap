*&---------------------------------------------------------------------*
*& Report Z04_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_13.
* EXIT, CHECK 구문을 활용하여 Subroutine 종료 제어

PARAMETERS : p_val TYPE char10.
PERFORM end_subr USING p_val.

FORM end_subr USING VALUE(p_val).
  CASE p_val.
    WHEN 'EXIT'.
      WRITE 'Subroutine EXIT'.
      EXIT.
    WHEN 'CHECK'.
      WRITE 'Value CHECK'.
      CHECK p_val NE 'CHECK'.
    WHEN OTHERS.
  ENDCASE.
  WRITE 'Subroutine is normally ended'.
ENDFORM.
