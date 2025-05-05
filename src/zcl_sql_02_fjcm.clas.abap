CLASS zcl_sql_02_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_02_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcarrier_fjcm.  "Elminar todos los registros *Peligroso

    DATA lt_ddbb TYPE STANDARD TABLE OF zcarrier_fjcm.  "Itab *Multiples registros*

* CASE 1

*    SELECT FROM /DMO/I_Carrier
*           FIELDS *
*           WHERE CurrencyCode = 'USD'
*           INTO TABLE @DATA(lt_airlines).
*
*    IF sy-subrc = 0.
*
*      lt_ddbb = CORRESPONDING #( lt_airlines MAPPING carrier_id    = AirlineID
*                                                    currency_code  = CurrencyCode ).  " Mapeo hacer coincidir los campos
*
*      INSERT zcarrier_fjcm FROM TABLE @lt_ddbb.
*
*
*      IF sy-subrc = 0.
*        out->write( |The number of inserted rows is { sy-dbcnt }| ).
*      ENDIF.
*
*    ENDIF.

* CASE 2  *Codigo mejorado

    DELETE FROM zcarrier_fjcm.  "Elminar todos los registros *Peligroso

    SELECT FROM /DMO/I_Carrier
           FIELDS AirlineID as carrier_id,  " Poner alias para mapearlo y asginar campos
                  Name,
                  CurrencyCode as currency_code
           WHERE CurrencyCode = 'USD'
           INTO  CORRESPONDING FIELDS OF TABLE @lt_ddbb. "INTO CORRESPONDING FIELDS OF TABLE *importante*

    IF sy-subrc = 0.

      INSERT zcarrier_fjcm FROM TABLE @( value #( ( carrier_id    = 'JET'
                                                    name          = 'Jet Smart'
                                                    currency_code = 'USD' ) ) ). "" *lt_ddbb* Ingresar registros manualmente



      INSERT zcarrier_fjcm FROM TABLE @lt_ddbb.    "Ingresar multiples desde una consulta previamente hecha

      IF sy-subrc = 0.
        out->write( |The number of inserted rows is { sy-dbcnt }| ).
      ENDIF.

    ENDIF.








  ENDMETHOD.
ENDCLASS.
