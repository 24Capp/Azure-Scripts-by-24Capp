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