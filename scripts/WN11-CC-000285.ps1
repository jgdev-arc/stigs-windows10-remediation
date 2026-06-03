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
STIG-ID         : WN11-CC-000285

#>

# Require secure RPC communication for Remote Desktop Session Host
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$propertyName = "fEncryptRPCTraffic"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Remote Desktop Session Host now requires secure RPC communication. (STIG: WN11-CC-000285)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-CC-000285              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  The Remote Desktop Session Host must require secure RPC communications.

■ STIG ID
  WN11-CC-000285

■ Description
  Requires Remote Desktop Services to use secure RPC communication,
  reducing exposure to man-in-the-middle and data disclosure attacks.

■ Remediation Details
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
  • Value Name    : fEncryptRPCTraffic
  • Value Type    : REG_DWORD
  • Required Value: 1

■ Script Logic

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
    $propertyName = "fEncryptRPCTraffic"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result
  ✅ Remote Desktop Session Host now requires secure RPC communication and is compliant with the STIG.

#>
