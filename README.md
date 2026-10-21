
# Windows 11 STIG remediation

Ten DISA STIG findings on a Windows 11 lab VM in Azure, each remediated with PowerShell and verified with a credentialed Tenable compliance scan. **Failed before, passed after.**

- **Benchmark:** DISA Microsoft Windows 11 STIG, assessed through Tenable Vulnerability Management.
- **Target:** One Windows 11 Azure VM, part of the LOG(N) Pacific Cyber Range.
- **Baseline:** 258 checks, 151 failed, 11 warnings, 96 passed.
- **After remediation:** 138 failed, 10 warnings, 110 passed. All ten targeted findings pass.

## The ten

| STIG ID | Finding | Before | After | Script |
|---|---|---|---|---|
| WN11-AU-000115 | Sensitive Privilege Use - Success auditing enabled | Failed | Passed | [WN11-AU-000115.ps1](STIGS/WN11-AU-000115.ps1) |
| WN11-AU-000500 | Application event log size ≥ 32768 KB | Failed | Passed | [WN11-AU-000500.ps1](STIGS/WN11-AU-000500.ps1) |
| WN11-AU-000505 | Security event log size ≥ 5120000 KB | Failed | Passed | [WN11-AU-000505.ps1](STIGS/WN11-AU-000505.ps1) |
| WN11-CC-000110 | HTTP printing disabled | Failed | Passed | [WN11-CC-000110.ps1](STIGS/WN11-CC-000110.ps1) |
| WN11-CC-000285 | Remote Desktop RPC encryption required | Failed | Passed | [WN11-CC-000285.ps1](STIGS/WN11-CC-000285.ps1) |
| WN11-CC-000310 | Windows Installer user control disabled | Failed | Passed | [WN11-CC-000310.ps1](STIGS/WN11-CC-000310.ps1) |
| WN11-CC-000315 | Windows Installer elevated privileges disabled | Failed | Passed | [WN11-CC-000315.ps1](STIGS/WN11-CC-000315.ps1) |
| WN11-SO-000025 | Built-in Guest account renamed | Failed | Passed | [WN11-SO-000025.ps1](STIGS/WN11-SO-000025.ps1) |
| WN11-SO-000220 | NTLMv2 session security and 128-bit encryption required | Failed | Passed | [WN11-SO-000220.ps1](STIGS/WN11-SO-000220.ps1) |
| WN11-UR-000160 | Restore files and directories restricted to Administrators | Failed | Passed | [WN11-UR-000160.ps1](STIGS/WN11-UR-000160.ps1) |

## Method

1. Run the DISA Windows 11 STIG audit as a credentialed Tenable scan and record the failed checks.
2. For each finding, create a PowerShell script that applies the required security configuration.
3. Run each script as Administrator on the Windows 11 VM and verify the setting using PowerShell, AuditPol, or Local Group Policy.
4. Rescan with Tenable and confirm each targeted finding changed from Failed to Passed.

## What I learned

- **A scanner's check can be stricter than the STIG text.** WN11-AU-000505 requires a Security log large enough for one week's records; the Tenable audit enforced at least 5120000 KB. The initial 1024000 KB configuration failed the rescan.
- **PowerShell registry errors require troubleshooting.** WN11-CC-000110 (HTTP printing) produced a `New-Item -Force` error. I adjusted the script to check whether the registry key existed before creating it.
- **Credentialed scanning requires proper access.** Scanning a standalone Windows 11 VM required firewall access, Remote Registry, and temporary changes to remote UAC filtering for the local administrator account. These changes were reverted afterward.
- **Audit settings provide security telemetry.** Process Creation auditing (Event ID 4688) and PowerShell script block logging (Event ID 4104) provide evidence used during security investigations.
- **User rights assignments require careful control.** WN11-UR-000160 restricts the "Restore files and directories" privilege to Administrators, preventing unauthorized accounts from using restore privileges to bypass file permissions.

## Using the scripts

Each script is standalone. Run it in an elevated PowerShell session on the target Windows 11 system, verify the setting, and rescan with Tenable.

The scripts modify the settings associated with their respective STIG checks. Review each script before running it outside a lab environment.
