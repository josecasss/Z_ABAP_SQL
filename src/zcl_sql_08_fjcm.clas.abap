CLASS zcl_sql_08_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_08_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_flights TYPE STANDARD TABLE OF zflight_fjcm.

*****Insertacion de datos

**   DELETE FROM zflight_fjcm.
*
*  SELECT FROM /dmo/i_flight
*              FIELDS *
*              INTO CORRESPONDING FIELDS OF TABLE @lt_flights.
*
*
*  IF sy-subrc = 0.
*
*    INSERT zflight_fjcm FROM TABLE @lt_flights.
*
*    IF sy-subrc = 0.
*
*      out->write( |Inserted { sy-dbcnt } rows| ).
*    ENDIF.
*  ENDIF.

*Actualizar campos maximumseats y occupiedseats

    UPDATE zflight_fjcm
           SET maximumseats  = maximumseats + 10, "Set: para afectar los campos en grupo
               occupiedseats = occupiedseats + 5
           WHERE airlineid = 'LH'.

    IF sy-subrc = 0.
      out->write( |Updated rows { sy-dbcnt }| ).
    ELSE.
      out->write( |Updated NOT executed { sy-dbcnt }| ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
