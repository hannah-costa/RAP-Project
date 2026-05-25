@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_HMC_RAP_BRAND'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_HMC_RAP_BRAND
  provider contract transactional_query
  as projection on ZR_HMC_RAP_BRAND
{
      @UI.facet: [ {
      label: 'General Information',
      id: 'GeneralInfo',
      purpose: #STANDARD,
      position: 10 ,
      type: #IDENTIFICATION_REFERENCE
      } ]
      @UI.hidden: true
  key BrandUUID,
      @UI.identification: [ {
        position: 10
      } ]
      @UI.lineItem: [ {
        position: 10
      } ]
      @UI.selectionField: [ {
        position: 10
      } ]
      @EndUserText.label: 'Brand Id'
      BrandId,
      @UI.identification: [ {
        position: 20
      } ]
      @UI.lineItem: [ {
        position: 20
      } ]
      @UI.selectionField: [ {
        position: 20
      } ]
      @EndUserText.label: 'Brand Name'
      BrandName,
      @UI.hidden: true
      LastChangedAt

}
