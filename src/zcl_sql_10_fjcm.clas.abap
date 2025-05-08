CLASS zcl_sql_10_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_10_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'EUR'.

    SELECT FROM zcarrier_fjcm              "Consulta con condicion where en itab
    FIELDS *
    WHERE carrier_id = 'LH'
       OR carrier_id = 'AF'
    INTO TABLE @DATA(lt_airlines).

    IF sy-subrc = 0.

      LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<fs_airlines>). "Field Symbol
        <fs_airlines>-currency_code = lc_currency.               " Cambio de moneda
      ENDLOOP.

      APPEND VALUE #( carrier_id    = 'AV'
                      name          = 'AVIANCA'
                      currency_code = 'COP' ) TO lt_airlines.  "Agregando 1 registro manualmente a la itab

      MODIFY zcarrier_fjcm FROM TABLE @lt_airlines.            "Modificando y aplicando cambios

      IF sy-subrc = 0.                                         "Validacion
        out->write( |The records have been modfied| ).
      ELSE.
        out->write( |The records have been NOT modfied| ).
      ENDIF.

    ENDIF.















  ENDMETHOD.
ENDCLASS.
