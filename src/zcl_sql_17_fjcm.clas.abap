CLASS zcl_sql_17_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_17_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_airlines TYPE STANDARD TABLE OF zcarrier_fjcm.

**Debugear para entender mejor. F5 para ir linea por linea y F6 para ir por instruccion, USAR F6 MEJOR


    SELECT FROM zcarrier_fjcm
           FIELDS *
           WHERE currency_code = 'USD'
           INTO TABLE @lt_airlines. "INTO TABLE: Inicializa la tabla y aplica los
                                    "regitros de la consulta

    IF sy-subrc EQ 0.

    out->write( data = lt_airlines  name = 'First Select' ).

    ENDIF.


    IF sy-subrc EQ 0.

       APPEND INITIAL LINE TO lt_airlines. "Inserta una linea en blanco en la itab

       SELECT FROM zcarrier_fjcm
              FIELDS *
              WHERE currency_code = 'EUR'   "Incluso si no hay coincidencias, mantiene
              APPENDING TABLE @lt_airlines. "APPENDING TABLE, Agrega mas registros, manteniendo los otros

    out->write( name = 'New select with new records' data = lt_airlines ).

    ENDIF.


**** EJEMPLO DE COMO SE INICIALIZA
*
*    out->write( 'New select' ).
*
*    SELECT FROM zcarrier_fjcm
*           FIELDS *
*           WHERE currency_code = 'XYZ' "Incluso si no hay coincidencias, inicializa
*           INTO TABLE @lt_airlines. "INTO TABLE: Inicializa la tabla y aplica los
*                                    "regitros de la consulta
*
*
*    IF lt_airlines IS INITIAL. "Si ...... esta vacia : Esa es la condicion
*      out->write( data = lt_airlines name = 'No data on the internal table' ).
*    ENDIF.





  ENDMETHOD.
ENDCLASS.
