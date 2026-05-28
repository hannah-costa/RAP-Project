@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZHMC_RAP_PRODUCT'
@Metadata.allowExtensions: true
define root view entity ZR_HMC_RAP_PRODUCT
  as select from zhmc_rap_product
  composition [1..*] of ZR_HMC_RAP_ITEM as _Item
{
  key product_uuid      as ProductUUID,
  brand_id              as BrandId,
  brand_name            as BrandName,
  product_name          as ProductName,
  product_details       as ProductDetails,
  created_by            as CreatedBy,
  created_at            as CreatedAt,
  local_last_changed_by as LocalLastChangedBy,
  local_last_changed_at as LocalLastChangedAt,
  last_changed_at       as LastChangedAt,
  
  _Item
  
}
