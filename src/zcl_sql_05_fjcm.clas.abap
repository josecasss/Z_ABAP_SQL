CLASS zcl_sql_05_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_sql_05_fjcm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA ls_airline type zcarrier_fjcm.

******** Actualizando Haciendo Consulta con Select Single*

  SELECT SINGLE from zcarrier_fjcm      "Selecciona solo un registro donde cumpla esa condicion
                FIELDS *
                WHERE carrier_id = 'AA'
                into @ls_airline. """"

" Validando nada mas
  if sy-subrc = 0.
  out->write( |Current Currency: { ls_airline-currency_code }|  ).
    if sy-subrc = 0.
        ls_airline-currency_code = 'EUR'.  "Cambiandolo a Euro
        out->write( | New Current Currency: { ls_airline-currency_code }|  ).
    Endif.
  endif.

*Otra forma Actualizando Manualmente - o Agregar registro si no existe***

*ls_airline = VALUE #( carrier_id    = 'AA'  "Campo KEY
*                      name          = 'American Airlines'  " Campo KEY
*                      currency_code = 'PEN' ).  "Solo se actualiza campos no clave
*
  UPDATE zcarrier_fjcm FROM @ls_airline.

  if sy-subrc = 0.
  out->write( |Record updated with new Currency: { ls_airline-currency_code }| ).
  endif.


  ENDMETHOD.
ENDCLASS.
