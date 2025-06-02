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
STIG-ID         : WN10-CC-000185

#>

# Restrict anonymous enumeration of SAM accounts
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$propertyName = "RestrictAnonymousSAM"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Anonymous enumeration of SAM accounts has been restricted. (STIG: WN10-CC-000185)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000185              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Anonymous enumeration of SAM accounts must be disabled

■ STIG ID  
  WN10-CC-000185

■ Description  
  Prevents unauthenticated users from querying the Security Accounts
  Manager (SAM) database for user account information, which can 
  be leveraged during enumeration and reconnaissance.

■ Remediation Details  
  • Registry Path : HKLM\SYSTEM\CurrentControlSet\Control\Lsa  
  • Value Name    : RestrictAnonymousSAM  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
    $propertyName = "RestrictAnonymousSAM"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Anonymous SAM enumeration is now disabled and the system is compliant with the STIG.

#>
