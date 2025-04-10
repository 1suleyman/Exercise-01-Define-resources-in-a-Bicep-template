resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'toylaunchstoragebob'
  location: 'westus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01'= {
  name: 'toylaunchappserviceplanbob'
  location: 'westus'
  sku: {
    name: 'F1'
  }
}
resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: 'toylaunchappbob'
  location: 'westus'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
