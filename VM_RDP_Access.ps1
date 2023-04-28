$username = "username" # inserisci il nome utente della VM
$password = "password" # inserisci la password della VM
$vm_ip = "x.x.x.x" # inserisci l'indirizzo IP della VM
$rdp_port = "3389" # inserisci la porta RDP della VM (di default è 3389)

$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)

$mstscPath = "$env:SystemRoot\system32\mstsc.exe"
$rdpFilePath = "C:\temp\rdp.rdp" # inserisci il percorso completo in cui salvare il file RDP

# crea il file RDP
@"
screen mode id:i:2
desktopwidth:i:1024
desktopheight:i:768
session bpp:i:32
winposstr:s:0,3,0,0,800,600
compression:i:1
keyboardhook:i:2
audiocapturemode:i:0
videoplaybackmode:i:1
connection type:i:7
networkautodetect:i:1
bandwidthautodetect:i:1
displayconnectionbar:i:1
username:s:$($credential.UserName)
password 51:b:$($securePassword | ConvertFrom-SecureString)
full address:s:$vm_ip
port:i:$rdp_port
"@ | Out-File $rdpFilePath

# esegui il file RDP
& $mstscPath $rdpFilePath




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