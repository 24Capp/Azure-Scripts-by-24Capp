# Imposta le credenziali dell'account
$azureAccount = "<Inserisci il nome dell'account>"
$azurePassword = "<Inserisci la password dell'account>"

# Accedi alla piattaforma Azure
$securePassword = ConvertTo-SecureString $azurePassword -AsPlainText -Force
$azureCredential = New-Object System.Management.Automation.PSCredential ($azureAccount, $securePassword)
Connect-AzAccount -Credential $azureCredential


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