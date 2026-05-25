@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_HMC_RAP_PRODUCT'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_HMC_RAP_PRODUCT
  provider contract transactional_query
  as projection on ZR_HMC_RAP_PRODUCT
{
  key ProductId,
      @Consumption: {
          valueHelpDefinition: [ {
          entity.element: 'Brandid',
          entity.name: 'ZC_HMC_RAP_BRAND',
          useForValidation: true
          } ]
          }
      BrandId,
      BrandName,
      ProductDescription,
      @Consumption: {
      valueHelpDefinition: [ {
      entity.element: 'Currency',
      entity.name: 'I_CurrencyStdVH',
      useForValidation: true
      } ]
      }
      CurrencyCode,
      @Consumption: {
      valueHelpDefinition: [ {
      entity.element: 'UnitOfMeasure',
      entity.name: 'I_UnitOfMeasureStdVH',
      useForValidation: true
      } ]
      }
      Unit,
      @Semantics: {
      amount.currencyCode: 'CurrencyCode'
      }
      Price,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      Quantity,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
