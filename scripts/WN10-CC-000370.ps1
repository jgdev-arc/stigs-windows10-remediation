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
STIG-ID         : WN10-CC-000370

#>

# Disable convenience PIN sign-in (AllowDomainPINLogon)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$propertyName = "AllowDomainPINLogon"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Convenience PIN sign-in has been disabled. (STIG: WN10-CC-000370)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000370              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The convenience PIN for Windows 10 must be disabled

■ STIG ID  
  WN10-CC-000370

■ Description  
  Prevents users from setting up and using a convenience PIN as an
  authentication method, reducing exposure to less secure login paths.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\System  
  • Value Name    : AllowDomainPINLogon  
  • Value Type    : REG_DWORD  
  • Required Value: 0

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
    $propertyName = "AllowDomainPINLogon"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Convenience PIN sign-in is now disabled and compliant with the STIG.

#>
