# PowerShell script to enable or disable a network adapter

param (
    [string]$AdapterName, 
    [ValidateSet("enable", "disable")][string]$Action 
)

# Check if the adapter exists
try {
    Get-NetAdapter -Name $AdapterName -ErrorAction Stop
}
catch {
    Write-Host "Error: Adapter '$AdapterName' not found." -ForegroundColor DarkRed
    throw $_
    exit 1
}

# Take action based on the specified state
if ($Action -eq "enable") {
    Write-Host "Enabling network adapter '$AdapterName'..."
    Enable-NetAdapter -Name $AdapterName -Confirm:$false
}
elseif ($Action -eq "disable") {
    Write-Host "Disabling network adapter '$AdapterName'..."
    Disable-NetAdapter -Name $AdapterName -Confirm:$false
}

Write-Host "Action '$Action' on adapter '$AdapterName' completed."

exit 0
