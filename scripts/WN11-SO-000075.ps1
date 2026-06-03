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
STIG-ID         : WN11-SO-000075

#>

# Configure the required legal notice text displayed before logon

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$propertyName = "LegalNoticeText"

$legalNotice = @"
You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct investigations, and counterintelligence investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE, or CI investigative searching or monitoring of the content of privileged communications or work product related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential.
"@

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

Set-ItemProperty -Path $regPath `
    -Name $propertyName `
    -Value $legalNotice `
    -Force

Write-Output "✅ Required legal notice text has been configured. (STIG: WN11-SO-000075)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-SO-000075              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  The required legal notice must be configured to display before
  console logon.

■ STIG ID
  WN11-SO-000075

■ Description
  Displays an approved warning banner before logon to inform users
  that the system is government-owned, monitored, and subject to
  authorized use restrictions.

■ Remediation Details
  • Registry Path : HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
  • Value Name    : LegalNoticeText
  • Value Type    : REG_SZ
  • Required Value: Organization-approved legal notice text

■ Script Logic

    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    $propertyName = "LegalNoticeText"

    Set-ItemProperty -Path $regPath `
        -Name $propertyName `
        -Value $legalNotice

■ Compliance Result
  ✅ The required legal notice text is configured and will be displayed
  before console logon.

#>
