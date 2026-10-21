<#
.SYNOPSIS 
     This PowerShell script ensures that Remote Desktop Services RPC traffic is encrypted by setting fEncryptRPCTraffic to 1.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-19
    Last Modified   : 2026-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000285

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000285.ps1 
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

New-Item -Path $Path -Force | Out-Null

New-ItemProperty -Path $Path `
    -Name "fEncryptRPCTraffic" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null
