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
STIG-ID         : WN10-CC-000050

#>

# Enforce hardened UNC paths for SYSVOL and NETLOGON
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"
$settings = "RequireMutualAuthentication=1, RequireIntegrity=1"

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name "\\*\SYSVOL" -Value $settings -PropertyType String -Force | Out-Null
New-ItemProperty -Path $regPath -Name "\\*\NETLOGON" -Value $settings -PropertyType String -Force | Out-Null

Write-Output "✅ Hardened UNC paths have been enforced for SYSVOL and NETLOGON. (STIG: WN10-CC-000050)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000050              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Hardened UNC paths must be defined to require mutual authentication and integrity

■ STIG ID  
  WN10-CC-000050

■ Description  
  Ensures that access to administrative shares like \\*\SYSVOL and \\*\NETLOGON
  is protected by requiring mutual authentication and data integrity, 
  reducing the risk of man-in-the-middle attacks.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths  
  • Value Names   : \\*\SYSVOL and \\*\NETLOGON  
  • Value Type    : REG_SZ  
  • Required Value: RequireMutualAuthentication=1, RequireIntegrity=1

■ Script Logic  

    $regPath = "HK
