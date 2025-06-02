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
STIG-ID         : WN10-AC-000020

#>

# Set password history size to remember 24 passwords

$desiredValue = 24
$tempCfg = "$env:TEMP\secpol.cfg"
$tempDb = "$env:TEMP\secedit.sdb"

# Export current security policy
secedit.exe /export /cfg $tempCfg

# Update PasswordHistorySize in the config file
(Get-Content $tempCfg) |
    ForEach-Object {
        if ($_ -match "^PasswordHistorySize") {
            "PasswordHistorySize = $desiredValue"
        } else {
            $_
        }
    } | Set-Content $tempCfg

# Apply updated security policy
secedit.exe /configure /db $tempDb /cfg $tempCfg /areas SECURITYPOLICY

Write-Output "✅ Password history size set to 24. (STIG: WN10-AC-000020)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-AC-000020              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The password history must be configured to 24 passwords remembered.

■ STIG ID  
  WN10-AC-000020

■ Description  
  Enforcing a password history of 24 helps prevent users from reusing old passwords,
  strengthening account security and compliance with DoD standards.

■ Remediation Details  
  • Policy Name   : PasswordHistorySize  
  • Required Value: 24  
  • Configuration Tool: secedit.exe (applies to local security policy)

■ Script Logic  

    - Export current security policy to a file.
    - Replace or insert `PasswordHistorySize = 24` in the file.
    - Re-import the updated configuration using `secedit`.

■ Compliance Result  
  ✅ Password history retention is now set to 24, meeting STIG requirements.

#>
