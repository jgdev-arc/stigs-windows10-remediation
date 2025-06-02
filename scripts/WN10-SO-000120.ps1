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
STIG-ID         : WN10-SO-000120

#>

# Require SMB server to always perform packet signing
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
$propertyName = "RequireSecuritySignature"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ SMB server packet signing has been required. (STIG: WN10-SO-000120)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-SO-000120              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The Windows SMB server must be configured to always perform SMB packet signing

■ STIG ID  
  WN10-SO-000120

■ Description  
  Enforces cryptographic signing of SMB traffic on the server side to
  help prevent interception and tampering of data in transit.

■ Remediation Details  
  • Registry Path : HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters  
  • Value Name    : RequireSecuritySignature  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
    $propertyName = "RequireSecuritySignature"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ SMB server signing is now enforced and compliant with the STIG.

#>
