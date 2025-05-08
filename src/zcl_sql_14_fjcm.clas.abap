CLASS zcl_sql_14_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_14_fjcm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* LUW -1
* UPDATE
* COMMIT WORK

* LUW -2
* UPDATE
* ROLLWORK

    UPDATE zcarrier_fjcm               " MODIFICA A EUROS
       SET    currency_code = 'EUR'
       WHERE     carrier_id = 'AA'.


    IF sy-subrc = 0.

    COMMIT WORK.    "Aplica cambios , confirmando y cerrando

********************************

      SELECT SINGLE FROM zcarrier_fjcm
             FIELDS *
             WHERE carrier_id = 'AA'
             INTO @DATA(ls_airline).

        IF sy-subrc = 0.
          out->write( ls_airline-currency_code ). "Funciona pero solo como valor, no esta en la capa de persitencia
        ENDIF.

    UPDATE zcarrier_fjcm
       SET    currency_code = 'USD'
       WHERE     carrier_id = 'AA'.

       ROLLBACK WORK. "CANCELA LOS CAMBIOS Y NO LOS APLICA A LA CAPA DE PERSISTENCIA

*********************************

      SELECT SINGLE FROM zcarrier_fjcm
             FIELDS *
             WHERE carrier_id = 'AA'
             INTO @ls_airline.
      out->write( ls_airline-currency_code ).
      ENDIF.


    ENDMETHOD.
ENDCLASS.
