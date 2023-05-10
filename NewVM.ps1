$rgName = "nome-del-gruppo-di-risorse"
$location = "nome-della-geografia"
$vmName = "nome-della-vm"
$adminUsername = "nome-dell-amministratore"
$adminPassword = "password-dell-amministratore"

# Crea un nuovo gruppo di risorse
New-AzResourceGroup -Name $rgName -Location $location

# Crea una nuova rete virtuale e una subnet
$vnet = New-AzVirtualNetwork `
    -ResourceGroupName $rgName `
    -Location $location `
    -Name "VNET-$vmName" `
    -AddressPrefix "10.0.0.0/16"
$subnet = Add-AzVirtualNetworkSubnetConfig `
    -Name "Subnet-$vmName" `
    -AddressPrefix "10.0.0.0/24" `
    -VirtualNetwork $vnet

# Crea una nuova scheda di rete
$nic = New-AzNetworkInterface `
    -ResourceGroupName $rgName `
    -Location $location `
    -Name "NIC-$vmName" `
    -SubnetId $subnet.Id `
    -PrivateIpAddress "10.0.0.4" `
    -SecurityGroupId $sg.Id

# Crea una nuova macchina virtuale
New-AzVm `
    -ResourceGroupName $rgName `
    -Location $location `
    -Name $vmName `
    -Image "WindowsServer2019Datacenter" `
    -Credential (New-Object System.Management.Automation.PSCredential ($adminUsername, $(ConvertTo-SecureString $adminPassword -AsPlainText -Force))) `
    -Size "Standard_B2ms" `
    -NetworkInterfaceId $nic.Id

