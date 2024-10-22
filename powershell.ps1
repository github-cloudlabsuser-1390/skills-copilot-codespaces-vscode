# Login to Azure
Connect-AzAccount

# Define variables
$resourceGroupName = "example-resources"
$location = "eastus"
$storageAccountName = "examplestorageacct"
$skuName = "Standard_LRS"

# Create the resource group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                     -Name $storageAccountName `
                     -Location $location `
                     -SkuName $skuName `
                     -Kind StorageV2