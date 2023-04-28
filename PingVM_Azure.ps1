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




#Ringraziamenti 24Capp

Add-Type -AssemblyName System.Windows.Forms

$message = "24Capp Script Official"

$popup = New-Object System.Windows.Forms.Form
$popup.Text = "24Capp Thanks, everyone"
$popup.Width = 400
$popup.Height = 200
$popup.BackColor = [System.Drawing.Color]::Yellow
$popup.ForeColor = [System.Drawing.Color]::Red

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(20, 50)
$label.Size = New-Object System.Drawing.Size(350, 50)
$label.Text = $message
$label.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$popup.Controls.Add($label)

$popup.ShowDialog()