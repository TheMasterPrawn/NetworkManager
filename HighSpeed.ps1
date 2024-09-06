
[CmdletBinding()]
param (
    [Parameter()][String]$enableAdapter = "Starlink-Wired"
)

$utility = "$PSScriptRoot\New-AdapterState.ps1"

$adapters = Get-NetAdapter | Where-Object { $_.InterfaceDescription -notlike "Hyper-V*" }

foreach($adapter in $adapters){
    
    .$utility -AdapterName $adapter.Name -Action disable
}

.$utility -AdapterName "$enableAdapter" -Action enable

