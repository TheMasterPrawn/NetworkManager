
[CmdletBinding()]
param (
    [Parameter()][String]$enableAdapter = "CandyLand-Wired",
    [Parameter()][String]$disableAdapter = "WiFi"
)

$utility = "$PSScriptRoot\New-AdapterState.ps1"

.$utility -AdapterName "$enableAdapter" -Action enable
.$utility -AdapterName "$disableAdapter" -Action disable
