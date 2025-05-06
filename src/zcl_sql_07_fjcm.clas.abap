CLASS zcl_sql_07_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_07_fjcm IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'USD'.

    UPDATE zcarrier_fjcm
           SET currency_code = @lc_currency "Peligroso, siempre usar where y ser specifico "Set para hacerlo en grupo
           WHERE carrier_id = 'LH'
             OR carrier_id = 'AF'.

    IF sy-subrc = 0.
      out->write( 'Records updated' ).
    ELSE.
      out->write( 'Records NOT updated' ).
    ENDIF.








  ENDMETHOD.
ENDCLASS.
