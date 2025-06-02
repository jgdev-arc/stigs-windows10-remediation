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
STIG-ID         : WN10-CC-000035

#>

# Disable WDigest authentication unless explicitly required
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest"
$propertyName = "UseLogonCredential"
$desiredValue = 0  # 0 = Do not store plaintext credentials

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ WDigest 'UseLogonCredential' has been disabled. (STIG: WN10-CC-000035)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000035              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  WDigest Authentication must be disabled

■ STIG ID  
  WN10-CC-000035

■ Description  
  Disabling WDigest prevents the storage of plaintext credentials in memory, 
  mitigating the risk of credential theft by malicious actors who may use 
  credential dumping tools.

■ Remediation Details  
  • Registry Path : HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest  
  • Value Name    : UseLogonCredential  
  • Value Type    : REG_DWORD  
  • Required Value: 0

■ Script Logic  

    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest"
    $propertyName = "UseLogonCredential"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ WDigest authentication is now disabled and compliant with the STIG.

#>
