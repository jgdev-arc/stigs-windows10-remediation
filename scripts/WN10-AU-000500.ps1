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
STIG-ID         : WN10-AU-000500

#>

# Set Application event log maximum size to 32 MB (32768 KB)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$propertyName = "MaxSize"
$desiredValue = 32768

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Application event log maximum size set to 32768 KB. (STIG: WN10-AU-000500)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-AU-000500              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The Application event log size must be configured to at least 32768 KB

■ STIG ID  
  WN10-AU-000500

■ Description  
  Configures the Application log to retain sufficient event records for
  analysis and auditing by setting a minimum size of 32 MB.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application  
  • Value Name    : MaxSize  
  • Value Type    : REG_DWORD  
  • Required Value: 32768

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
    $propertyName = "MaxSize"
    $desiredValue = 32768

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Application log size is now compliant with the STIG requirement.

#>
