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
STIG-ID         : WN10-CC-000310

#>

# Prevent users from changing Windows Installer installation options

$regPath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"
$propertyName = "EnableUserControl"
$desiredValue = 0  # 0 = Users cannot change installation options

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Users are now prevented from changing installation options. (STIG: WN10-CC-000310)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000310              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Users must be prevented from changing installation options.

■ STIG ID  
  WN10-CC-000310

■ Description  
  Restricts users from overriding Windows Installer settings that could otherwise
  allow them to install software or make changes outside of policy control.

■ Remediation Details  
  • Registry Path : HKLM\Software\Policies\Microsoft\Windows\Installer  
  • Value Name    : EnableUserControl  
  • Value Type    : REG_DWORD  
  • Required Value: 0

■ Script Logic  

    - Create or update the registry path if it doesn't exist.
    - Set `EnableUserControl` to 0 to restrict user control over installation behavior.

■ Compliance Result  
  ✅ Windows Installer is now restricted from being overridden by users.

#>
