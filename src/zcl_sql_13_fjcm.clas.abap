CLASS zcl_sql_13_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_13_fjcm IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcarrier_fjcm
           WHERE carrier_id = 'AA'.

    IF sy-subrc = 0.
      out->write( 'Records deleted from the Database' ).
    ELSE.
      out->write( 'Records NOT availabe for DELETE' ).
    ENDIF.


    DELETE FROM zcarrier_fjcm
         WHERE  currency_code = 'USD'.

    IF sy-subrc = 0.
      out->write( 'Records deleted from the Database' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
