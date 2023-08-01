param pAppServicePlanName string
param pLocation string
param pCapacity int
param pSKUName string
resource AppServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServicePlanName
  location: pLocation
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: pSKUName
    capacity: pCapacity
  }
}

output AppServicePlanId string = AppServicePlan.id
