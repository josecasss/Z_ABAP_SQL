CLASS zcl_sql_20_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_20_fjcm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zflight_fjcm
           FIELDS *
           WHERE airlineid = 'LH'
           INTO TABLE @DATA(lt_flights)
           up to 5 rows.                  "Solo traer 5 registros *up to*

   IF sy-subrc = 0.
      out->write( lt_flights ).
   ENDIF.




  ENDMETHOD.
ENDCLASS.
