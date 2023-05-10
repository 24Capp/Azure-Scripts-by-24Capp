# Imposta le credenziali di accesso ad Azure
$subscriptionId = "subscriptionId"
$resourceGroupName = "groupName"
$sourceResourceGroupLocation = "sourceLocation"
$destinationResourceGroupName = "destinationGroupName"
$destinationResourceGroupLocation = "destinationLocation"

# Connetti all'istanza di Azure
Connect-AzAccount

# Seleziona l'abbonamento di Azure
Select-AzSubscription -SubscriptionId $subscriptionId

# Ottieni le risorse da spostare
$resources = Get-AzResource -ResourceGroupName $resourceGroupName -Location $sourceResourceGroupLocation

# Sposta le risorse nel gruppo di destinazione
$resources | Move-AzResource -DestinationResourceGroupName $destinationResourceGroupName -DestinationResourceGroupLocation $destinationResourceGroupLocation

