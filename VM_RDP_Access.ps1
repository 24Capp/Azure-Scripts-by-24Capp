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

