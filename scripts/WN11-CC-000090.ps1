<#
╔════════════════════════════════════════════════════════════════╗
║                          SCRIPT NOTES                          ║
╚════════════════════════════════════════════════════════════════╝

Author          : Jonathan Gistand
LinkedIn        : linkedin.com/in/jgdev/
GitHub          : github.com/jgdev-arc
Date Created    : 2026-06-03
Last Modified   : 2026-06-03
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-CC-000090

#>

# Configure Group Policy processing to reapply policies even if
# the GPO has not changed.

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$propertyName = "NoGPOListChanges"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath `
    -Name $propertyName `
    -Value $desiredValue `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "✅ Group Policy objects will be reprocessed even if they have not changed. (STIG: WN11-CC-000090)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-CC-000090              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  Group Policy objects must be reprocessed even if they have not changed.

■ STIG ID
  WN11-CC-000090

■ Description
  Ensures that Group Policy settings are reapplied during policy
  refresh cycles even when no changes are detected. This helps
  guarantee that required security settings remain enforced.

■ Remediation Details
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}
  • Value Name    : NoGPOListChanges
  • Value Type    : REG_DWORD
  • Required Value: 0

■ Script Logic

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
    $propertyName = "NoGPOListChanges"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result
  ✅ Group Policy objects will be reprocessed during policy refresh
  cycles even when no changes are detected, satisfying the STIG
  requirement.

#>
