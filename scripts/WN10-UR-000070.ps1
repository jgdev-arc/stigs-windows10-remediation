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
STIG-ID         : WN10-UR-000070

#>

# Configure "Deny access to this computer from the network" user right

# SID strings for groups to deny
$denySIDs = @(
    "*S-1-5-32-544",   # Administrators
    "*S-1-5-18"        # Local System
)

# Define the policy name
$policyName = "SeDenyNetworkLogonRight"

# Generate INF file for SecEdit
$infContent = @"
[Unicode]
Unicode=yes
[Version]
signature="\$CHICAGO$"
Revision=1
[Privilege Rights]
$policyName = $($denySIDs -join ",")
"@

# Write INF to temp file
$infPath = "$env:TEMP\stig-deny-network.inf"
Set-Content -Path $infPath -Value $infContent -Encoding Unicode

# Apply the security policy
secedit.exe /configure /db secedit.sdb /cfg $infPath /areas USER_RIGHTS

Write-Output "✅ 'Deny access to this computer from the network' has been configured for Administrators and SYSTEM. (STIG: WN10-UR-000070)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-UR-000070              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The "Deny access to this computer from the network" user right on workstations
  must be configured to prevent access from highly privileged domain accounts and local system.

■ STIG ID  
  WN10-UR-000070

■ Description  
  Limiting network logon for privileged accounts like Administrators and SYSTEM reduces 
  the attack surface and mitigates lateral movement by attackers.

■ Remediation Details  
  • Policy Name : SeDenyNetworkLogonRight  
  • Required SIDs:
      - S-1-5-32-544 (Administrators)
      - S-1-5-18 (Local System)

■ Script Logic  

    - Generate a security template (INF file) containing the correct SIDs.
    - Apply the template using `secedit.exe`.

■ Compliance Result  
  ✅ Workstations now deny network logon for Administrators and SYSTEM.

#>
