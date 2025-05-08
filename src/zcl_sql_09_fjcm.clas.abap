CLASS zcl_sql_09_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_09_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(ls_airline) = VALUE zcarrier_fjcm( carrier_id = 'WZ' " carrier_id KEY
                                            name = 'Wizz Air' " name       KEY
                                            currency_code = 'PEN' ).

*MODIFY: Actua como un insert si el registro no existe o update si el registro existe

    MODIFY zcarrier_fjcm FROM @ls_airline.

    IF sy-subrc = 0.
      out->write( |The Record was inserted/updated correctly | ).
    ELSE.
      out->write( |The Record was NOT modified correctly | ).
    ENDIF.















  ENDMETHOD.
ENDCLASS.
