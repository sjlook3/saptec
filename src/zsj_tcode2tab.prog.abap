*&---------------------------------------------------------------------*
*& Report ZSJ_TCODE2TAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSJ_TCODE2TAB.

TYPES: BEGIN OF ty_data,
         tcode    TYPE tstc-tcode,
         "ttext    TYPE tstct-ttext,
         pgmna    TYPE tstc-pgmna,
         tabname  TYPE d010tab-tabname,
         tabclass TYPE dd02l-tabclass,
         "ddtext   TYPE dd02t-ddtext,
       END OF ty_data.

DATA: it_data TYPE STANDARD TABLE OF ty_data WITH DEFAULT KEY.
"DATA: lv_langu TYPE sy-langu VALUE 'E'.

*&--------------------------------------------------*
PARAMETERS: p_tcode TYPE tstc-tcode.

*&--------------------------------------------------*
START-OF-SELECTION.

  SELECT tstc~tcode,
    "tstct~ttext,
    tstc~pgmna,
    d010tab~tabname,
    dd02l~tabclass",
    "dd02t~ddtext
    FROM tstc
    INNER JOIN d010tab ON d010tab~master = tstc~pgmna
    INNER JOIN dd02l ON dd02l~tabname = d010tab~tabname
    "INNER JOIN dd02t ON dd02t~tabname = dd02l~tabname
    "INNER JOIN tstct ON tstct~tcode = tstc~tcode
    INTO CORRESPONDING FIELDS OF TABLE @it_data
  WHERE tstc~tcode = @p_tcode
    "AND dd02t~ddlanguage = @lv_langu
    "AND tstct~sprsl = @lv_langu
    .

  SORT: it_data BY tabclass DESCENDING tabname.

*&--------------------------------------------------*
  DATA: o_salv TYPE REF TO cl_salv_Table.

  cl_salv_Table=>factory( IMPORTING
    r_salv_table = o_salv
    CHANGING
      t_table = it_data ).

  o_salv->get_functions( )->set_all( abap_true ).
  o_salv->get_display_settings( )->set_striped_pattern( abap_true ).
  o_salv->get_selections( )->set_selection_mode( if_salv_c_selection_mode=>row_column ).
  o_salv->display( ).
