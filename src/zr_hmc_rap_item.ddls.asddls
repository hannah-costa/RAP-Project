@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZHMC_RAP_ITEM'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_HMC_RAP_ITEM as select from zhmc_rap_item
association to parent ZR_HMC_RAP_PRODUCT as _Product on $projection.ProductUUID = _Product.ProductUUID
{
    key _Product.ProductUUID as ProductUUID,
    key product_item_uuid as ProductItemUUID,
    product_item_id as ProductItemId,
    item_name as ItemName,
    currency as CurrencyCode,
    unit as Unit,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    @Semantics.quantity.unitOfMeasure: 'Unit'
    quantity as Quantity,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _Product // Make association public
}
