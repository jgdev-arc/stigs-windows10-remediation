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
STIG-ID         : WN10-SO-000100

#>

# Require SMB client to always perform packet signing
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$propertyName = "RequireSecuritySignature"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ SMB client packet signing has been required. (STIG: WN10-SO-000100)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-SO-000100              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The Windows SMB client must be configured to always perform SMB packet signing

■ STIG ID  
  WN10-SO-000100

■ Description  
  Ensures the SMB client verifies the integrity of SMB packets using digital
  signatures, protecting against man-in-the-middle and tampering attacks.

■ Remediation Details  
  • Registry Path : HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters  
  • Value Name    : RequireSecuritySignature  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
    $propertyName = "RequireSecuritySignature"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ SMB client signing is now enforced and compliant with the STIG.

#>
