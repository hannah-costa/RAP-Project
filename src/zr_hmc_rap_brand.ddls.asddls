@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZHMC_RAP_BRAND'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_HMC_RAP_BRAND
  as select from zhmc_rap_brand
{
  key brand_uuid as BrandUUID,
  brand_id as BrandId,
  brand_name as BrandName,
  last_changed_at as LastChangedAt
}
