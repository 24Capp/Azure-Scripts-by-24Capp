$rgName = "nome-del-gruppo-di-risorse"
$vnetName = "nome-della-virtual-network"
$location = "nome-della-geografia"
$addressPrefix = "10.0.0.0/16"
$subnets = @(
    @{
        name = "subnet-1"
        addressPrefix = "10.0.1.0/24"
    },
    @{
        name = "subnet-2"
        addressPrefix = "10.0.2.0/24"
    }
)

# Crea un nuovo gruppo di risorse
New-AzResourceGroup -Name $rgName -Location $location

# Crea una nuova Virtual Network
$vnet = New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rgName -Location $location -AddressPrefix $addressPrefix

# Aggiungi le subnet alla Virtual Network
foreach ($subnet in $subnets) {
    $subnetConfig = New-AzVirtualNetworkSubnetConfig -Name $subnet.name -AddressPrefix $subnet.addressPrefix
    $vnet | Add-AzVirtualNetworkSubnetConfig -Name $subnet.name -AddressPrefix $subnet.addressPrefix
}

# Aggiorna la Virtual Network con le subnet
Set-AzVirtualNetwork -VirtualNetwork $vnet



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