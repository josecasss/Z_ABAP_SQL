CLASS zcl_lab_01_ins_sql_fjcm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_ins_sql_fjcm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**Activity 1
*
*    DATA(ls_product) = VALUE zproducts_fjcm( client       = '100'
*                                             product_id   = 1
*                                             product_name = 'Monitor LED 24"'
*                                             category_id  = 101
*                                             quantity     = 50
*                                             price        = '199.99' ).
*
*    DELETE FROM zproducts_fjcm.
*
*    INSERT zproducts_fjcm FROM @ls_product.
*
*    IF sy-subrc = 0.
*      out->write( |Products inserted { sy-dbcnt }| ).
*    ENDIF.
*
**Activity 2
*
*    DATA i TYPE i VALUE 1.
*
*    TYPES tt_products_fjcm TYPE STANDARD TABLE OF zproducts_fjcm WITH EMPTY KEY.
*
*    DATA(lt_products) = VALUE tt_products_fjcm(  (  client       = '100'
*                                                    product_id   = 2
*                                                    product_name = 'Teclado Mecánico'
*                                                    category_id  = 102
*                                                    quantity     = 30
*                                                    price        = '89.90' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 3
*                                                    product_name = 'Mouse Inalámbrico'
*                                                    category_id  = 103
*                                                    quantity     = 75
*                                                    price        = '35.50' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 4
*                                                    product_name = 'Laptop 15.6" i7'
*                                                    category_id  = 104
*                                                    quantity     = 20
*                                                    price        = '899.99' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 5
*                                                    product_name = 'Refrigerador 300L'
*                                                    category_id  = 105
*                                                    quantity     = 12
*                                                    price        = '499.00' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 6
*                                                    product_name = 'Smartphone 128GB'
*                                                    category_id  = 104
*                                                    quantity     = 60
*                                                    price        = '299.99' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 7
*                                                    product_name = 'Tablet 10"'
*                                                    category_id  = 104
*                                                    quantity     = 40
*                                                    price        = '199.00' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 8
*                                                    product_name = 'Impresora Láser'
*                                                    category_id  = 106
*                                                    quantity     = 15
*                                                    price        = '150.75' )
*
*                                                  ( client       = '100'
*                                                    product_id   = 9
*                                                    product_name = 'Silla Ergonómica'
*                                                    category_id  = 107
*                                                    quantity     = 25
*                                                    price        = '120.40' ) ).
*
*    INSERT zproducts_fjcm FROM TABLE @lt_products.
*
*    IF sy-subrc = 0.
*      out->write( |Products inserted { sy-dbcnt }| ).
*    ENDIF.

*Activity 3

    DATA(ls_product2) = VALUE zproducts_fjcm( client        = '100'
                                              product_id    = 1
                                              product_name  = 'Monitor LED 24"'
                                              category_id   = 101
                                              quantity      = 50
                                              price         = '199.99' ).

* Verify Product
    SELECT SINGLE FROM zproducts_fjcm             "Lectura a la base de datos si existe el producto
      FIELDS product_id                           "Lectura solo al campo productid para optimizar
      WHERE product_id = @ls_product2-product_id  "Verificacion
      INTO @DATA(lv_exists).

    IF sy-subrc = 0.
      " The product already exists
      out->write( |Product with ID { ls_product2-product_id } already exists. Product was NOT inserted| ).
    ELSE.
      TRY.
          INSERT zproducts_fjcm FROM @ls_product2.
          out->write( |Product successfully inserted. Records inserted: { sy-dbcnt }| ).

        CATCH cx_sy_open_sql_db INTO DATA(lx_sql_error).
          out->write( |Failed to insert product. SQL error: { lx_sql_error->get_text( ) }| ).
      ENDTRY.
    ENDIF.









  ENDMETHOD.
ENDCLASS.
