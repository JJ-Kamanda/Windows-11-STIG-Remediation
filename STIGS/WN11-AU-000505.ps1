<#
.SYNOPSIS 
     This PowerShell script ensures that the Windows Security event log has a maximum size of at least 5120000 KB (approximately 5 GB) to retain one week's worth of audit records.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-20
    Last Modified   : 2026-10-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000505.ps1 
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

New-Item -Path $Path -Force | Out-Null

New-ItemProperty -Path $Path `
    -Name "MaxSize" `
    -Value 5120000 `
    -PropertyType DWord `
    -Force | Out-Null
