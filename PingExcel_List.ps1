# Percorso del file Excel contenente la lista di IP
$excelPath = "C:\path\to\file.xlsx"

# Nome del foglio di lavoro contenente la lista di IP
$sheetName = "Sheet1"

# Ottiene la lista di IP dal file Excel
$ips = (Import-Excel -Path $excelPath -WorksheetName $sheetName).IP

# Loop attraverso gli IP e ping
foreach ($ip in $ips) {
    Test-Connection $ip -Count 4
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