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
STIG-ID         : WN10-CC-000355

#>

# Ensure WinRM does not store RunAs credentials

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$propertyName = "DisableRunAs"
$desiredValue = 1  # 1 = Do not store RunAs credentials

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ WinRM is configured to not store RunAs credentials. (STIG: WN10-CC-000355)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000355              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The Windows Remote Management (WinRM) service must not store RunAs credentials.

■ STIG ID  
  WN10-CC-000355

■ Description  
  Disabling the storage of RunAs credentials ensures that sensitive credentials 
  are not retained in memory, preventing their compromise by attackers.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service  
  • Value Name    : DisableRunAs  
  • Value Type    : REG_DWORD  
  • Required Value: 1

■ Script Logic  

    - Ensure the registry key path exists.
    - Set `DisableRunAs` to `1` to disable storage of RunAs credentials.

■ Compliance Result  
  ✅ WinRM now complies with STIG by not storing elevation credentials.

#>
