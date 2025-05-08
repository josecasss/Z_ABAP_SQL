CLASS zcl_sql_16_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_16_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT SINGLE FROM zcarrier_fjcm
           FIELDS *
           WHERE carrier_id = 'AA'
           INTO @DATA(ls_airline)
           BYPASSING BUFFER.

    IF sy-subrc = 0.
      out->write( ls_airline ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
