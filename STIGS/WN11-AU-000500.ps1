

<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-19
    Last Modified   : 2026-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

New-Item -Path $Path -Force | Out-Null

New-ItemProperty -Path $Path `
    -Name "MaxSize" `
    -Value 32768 `
    -PropertyType DWord `
    -Force | Out-Null
