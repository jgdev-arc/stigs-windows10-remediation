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
STIG-ID         : WN10-CC-000197

#>

# Disable Microsoft Consumer Experiences
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$propertyName = "DisableConsumerFeatures"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Microsoft Consumer Experiences have been disabled. (STIG: WN10-CC-000197)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000197              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Microsoft consumer experiences must be turned off

■ STIG ID  
  WN10-CC-000197

■ Description  
  Prevents Windows 10 from automatically installing consumer-focused apps
  and services that are not necessary in enterprise or secure environments.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent  
  • Value Name    : DisableConsumerFeatures  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    $propertyName = "DisableConsumerFeatures"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Consumer experiences are now disabled and the system is compliant with the STIG.

#>
