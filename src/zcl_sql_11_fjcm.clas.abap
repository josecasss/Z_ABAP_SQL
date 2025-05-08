CLASS zcl_sql_11_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_11_fjcm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* DELETE : Solo basta con especificar la clave para eliminarlo

    SELECT SINGLE FROM zcarrier_fjcm     "Eliminando *UNITED AIRLINES* Primero Single Select = Solo un registro
                  FIELDS *
                  WHERE carrier_id = 'UA'
                  INTO @DATA(ls_airline).

    IF sy-subrc = 0.

      DELETE zcarrier_fjcm FROM @ls_airline.
      IF sy-subrc = 0.
        out->write( 'Record Deleted from Database' ).
      ENDIF.
    ENDIF.


    data(ls_airline_2) = value zcarrier_fjcm( carrier_id = 'WZ' ). " carrier_id KEY

    DELETE zcarrier_fjcm FROM @ls_airline_2.

      IF sy-subrc = 0.
        out->write( 'Record Deleted from Database' ).
      ELSE.
        out->write( 'Record NOTDeleted from Database' ).
      ENDIF.





  ENDMETHOD.
ENDCLASS.
