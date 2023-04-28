$filePath = "C:\path\to\file.txt"

# Leggi tutti gli indirizzi IP dal file di testo
$ips = Get-Content $filePath

# Esegui il ping di tutti gli indirizzi IP
foreach ($ip in $ips) {
    $result = Test-NetConnection -ComputerName $ip -InformationLevel Quiet
    if ($result) {
        Write-Host "L'indirizzo IP $ip è raggiungibile."
    } else {
        Write-Host "L'indirizzo IP $ip non è raggiungibile."
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