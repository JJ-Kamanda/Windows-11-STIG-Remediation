<#
.SYNOPSIS 
     This PowerShell script ensures that Windows Installer user control is disabled by setting EnableUserControl to 0, preventing users from changing installation options that may bypass security restrictions.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-20
    Last Modified   : 2026-10-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000310.ps1 
#>


$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

New-Item -Path $Path -Force | Out-Null

New-ItemProperty -Path $Path `
    -Name "EnableUserControl" `
    -Value 0 `
    -PropertyType DWord `
    -Force | Out-Null
