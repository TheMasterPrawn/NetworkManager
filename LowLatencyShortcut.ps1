[CmdletBinding()]
param (
    $localAppData = $env:LOCALAPPDATA,
    $publisher = "TheMasterPrawn",
    $AppName = "NetWorkManagerPS",
    $appLocation = "$localAppData\$publisher\$AppName"
)

# Replace 'TargetPath' with the path of the file or program you want the shortcut to point to.
#https://www.flaticon.com/free-icon/ssd_3826157?term=disk+drive&page=1&position=6&origin=search&related_id=3826157

$TargetPath = "$appLocation\LowLatency.bat"

# Replace 'ShortcutName' with the desired name for the shortcut.
$ShortcutName = "LowLatency"

# Create a WScript.Shell object
$WScriptShell = New-Object -ComObject WScript.Shell

# Get the desktop folder path
#$DesktopPath = $WScriptShell.SpecialFolders("Desktop")
$DesktopPath = $WScriptShell.SpecialFolders("Programs")

# Create the shortcut
$Shortcut = $WScriptShell.CreateShortcut("$DesktopPath\$ShortcutName.lnk")
$Shortcut.TargetPath = $TargetPath

$IconPath = "$appLocation\4g.ico"
$Shortcut.IconLocation = $IconPath

$Shortcut.Save()

$Shortcut