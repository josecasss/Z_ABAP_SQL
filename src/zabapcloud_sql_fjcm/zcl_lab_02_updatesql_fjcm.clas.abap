CLASS zcl_lab_02_updatesql_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_updatesql_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**Activity 1
*
*    SELECT SINGLE FROM zproducts_fjcm
*       FIELDS *
*       WHERE product_id = '1'
*      INTO @DATA(ls_update1).
*
*      IF sy-subrc = 0.
*
*        out->write( |The product with ID { ls_update1-product_id } was found.| ).
*
*        " Modificamos los campos necesarios
*        ls_update1-quantity = 75.
*        ls_update1-price = '899.99'.
*
*        " Ejecutamos la actualización en la base de datos
*        UPDATE zproducts_fjcm FROM @ls_update1.
*
*        IF sy-subrc = 0.
*          out->write( |The product with ID { ls_update1-product_id } was successfully updated.| ).
*        ELSE.
*          out->write( |Error: The product could not be updated.| ).
*        ENDIF.
*
*      ELSE.
*        out->write( |The product was not found.| ).
*      ENDIF.
**Activity 2
*
*      DATA(lv_quantity) = 120.
*
*      SELECT FROM zproducts_fjcm
*        FIELDS *
*        WHERE category_id = 102
*        INTO TABLE @DATA(lt_update2)
*        UP TO 2 ROWS.
*
*      IF sy-subrc = 0.
*
*        LOOP AT lt_update2 ASSIGNING FIELD-SYMBOL(<ls_update2>).
*          <ls_update2>-quantity = lv_quantity.
*        ENDLOOP.
*
*        UPDATE zproducts_fjcm FROM TABLE @lt_update2.
*
*        IF sy-subrc = 0.
*          out->write( |Records updated { sy-dbcnt } with quantity: { lv_quantity } | ).
*        ENDIF.
*
*      ENDIF.
*
**Activity 3
*
*    UPDATE zproducts_fjcm
*           SET price = 50
*           WHERE category_id = 102.
*
*    IF sy-subrc = 0.
*      out->write( |Records updated: { sy-dbcnt }| ).
*    ELSE.
*      out->write( 'Records NOT updated' ).
*    ENDIF.

*Activity 4

 DATA(lv_increase_price) = 50.

    UPDATE zproducts_fjcm
           SET price = price + @lv_increase_price
           WHERE product_id <= 101.

    IF sy-subrc = 0.
      out->write( |Records updated with increase price: { sy-dbcnt }| ).
    ELSE.
      out->write( 'Records NOT updated' ).
    ENDIF.

    ENDMETHOD.
ENDCLASS.
