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
STIG-ID         : WN11-CC-000185

#>

# Configure AutoRun to not execute any autorun commands

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$propertyName = "NoAutorun"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath `
    -Name $propertyName `
    -Value $desiredValue `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "✅ AutoRun is configured to not execute any autorun commands. (STIG: WN11-CC-000185)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-CC-000185              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  The default autorun behavior must be configured to prevent autorun
  commands.

■ STIG ID
  WN11-CC-000185

■ Description
  Prevents Windows from automatically executing commands specified in
  autorun.inf files when removable media or other devices are connected.
  This reduces the risk of malware execution and unauthorized code
  execution.

■ Remediation Details
  • Registry Path : HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
  • Value Name    : NoAutorun
  • Value Type    : REG_DWORD
  • Required Value: 1

■ Script Logic

    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
    $propertyName = "NoAutorun"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result
  ✅ Windows is configured to prevent execution of autorun commands and
  is compliant with the STIG.

#>
