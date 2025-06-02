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
STIG-ID         : WN10-SO-000255

#>

# Automatically deny UAC elevation requests for standard users
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "ConsentPromptBehaviorUser"
$desiredValue = 0  # 0 = Automatically deny elevation requests

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Standard user UAC elevation requests are now denied automatically. (STIG: WN10-SO-000255)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-SO-000255              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  User Account Control must automatically deny elevation requests for standard users

■ STIG ID  
  WN10-SO-000255

■ Description  
  Prevents standard (non-admin) users from being able to elevate privileges via UAC prompts,
  reducing the risk of unauthorized privilege escalation.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System  
  • Value Name    : ConsentPromptBehaviorUser  
  • Value Type    : REG_DWORD  
  • Required Value: 0

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    $propertyName = "ConsentPromptBehaviorUser"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ UAC now automatically denies elevation requests from standard users.

#>
