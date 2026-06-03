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
STIG-ID         : WN11-CC-000280

#>

# Always prompt client for password upon Remote Desktop connection
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$propertyName = "fPromptForPassword"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Remote Desktop Services will always prompt clients for passwords. (STIG: WN11-CC-000280)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-CC-000280              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  Remote Desktop Services must always prompt a client for passwords
  upon connection.

■ STIG ID
  WN11-CC-000280

■ Description
  Prevents Remote Desktop clients from automatically supplying saved
  credentials during connection attempts.

■ Remediation Details
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
  • Value Name    : fPromptForPassword
  • Value Type    : REG_DWORD
  • Required Value: 1

■ Script Logic

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
    $propertyName = "fPromptForPassword"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result
  ✅ Remote Desktop Services now requires clients to enter passwords
  upon connection and is compliant with the STIG.

#>
