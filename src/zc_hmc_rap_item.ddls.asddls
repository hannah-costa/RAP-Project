@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_HMC_RAP_ITEM'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_HMC_RAP_ITEM
  provider contract transactional_query
  as projection on ZR_HMC_RAP_ITEM
{
  key ProductUUID,
  key ProductItemUUID,
      ProductItemId,
      ItemName,
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
      LastChangedAt,
      /* Associations */
      _Product
}
