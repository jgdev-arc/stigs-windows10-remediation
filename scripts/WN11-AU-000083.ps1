<#
╔════════════════════════════════════════════════════════════════╗
║                          SCRIPT NOTES                          ║
╚════════════════════════════════════════════════════════════════╝

Author          : Jonathan Gistand
LinkedIn        : linkedin.com/in/jgdev/
GitHub          : github.com/jgdev-arc
Date Created    : 2026-06-03
Last Modified   : 2026-06-03
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-AU-000083

#>

# Enable auditing of Other Object Access Events (Success)

auditpol /set /subcategory:"Other Object Access Events" /success:enable

Write-Output "✅ Auditing for Other Object Access Events (Success) has been enabled. (STIG: WN11-AU-000083)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-AU-000083              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  Windows 11 must be configured to audit Object Access - Other Object
  Access Events successes.

■ STIG ID
  WN11-AU-000083

■ Description
  Auditing Other Object Access Events provides visibility into access
  attempts involving objects that do not fall into other Object Access
  auditing categories. Logging successful events helps support forensic
  investigations and security monitoring.

■ Remediation Details
  • Audit Category    : Object Access
  • Audit Subcategory : Other Object Access Events
  • Required Setting  : Success

■ Script Logic

    auditpol /set /subcategory:"Other Object Access Events" `
             /success:enable

■ Compliance Result
  ✅ Auditing of Other Object Access Events (Success) is enabled and
  compliant with the STIG.

#>
