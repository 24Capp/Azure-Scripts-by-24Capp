# Connetti all'account Azure
Connect-AzAccount

# Imposta la sottoscrizione di lavoro
Set-AzContext -SubscriptionId <subscription-id>

# Ottieni tutti i gruppi di riproduzione
$replicationGroups = Get-AzRecoveryServicesReplicationGroup

# Inizializza un array vuoto per le VM in replica
$replicatedVMs = @()

# Per ogni gruppo di riproduzione, ottieni le VM in replica e aggiungile all'array
foreach ($replicationGroup in $replicationGroups) {
    $replicatedVMs += Get-AzRecoveryServicesReplicationProtectedItem -ProtectionContainer $replicationGroup.ProtectionContainer -ProtectionStatus InProgress | Select-Object Name
}

# Crea un oggetto Excel e aggiungi l'elenco delle VM in replica
$excel = New-Object -ComObject Excel.Application
$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Sheets.Item(1)
$worksheet.Cells.Item(1,1) = "VM in replica"
$row = 2
foreach ($replicatedVM in $replicatedVMs) {
    $worksheet.Cells.Item($row,1) = $replicatedVM.Name
    $row++
}

# Salva il file Excel e chiudilo
$workbook.SaveAs("<path-to-excel-file>")
$workbook.Close()
$excel.Quit()
