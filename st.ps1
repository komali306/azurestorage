# create a new resource group
$rg = New-AzResourceGroup -name 'rg' -location 'eastus'

# create a storage account 
$storage = New-AzStorageAccount -ResourceGroupName $rg.ResourceGroupName -AccountName 'komali' -Location $rg.Location -SkuName 'Standard_ZRS' -Kind 'StorageV2' -AccessTier 'Hot' -AllowBlobPublicAccess $true

# create a storage container
$musiccontainer = New-AzStorageContainer -Name "music" -Permission Blob -Context $storage.context

# set or uploading music files
Set-AzStorageBlobContent -Container $musiccontainer.Name -File ".\uppenasong.mp3" -Blob "uppenasong.mp3" -Context $storage.context

# get or downloading a container
Get-AzStorageBlob -Container $musiccontainer.Name -Context $storage.context