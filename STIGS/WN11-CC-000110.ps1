<#
.SYNOPSIS
     This PowerShell script ensures that HTTP printing is disabled by setting DisableHTTPPrinting to 1, preventing Windows from printing over HTTP.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-20
    Last Modified   : 2026-10-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000110.ps1 
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

New-Item -Path $Path -Force | Out-Null

New-ItemProperty -Path $Path `
    -Name "DisableHTTPPrinting" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null
