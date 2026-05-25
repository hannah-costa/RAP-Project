CLASS lhc_ZrHmcRapBrand DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZrHmcRapBrand RESULT result.
    METHODS CalculateBrandId FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZrHmcRapBrand~CalculateBrandId.
    METHODS ValidateBrandName FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZrHmcRapBrand~ValidateBrandName.

ENDCLASS.

CLASS lhc_ZrHmcRapBrand IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD CalculateBrandId.

    SELECT FROM zhmc_rap_brand
    FIELDS MAX( brand_id ) INTO @DATA(lv_brandid).

    lv_brandid += 1.

    MODIFY ENTITIES OF zr_hmc_rap_brand IN LOCAL MODE
    ENTITY ZrHmcRapBrand
    UPDATE
    FIELDS ( BrandId )
    WITH VALUE #( FOR brand IN keys
                ( BrandUUID = brand-%key-BrandUUID
                  BrandId = lv_brandid
                  %control-BrandId = if_abap_behv=>mk-on ) ).

  ENDMETHOD.

  METHOD ValidateBrandName.

    READ ENTITIES OF zr_hmc_rap_brand IN LOCAL MODE
    ENTITY ZrHmcRapBrand
    FROM VALUE #( FOR brand IN keys ( %key-BrandUUID = brand-BrandUUID
                                      %control = VALUE #(
                                        BrandName = if_abap_behv=>mk-on
                                      ) ) )
    RESULT DATA(lt_new_brand).


    LOOP AT lt_new_brand INTO DATA(ls_new_brand).

        SELECT SINGLE FROM zhmc_rap_brand
        FIELDS ( brand_name )
        WHERE upper( brand_name ) = @( to_upper( ls_new_brand-brandname ) )
        INTO @DATA(lv_brand).

      IF sy-subrc IS INITIAL.

        APPEND VALUE #( %tky = ls_new_brand-%tky ) TO failed-zrhmcrapbrand.
        APPEND VALUE #( %tky = ls_new_brand-%tky
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Brand already registered.' )
                        ) TO reported-zrhmcrapbrand.

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
