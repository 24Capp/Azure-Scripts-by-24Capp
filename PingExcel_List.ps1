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


