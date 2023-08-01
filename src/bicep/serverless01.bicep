param pStorageAccountName string
param pLocation string =resourceGroup().location
param pAppServicePlanName string
param pCapacity int
param pSKUName string
param pFunctionAppName string
param pStartIndex int 
param pCount int 

module Storageaccount_Module 'storageaccount.bicep'= {
  name: 'Storageaccount_Module'
  params: {
    pStorageAccountName: pStorageAccountName
    pLocation: pLocation
  }
}

module AppServicePlanName_Linux_Module 'AppServicePlan-linux.bicep' ={
  name: 'AppServicePlanName_Linux_Module'
  params: {
    pAppServicePlanName: pAppServicePlanName
    pCapacity: pCapacity
    pLocation: pLocation
    pSKUName: pSKUName
  }
}

module functionApp 'azurefunctionapp.bicep' = [for Index in range(pStartIndex,pCount): {
  name: 'FunctionApp-${Index}'
  params: {
    pFunctionAppName: '${pFunctionAppName}-${Index}'
    pLocation: pLocation
    pServerFarmId: AppServicePlanName_Linux_Module.outputs.AppServicePlanId
    pStorageAccountName: pStorageAccountName
    pStorageAccountId: Storageaccount_Module.outputs.storageaccountId
  }
}]

