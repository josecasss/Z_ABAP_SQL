CLASS zcl_sql_19_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_19_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  data lv_flight_price type p LENGTH 16 DECIMALS 2.

*** Por columna
*Ejemplo para variable (variable)


*Solo quiero el campo precio, entonces hago el filtro por las key para identificarlo

    SELECT SINGLE FROM zflight_fjcm        "Obteniendo un registro
           FIELDS price
           WHERE airlineid = 'AA'
            AND  connectionid = '0322'     "FILTRAR todas las KEY, para mayor precision
            AND  flightdate = '20251214'   " y mejor practica
            INTO @DATA(lv_flight_price).


    IF sy-subrc = 0.
      out->write( data = lv_flight_price name = 'Variable - Imprime solo un valor *PRICE*' ).
    ENDIF.

*******************
*Ejemplo para estructura (structure) - Unico registro


*MEJOR PRACTICA QUE CORRESPONDING FIELDS, *SOLO SELECCIONAR LOS CAMPOS QUE QUIERO*

    SELECT SINGLE FROM zflight_fjcm        "Obteniendo un registro
       FIELDS airlineid,
              connectionid,
              price,
              currencycode
       WHERE airlineid = 'AA'          "FILTRAR todas las KEY, para mayor precision
        AND  connectionid = '0322'     " y mejor practica
        AND  flightdate = '20251214'
        INTO @DATA(ls_flight).


    IF sy-subrc = 0.
      out->write( cl_abap_char_utilities=>newline ).
      out->write( data = ls_flight  name = 'Estructura - Solo un registro ' ).
    ENDIF.

***************
*Ejemplo para tabla iterna (itab) - multiples registros

    SELECT FROM zflight_fjcm        "Obteniendo un registro
       FIELDS airlineid,
             connectionid,
             price,
             currencycode
       WHERE airlineid = 'AA'
        INTO table @DATA(lt_flights).


      IF sy-subrc = 0.
        out->write( cl_abap_char_utilities=>newline ).
        out->write( data = lt_flights name = 'ITAB - Multiples registros' ).
      ENDIF.





    ENDMETHOD.
ENDCLASS.
