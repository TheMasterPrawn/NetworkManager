<#
.SYNOPSIS
    A short one-line action-based description, e.g. 'Tests if a function is valid'
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.EXAMPLE
    .\CreateShortcut.ps1 "C:\path\to\your\batchfile.bat" "C:\path\to\your\shortcut.lnk" "C:\path\to\your\icon.ico"
#>

param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$BatchFilePath, 

    [Parameter(Mandatory = $true, Position = 1)]
    [string]$ShortcutPath, 

    [Parameter(Mandatory = $true, Position = 2)]
    [string]$IconFilePath     
)

# Create a new WScript.Shell COM object
$shell = New-Object -ComObject WScript.Shell

# Create a new shortcut object
$shortcut = $shell.CreateShortcut($ShortcutPath)

# Set the target path of the shortcut to the batch file path
$shortcut.TargetPath = $BatchFilePath

# Set the working directory to the directory containing the batch file
$shortcut.WorkingDirectory = (Get-Item $BatchFilePath).DirectoryName

# Set the icon path of the shortcut
$shortcut.IconLocation = "$IconFilePath,0"

# Save the shortcut
$shortcut.Save()

Write-Output "Shortcut created at $ShortcutPath with icon from $IconFilePath."
