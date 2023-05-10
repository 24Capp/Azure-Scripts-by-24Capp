# Lista di host
$hosts = "host1", "host2", "host3"

# Loop attraverso gli host e ping
foreach ($host in $hosts) {
    Test-Connection $host -Count 4
}

