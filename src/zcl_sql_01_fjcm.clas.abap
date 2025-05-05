CLASS zcl_sql_01_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_01_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

***INSERT SINGLE ROW***

    DATA ls_airline TYPE zcarrier_fjcm.  "Estructura *Solo un registro

*    ls_airline = VALUE #( carrier_id    = 'AA'
*                          name          = 'American Airlines'
*                          currency_code = 'USD' ).

*         INSERT INTO zcarrier_fjcm VALUES @ls_airline.  "Primera forma


* Mejor forma:

    INSERT zcarrier_fjcm FROM @( VALUE #( carrier_id    = 'SKY'
                                          name          = 'Sky Airlines'
                                          currency_code = 'USD' ) ). "" *lt_ddbb* Ingresar registros manualmente

    INSERT zcarrier_fjcm FROM @ls_airline.         "Forma recomendada

    IF sy-subrc = 0.
      out->write( 'Record inserted correctly' ).
    ELSE.
      out->write( 'The record was not inserted correctly' ).
    ENDIF.











  ENDMETHOD.
ENDCLASS.
