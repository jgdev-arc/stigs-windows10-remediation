<#
╔════════════════════════════════════════════════════════════════╗
║                          SCRIPT NOTES                          ║
╚════════════════════════════════════════════════════════════════╝

Author          : Jonathan G
LinkedIn        : linkedin.com/in/jgdev/
GitHub          : github.com/jgdev-arc
Date Created    : 2026-06-03
Last Modified   : 2026-06-03
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-AU-000582

#>

# Enable auditing of File System events (Success)

auditpol /set /subcategory:"File System" /success:enable

Write-Output "✅ Auditing for File System events (Success) has been enabled. (STIG: WN11-AU-000582)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-AU-000582              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  Windows 11 must be configured to audit file system successes.

■ STIG ID
  WN11-AU-000582

■ Description
  Enables auditing for successful file system access events. This helps
  provide visibility into file and folder access activity for security
  monitoring, accountability, and forensic investigations.

■ Remediation Details
  • Audit Category    : Object Access
  • Audit Subcategory : File System
  • Required Setting  : Success

■ Script Logic

    auditpol /set /subcategory:"File System" `
             /success:enable

■ Compliance Result
  ✅ Auditing of File System events (Success) is enabled and compliant
  with the STIG.

#>
