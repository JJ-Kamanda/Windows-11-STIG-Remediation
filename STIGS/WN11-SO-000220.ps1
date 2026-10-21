<#
.SYNOPSIS 
     This PowerShell script ensures that NTLM server session security requires NTLMv2 session security and 128-bit encryption.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-19
    Last Modified   : 2026-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000220

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000220.ps1 
#>

$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"

New-Item -Path $Path -Force | Out-Null

New-ItemProperty -Path $Path `
    -Name "NTLMMinServerSec" `
    -Value 0x20080000 `
    -PropertyType DWord `
    -Force | Out-Null
