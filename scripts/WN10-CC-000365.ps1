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
STIG-ID         : WN10-CC-000365

#>

# Disable voice activation for Windows apps while the system is locked
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
$propertyName = "LetAppsActivateWithVoiceAboveLock"
$desiredValue = 2  # 2 = Disabled

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Voice activation while the system is locked has been disabled. (STIG: WN10-CC-000365)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000365              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The system must prevent Windows apps from being voice-activated while locked

■ STIG ID  
  WN10-CC-000365

■ Description  
  Disables voice activation (e.g., Cortana) when the system is on the
  lock screen, helping to prevent unauthorized command execution.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy  
  • Value Name    : LetAppsActivateWithVoiceAboveLock  
  • Value Type    : REG_DWORD  
  • Required Value: 2 (Disabled)

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
    $propertyName = "LetAppsActivateWithVoiceAboveLock"
    $desiredValue = 2

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Voice activation on the lock screen is now disabled and compliant with the STIG.

#>
