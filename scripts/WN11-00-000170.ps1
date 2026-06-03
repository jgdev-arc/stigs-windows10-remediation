<#
╔════════════════════════════════════════════════════════════════╗
║                          SCRIPT NOTES                          ║
╚════════════════════════════════════════════════════════════════╝

Author          : Jonathan G
LinkedIn        : linkedin.com/in/jgdev/
GitHub          : github.com/jgdev-arc
Date Created    : 2026-06-03
Last Modified   : 2026-06-03
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-00-000170

#>

# Disable SMBv1 client protocol

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$propertyName = "AllowInsecureGuestAuth"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath `
    -Name $propertyName `
    -Value $desiredValue `
    -PropertyType DWord `
    -Force | Out-Null

# Disable SMBv1 feature if present
Disable-WindowsOptionalFeature `
    -Online `
    -FeatureName SMB1Protocol `
    -NoRestart `
    -ErrorAction SilentlyContinue | Out-Null

Write-Output "✅ SMBv1 client protocol has been disabled. (STIG: WN11-00-000170)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-00-000170              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  The Server Message Block (SMB) v1 protocol must be disabled on the SMB client.

■ STIG ID
  WN11-00-000170

■ Description
  SMBv1 is a legacy file-sharing protocol that contains numerous
  security weaknesses and is vulnerable to attacks such as
  WannaCry and other SMB-based exploits.

■ Remediation Details
  • Windows Feature : SMB1Protocol
  • Required State  : Disabled

  • Registry Path : HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters
  • Value Name    : AllowInsecureGuestAuth
  • Value Type    : REG_DWORD
  • Required Value: 0

■ Script Logic

    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
    $propertyName = "AllowInsecureGuestAuth"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

    Disable-WindowsOptionalFeature -Online `
        -FeatureName SMB1Protocol `
        -NoRestart

■ Compliance Result
  ✅ SMBv1 has been disabled on the SMB client and the system is compliant with the STIG.

#>
