[CmdletBinding()]
param (
    $localAppData = $env:LOCALAPPDATA,
    $publisher = "TheMasterPrawn",
    $AppName = "NetWorkManagerPS",
    $appLocation = "$localAppData\$publisher\$AppName"
)

New-Item -ItemType Directory $appLocation -Force -ErrorAction SilentlyContinue 

Copy-Item "$PSScriptRoot\*" -Destination $appLocation

return $appLocation

