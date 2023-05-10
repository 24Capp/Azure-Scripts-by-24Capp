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
