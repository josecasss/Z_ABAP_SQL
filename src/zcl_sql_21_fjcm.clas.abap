CLASS zcl_sql_21_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_21_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**END SELECT NO RECOMENDABLE

    DATA lt_flights TYPE STANDARD TABLE OF zflight_fjcm. "Itab de tipo DB

* ITERAR en estructura la consulta por el numero de registros dela condicion

    SELECT FROM zflight_fjcm
    FIELDS *
    WHERE currencycode = 'USD'
     AND  planetype = '767-200'
    INTO @DATA(ls_flights).

      ls_flights-price *= '1.10'.    "Multiplicando x 10 para incremento de precio
      APPEND ls_flights TO lt_flights.

    ENDSELECT.

    IF sy-subrc = 0.
      out->write( data = lt_flights name = 'Se aplico el incremento' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
