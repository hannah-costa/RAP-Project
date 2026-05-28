@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_HMC_RAP_PRODUCT'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_HMC_RAP_PRODUCT
  provider contract transactional_query
  as projection on ZR_HMC_RAP_PRODUCT
{
  key ProductUUID,
      @Consumption: {
                valueHelpDefinition: [ {
                entity.element: 'BrandId',
                entity.name: 'ZC_HMC_RAP_BRAND',
                useForValidation: true
                } ]
                }
      BrandId,
      BrandName,
      ProductName,
      ProductDetails,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
