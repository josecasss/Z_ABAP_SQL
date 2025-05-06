CLASS zcl_sql_06_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_sql_06_fjcm IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


*MEMORIZAR. SOLO SE ACTUALIZAN CAMPOS NO KEY

  CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'USD'.

  SELECT FROM zcarrier_fjcm
  FIELDS *
  INTO TABLE @DATA(lt_airlines).


  IF sy-subrc = 0.

    LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<ls_airlines>). "Usando assingning fields como structura
      <ls_airlines>-currency_code = lc_currency. "Cambios que se haran, pero como es loop afectara a todo
    ENDLOOP.

    UPDATE zcarrier_fjcm FROM TABLE @lt_airlines. "Actualizando

    IF sy-subrc = 0.
       out->write( |All records updated with the new currency { lc_currency } | ).

    ENDIF.

  ENDIF.



  ENDMETHOD.

ENDCLASS.
