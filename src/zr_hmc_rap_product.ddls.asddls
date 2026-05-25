@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZHMC_RAP_PRODUCT'
@Metadata.allowExtensions: true
define root view entity ZR_HMC_RAP_PRODUCT
  as select from zhmc_rap_product
{
  key product_id            as ProductId,
      brand_id              as BrandId,
      brand_name            as BrandName,
      product_description   as ProductDescription,
      currency              as CurrencyCode,
      unit                  as Unit,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity              as Quantity,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
