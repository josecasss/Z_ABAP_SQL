CLASS zcl_sql_04_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_04_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_ddbb TYPE STANDARD TABLE OF zcarrier_fjcm.  "Itab *Multiples registros*

* CASE 2  *Codigo mejorado

    DELETE FROM zcarrier_fjcm.  "Elminar todos los registros *Peligroso

    SELECT FROM /DMO/I_Carrier
           FIELDS AirlineID AS carrier_id,  " Poner alias para mapearlo y asginar campos
                  Name,
                  CurrencyCode AS currency_code
*           WHERE CurrencyCode = 'USD'
           INTO  CORRESPONDING FIELDS OF TABLE @lt_ddbb. "INTO CORRESPONDING FIELDS OF TABLE *importante*

    IF sy-subrc = 0.

*      TRY.

          INSERT zcarrier_fjcm FROM TABLE @lt_ddbb ACCEPTING DUPLICATE KEYS. "Condicion que acepte key duplicadas

*        CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db). "Capturr nombre del error
*          out->write( |The records was not recorded| ). "Aca pongo mensaje de lo que quiero que salga cuando capture mi error
*          return.
*      ENDTRY.

       IF  sy-subrc = 0.
        out->write( |The number of inserted rows is { sy-dbcnt }| ).
       ELSE.
        out->write( |The insert of records was not executed correctly { sy-dbcnt }| ).
       ENDIF.

    ENDIF.








  ENDMETHOD.
ENDCLASS.
