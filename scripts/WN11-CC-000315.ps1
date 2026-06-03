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
STIG-ID         : WN11-CC-000315

#>

# Disable Windows Installer AlwaysInstallElevated policy
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$propertyName = "AlwaysInstallElevated"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Windows Installer AlwaysInstallElevated has been disabled. (STIG: WN11-CC-000315)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-CC-000315              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The Windows Installer feature "Always install with elevated privileges" must be disabled.

■ STIG ID  
  WN11-CC-000315

■ Description  
  Disables the Windows Installer policy that allows installations to run
  with elevated privileges. Leaving this setting enabled can allow users
  or malicious software to install packages with higher privileges.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer  
  • Value Name    : AlwaysInstallElevated  
  • Value Type    : REG_DWORD  
  • Required Value: 0

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
    $propertyName = "AlwaysInstallElevated"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Windows Installer AlwaysInstallElevated is now disabled and compliant with the STIG.

#>
