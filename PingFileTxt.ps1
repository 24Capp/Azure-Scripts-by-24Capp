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


