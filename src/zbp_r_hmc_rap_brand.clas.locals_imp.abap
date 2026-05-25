CLASS lhc_ZrHmcRapBrand DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZrHmcRapBrand RESULT result.
    METHODS CalculateBrandId FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZrHmcRapBrand~CalculateBrandId.

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

ENDCLASS.
