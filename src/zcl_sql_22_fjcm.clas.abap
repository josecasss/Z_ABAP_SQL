CLASS zcl_sql_22_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_22_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_flights TYPE SORTED TABLE OF zflight_fjcm
                         WITH NON-UNIQUE KEY airlineid connectionid.

    SELECT FROM zflight_fjcm
    FIELDS *
    INTO TABLE @lt_flights   "INTO TABLE inicializa
    PACKAGE SIZE 3.

      LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<ls_flights>).
        out->write( |{ <ls_flights>-airlineid } { <ls_flights>-connectionid }| ). "Imprimiendo
      ENDLOOP.

      out->write( cl_abap_char_utilities=>newline ).

    ENDSELECT.












  ENDMETHOD.
ENDCLASS.
