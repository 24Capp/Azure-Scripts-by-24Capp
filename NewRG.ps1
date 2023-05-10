# Imposta le credenziali di accesso ad Azure
Connect-AzAccount

# Imposta la sottoscrizione in cui creare il gruppo di risorse
$subscriptionId = "YOUR_SUBSCRIPTION_ID"
Set-AzContext -SubscriptionId $subscriptionId

# Imposta il nome e la posizione del gruppo di risorse da creare
$resourceGroupName = "myResourceGroup"
$location = "westus2"

# Crea il gruppo di risorse
New-AzResourceGroup -Name $resourceGroupName -Location $location
