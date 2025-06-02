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
STIG-ID         : WN10-SO-000250

#>

# Ensure UAC prompts for administrators on the secure desktop
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "PromptOnSecureDesktop"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ UAC will now prompt administrators on the secure desktop. (STIG: WN10-SO-000250)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-SO-000250              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  User Account Control must, at minimum, prompt administrators for consent on the secure desktop

■ STIG ID  
  WN10-SO-000250

■ Description  
  Requires elevation prompts to be displayed on a separate secure desktop 
  to help prevent spoofing and interface hijacking by malicious software.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System  
  • Value Name    : PromptOnSecureDesktop  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    $propertyName = "PromptOnSecureDesktop"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ UAC secure desktop prompts are now enabled and compliant with the STIG.

#>
