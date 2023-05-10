$username = "username" # inserisci il nome utente della VM
$password = "password" # inserisci la password della VM
$vm_ip = "x.x.x.x" # inserisci l'indirizzo IP della VM
$ssh_port = "22" # inserisci la porta SSH della VM (di default è 22)

$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)

$session = New-SSHSession -ComputerName $vm_ip -Credential $credential -Port $ssh_port
Enter-SSHSession -SSHSession $session

