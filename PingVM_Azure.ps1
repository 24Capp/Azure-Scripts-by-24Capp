# Login all'account di Azure
Connect-AzAccount

# Seleziona la sottoscrizione in cui si trovano le VM
$subscriptionId = "id-della-sottoscrizione"
Select-AzSubscription -SubscriptionId $subscriptionId

# Recupera tutte le VM nella sottoscrizione
$vms = Get-AzVM

# Esegui il ping di tutte le VM
foreach ($vm in $vms) {
    $vmName = $vm.Name
    $vmIP = $vm.NetworkProfile.NetworkInterfaces[0].IpConfigurations[0].PrivateIpAddress
    $result = Test-NetConnection -ComputerName $vmIP -InformationLevel Quiet
    if ($result) {
        Write-Host "La VM $vmName ($vmIP) è raggiungibile."
    } else {
        Write-Host "La VM $vmName ($vmIP) non è raggiungibile."
    }
}


