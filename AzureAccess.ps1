# Imposta le credenziali dell'account
$azureAccount = "<Inserisci il nome dell'account>"
$azurePassword = "<Inserisci la password dell'account>"

# Accedi alla piattaforma Azure
$securePassword = ConvertTo-SecureString $azurePassword -AsPlainText -Force
$azureCredential = New-Object System.Management.Automation.PSCredential ($azureAccount, $securePassword)
Connect-AzAccount -Credential $azureCredential
