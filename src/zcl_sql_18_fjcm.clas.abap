CLASS zcl_sql_18_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_18_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_flights,                   " Tipo LOCAL
             airlineid    TYPE c LENGTH 3,
             connectionid   TYPE c LENGTH 4,
             price        TYPE p LENGTH 16 DECIMALS 2,
             currencycode TYPE c LENGTH 5,
           END OF ty_flights.

    TYPES: BEGIN OF ty_flights2,                   " Tipo LOCAL
             airlineid    TYPE c LENGTH 3,
             connection   TYPE c LENGTH 4,
             price        TYPE p LENGTH 16 DECIMALS 2,
             currencycode TYPE c LENGTH 5,
           END OF ty_flights2.

***CASO 1

    DATA lt_flights TYPE STANDARD TABLE OF ty_flights.

    SELECT FROM zflight_fjcm
    FIELDS *
    WHERE airlineid = 'LH'
    INTO CORRESPONDING FIELDS OF TABLE @lt_flights. "Se hace un mapeo y solo toma los campos que coinciden
    "Campos que coinciden *Escribir bien*

    IF sy-subrc EQ 0.
      out->write( lt_flights ).
    ENDIF.

**CASO 2

    DATA lt_flights2 TYPE STANDARD TABLE OF ty_flights2.

    SELECT FROM zflight_fjcm
    FIELDS airlineid,
           connectionid AS connection,  "Se puede mapear asi tambien dandole un alias, para que coincida con el tipo 2
           price,
           currencycode
    WHERE airlineid = 'LH'
    INTO CORRESPONDING FIELDS OF TABLE @lt_flights2. "Se hace un mapeo y solo toma los campos que coinciden
    "Campos que coinciden *Escribir bien*

    IF sy-subrc EQ 0.
      out->write( lt_flights2 ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
