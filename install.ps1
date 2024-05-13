[CmdletBinding()]
param (
    $localAppData = $env:LOCALAPPDATA,
    $publisher = "TheMasterPrawn",
    $AppName = "NetWorkManagerPS",
    $appLocation = "$localAppData\$publisher\$AppName"
)

New-Item -ItemType Directory $appLocation -Force -ErrorAction SilentlyContinue 

Copy-Item "$PSScriptRoot\*" -Destination $appLocation

. $PSScriptRoot\HighSpeedShortcut.ps1
. $PSScriptRoot\LowLatencyShortcut.ps1

return $appLocation

