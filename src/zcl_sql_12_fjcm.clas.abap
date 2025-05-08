CLASS zcl_sql_12_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_12_fjcm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_airlines TYPE STANDARD TABLE OF zcarrier_fjcm. "itab por que son varios registros


    SELECT FROM zcarrier_fjcm      "Consulta select a los registros que tengan EU
     FIELDS *
     WHERE currency_code = 'EUR'
     INTO TABLE @lt_airlines.

    IF sy-subrc <> 0.    " Si sy-subrc = 4, fallo
       out->write( 'Records with EUR currency not available ' ).
    ENDIF.

    SELECT FROM zcarrier_fjcm      "Consulta select a los registros que tengan COP
     FIELDS carrier_id
     WHERE currency_code = 'COP'
     INTO CORRESPONDING FIELDS OF TABLE @lt_airlines.

    IF sy-subrc = 0.

      DELETE zcarrier_fjcm FROM TABLE @lt_airlines.

      IF sy-subrc = 0.
        out->write( 'Records deleted from Database ' ).
      ENDIF.

    ENDIF.







  ENDMETHOD.
ENDCLASS.
