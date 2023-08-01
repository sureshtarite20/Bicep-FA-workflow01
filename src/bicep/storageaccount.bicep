param pStorageAccountName string
param pLocation string = resourceGroup().location
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: pStorageAccountName
  location: pLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

output storageaccountId string = storageaccount.id
