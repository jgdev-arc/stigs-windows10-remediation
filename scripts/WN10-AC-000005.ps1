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
STIG-ID         : WN10-AC-000005

#>

# Set Account Lockout Duration to 15 minutes using secedit

$infContent = @"
[Unicode]
Unicode=yes
[System Access]
LockoutDuration = 15
[Version]
signature="\$CHICAGO\$"
Revision=1
"@

$infPath = "$env:TEMP\V-220002-lockout-duration.inf"
$infContent | Set-Content -Path $infPath -Encoding Unicode

secedit /configure /db secedit.sdb /cfg $infPath /quiet

Start-Sleep -Seconds 2
Write-Output "✅ Account lockout duration has been set to 15 minutes. (STIG: WN10-AC-000005)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-AC-000005              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Account lockout duration must be configured to 15 minutes or greater

■ STIG ID  
  WN10-AC-000005

■ Description  
  Defines how long an account remains locked after failed login attempts.
  A value of 15 minutes or greater is required. Setting to 0 (admin unlock)
  is also permitted.

■ Remediation Details  
  • Policy Path  : Account Lockout Policy  
  • Setting      : Account lockout duration  
  • Required     : 15 minutes or more (or 0 for manual unlock)

■ Script Logic  

    $infContent = @"
    [Unicode]
    Unicode=yes
    [System Access]
    LockoutDuration = 15
    [Version]
    signature="\$CHICAGO\$"
    Revision=1
    "@

    $infPath = "$env:TEMP\V-220002-lockout-duration.inf"
    $infContent | Set-Content -Path $infPath -Encoding Unicode

    secedit /configure /db secedit.sdb /cfg $infPath /quiet

■ Compliance Result  
  ✅ Account lockout duration set to 15 minutes and compliant with the STIG.

#>
