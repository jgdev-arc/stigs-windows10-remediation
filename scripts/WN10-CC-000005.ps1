<#
╔════════════════════════════════════════════════════════════════╗
║                          SCRIPT NOTES                          ║
╚════════════════════════════════════════════════════════════════╝

Author          : Jonathan Gistand  
LinkedIn        : linkedin.com/in/jgdev/  
GitHub          : github.com/jgdev-arc  
Date Created    : 2025-06-02  
Last Modified   : 2025-06-02  
Version         : 1.0  
CVEs            : N/A  
Plugin IDs      : N/A  
STIG-ID         : WN10-CC-000005

#>

# Disable camera access from the lock screen
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$propertyName = "NoLockScreenCamera"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Lock screen camera access has been disabled. (STIG: WN10-CC-000005)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000005              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Camera access from the lock screen must be disabled

■ STIG ID  
  WN10-CC-000005

■ Description  
  Prevents use of the system camera on the lock screen before authentication,
  reducing exposure to unauthorized access or information disclosure.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization  
  • Value Name    : NoLockScreenCamera  
  • Value Type    : REG_DWORD  
  • Required Value: 1 (Enabled)

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
    $propertyName = "NoLockScreenCamera"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Lock screen camera access is now disabled and compliant with the STIG.

#>
