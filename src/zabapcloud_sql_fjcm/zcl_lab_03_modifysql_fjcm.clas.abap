CLASS zcl_lab_03_modifysql_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_modifysql_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**Activity 1

    SELECT SINGLE FROM zproducts_fjcm
    FIELDS *
    WHERE product_id = '1'
    INTO @DATA(ls_modify).


    IF sy-subrc = 0.
      out->write( |The product with the id: { ls_modify-product_id } exists| ).
      ls_modify-quantity = 60.
      ls_modify-price = '850.99'.
      IF sy-subrc = 0.
        MODIFY zproducts_fjcm FROM @ls_modify.
        out->write( |The product was modified with quantity: { ls_modify-quantity } and price: { ls_modify-price }| ).
      ENDIF.
    ENDIF.

**Activity 2

    SELECT FROM zproducts_fjcm
        FIELDS *
        WHERE product_id = 1
        INTO TABLE @DATA(lt_modify).

    IF sy-subrc = 0.
      LOOP AT lt_modify ASSIGNING FIELD-SYMBOL(<fs_modify>).
        <fs_modify>-quantity = 90.
      ENDLOOP.

      APPEND VALUE zproducts_fjcm( category_id = <fs_modify>-category_id
                                   price       =  <fs_modify>-price
                                   product_id  = 11
                                   product_name = 'MSI'
                                   quantity = <fs_modify>-quantity  ) TO lt_modify.

      MODIFY zproducts_fjcm FROM TABLE @lt_modify.

      IF sy-subrc = 0.
        out->write( |The records have been modified| ).
      ELSE.
        out->write( |The records have been NOT modfied| ).
      ENDIF.

    ENDIF.


*MEJOR FORMA EFICIENCIA SIN SELECT

*    MODIFY zproducts_437 FROM TABLE @( VALUE #[ (   product_id = 1
*                                                    product_name = 'LED 24"'
*                                                    category_id = 2
*                                                    quantity = 90
*                                                    price = '850.99' )|
*                                                    ( product_id = 10
*                                                    product_name = 'MSI"
*                                                    category_id = 2
*                                                    quantity = 90
*                                                    price = '850.99' ) ) ).|
*    IF sy-subrc EQ 0.
*    out->write( |{ sy-dbcnt ) records were updated | ).
*    ENDIF

ENDMETHOD.
ENDCLASS.
