$username = "username" # inserisci il nome utente della VM
$password = "password" # inserisci la password della VM
$vm_ip = "x.x.x.x" # inserisci l'indirizzo IP della VM
$ssh_port = "22" # inserisci la porta SSH della VM (di default è 22)

$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)

$session = New-SSHSession -ComputerName $vm_ip -Credential $credential -Port $ssh_port
Enter-SSHSession -SSHSession $session



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