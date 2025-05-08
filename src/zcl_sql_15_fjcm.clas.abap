CLASS zcl_sql_15_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_15_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*** SELECT SINGLE: Obtiene solo un registro, devolviendo el primero que cumpla la condicioon


    SELECT SINGLE FROM zcarrier_fjcm        "Obteniendo primer registro de la Base de Datos
                  FIELDS *
                  INTO @DATA(ls_airline).   "En una estrutura(Solo un registro)

    IF sy-subrc = 0.
      out->write( ls_airline ).
    ENDIF.

    SELECT SINGLE from zcarrier_fjcm        "Obteniendo primer registro que cumple con condicion en la DB
     FIELDS *
     WHERE currency_code = 'EUR'
     INTO @DATA(ls_airline2).

    IF sy-subrc = 0.
      out->write( ls_airline2 ).
    ENDIF.

*****RECOMENDADO

   SELECT SINGLE from zcarrier_fjcm        "Obteniendo primer registro que cumple con condicion en la DB
     FIELDS *
     WHERE carrier_id = 'AA'               "Para tener registro especifico, condicion con KEY
     INTO @DATA(ls_airline3).

*****

    IF sy-subrc = 0.
      out->write( ls_airline3 ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
