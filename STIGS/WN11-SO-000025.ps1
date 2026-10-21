<#
.SYNOPSIS
     This PowerShell script ensures that the built-in Windows Guest account is renamed to RestrictedGuest to reduce the risk of unauthorized access.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-19
    Last Modified   : 2026-10-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000025.ps1 
#>

$GuestAccount = Get-LocalUser | Where-Object {
    $_.SID.Value -match '-501$'
}

if ($null -eq $GuestAccount) {
    throw "Built-in Guest account not found."
}

if ($GuestAccount.Name -ne "RestrictedGuest") {
    Rename-LocalUser -InputObject $GuestAccount `
        -NewName "RestrictedGuest"
}
