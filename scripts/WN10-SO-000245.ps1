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
STIG-ID         : WN10-SO-000245

#>

# Enable UAC Admin Approval Mode for the built-in Administrator account
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "FilterAdministratorToken"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Admin Approval Mode for built-in Administrator has been enabled. (STIG: WN10-SO-000245)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-SO-000245              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  User Account Control approval mode for the built-in Administrator must be enabled

■ STIG ID  
  WN10-SO-000245

■ Description  
  Ensures that the built-in Administrator account uses Admin Approval Mode, 
  which helps prevent unauthorized changes to the system by requiring elevation consent.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System  
  • Value Name    : FilterAdministratorToken  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    $propertyName = "FilterAdministratorToken"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Admin Approval Mode is now enabled and compliant with the STIG.

#>
