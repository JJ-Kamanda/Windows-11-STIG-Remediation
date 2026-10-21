<#
.SYNOPSIS 
     This PowerShell script ensures that only the Administrators group has the "Restore files and directories" user right, preventing unauthorized users from restoring files or overriding file permissions.

.NOTES
    Author          : JJ Kamanda
    LinkedIn        : linkedin.com/in/jj-kamanda/
    GitHub          : github.com/JJ-Kamanda
    Date Created    : 2026-10-20
    Last Modified   : 2026-10-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UR-000160

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-UR-000160.ps1 
#>

$InfPath = Join-Path $env:TEMP "RestoreRights.inf"
$DbPath = Join-Path $env:TEMP "RestoreRights.sdb"

@"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeRestorePrivilege = *S-1-5-32-544
"@ | Set-Content -Path $InfPath -Encoding Unicode

secedit.exe /configure /db $DbPath `
    /cfg $InfPath /areas USER_RIGHTS

if ($LASTEXITCODE -ne 0) {
    throw "Failed to configure Restore files and directories."
}
