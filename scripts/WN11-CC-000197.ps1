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
STIG-ID         : WN11-CC-000197

#>

# Turn off Microsoft consumer experiences
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$propertyName = "DisableWindowsConsumerFeatures"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Microsoft consumer experiences have been turned off. (STIG: WN11-CC-000197)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-CC-000197              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  Microsoft consumer experiences must be turned off.

■ STIG ID
  WN11-CC-000197

■ Description
  Turns off Microsoft consumer experiences, which can provide suggestions,
  notifications, and install suggested Microsoft Store applications.

■ Remediation Details
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent
  • Value Name    : DisableWindowsConsumerFeatures
  • Value Type    : REG_DWORD
  • Required Value: 1

■ Script Logic

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    $propertyName = "DisableWindowsConsumerFeatures"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result
  ✅ Microsoft consumer experiences are now turned off and compliant with the STIG.

#>
