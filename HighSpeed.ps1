
[CmdletBinding()]
param (
    [Parameter()][String]$enableAdapter = "WiFi",
    [Parameter()][String]$disableAdapter = "CandyLand-Wired"
)

$utility = "$PSScriptRoot\New-AdapterState.ps1"

.$utility -AdapterName "$enableAdapter" -Action enable
.$utility -AdapterName "$disableAdapter" -Action disable
