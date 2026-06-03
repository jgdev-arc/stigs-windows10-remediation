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
STIG-ID         : WN11-UR-000070

#>

# Configure "Deny access to this computer from the network"
# Required:
#   All systems     : Guests
#   Domain systems  : Enterprise Admins, Domain Admins, Local account

$exportPath = "$env:TEMP\secedit_export.inf"
$importPath = "$env:TEMP\secedit_import.inf"
$databasePath = "$env:TEMP\secedit.sdb"
$userRight = "SeDenyNetworkLogonRight"

# Required built-in SIDs
$requiredSids = @(
    "*S-1-5-32-546" # Guests
)

# Add domain-system requirements when domain joined
$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem

if ($computerSystem.PartOfDomain) {
    $domainName = $computerSystem.Domain

    try {
        $domainAdminsSid = (New-Object System.Security.Principal.NTAccount("$domainName\Domain Admins")).Translate([System.Security.Principal.SecurityIdentifier]).Value
        $requiredSids += "*$domainAdminsSid"
    }
    catch {
        Write-Warning "Could not resolve Domain Admins SID."
    }

    try {
        $forest = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
        $rootDomainName = $forest.RootDomain.Name
        $enterpriseAdminsSid = (New-Object System.Security.Principal.NTAccount("$rootDomainName\Enterprise Admins")).Translate([System.Security.Principal.SecurityIdentifier]).Value
        $requiredSids += "*$enterpriseAdminsSid"
    }
    catch {
        Write-Warning "Could not resolve Enterprise Admins SID."
    }

    # Local account
    $requiredSids += "*S-1-5-113"
}

# Export current user rights assignment
secedit /export /areas USER_RIGHTS /cfg $exportPath | Out-Null

$currentContent = Get-Content -Path $exportPath

$currentLine = $currentContent | Where-Object { $_ -match "^$userRight\s*=" }

if ($currentLine) {
    $existingSids = ($currentLine -split "=")[1].Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ }
}
else {
    $existingSids = @()
}

$finalSids = @($existingSids + $requiredSids) | Sort-Object -Unique
$newLine = "$userRight = $($finalSids -join ',')"

if ($currentLine) {
    $updatedContent = $currentContent -replace "^$userRight\s*=.*", $newLine
}
else {
    $updatedContent = $currentContent + $newLine
}

$updatedContent | Set-Content -Path $importPath -Encoding Unicode

# Import updated security policy
secedit /configure /db $databasePath /cfg $importPath /areas USER_RIGHTS | Out-Null

gpupdate /force | Out-Null

Write-Output "✅ 'Deny access to this computer from the network' has been configured. (STIG: WN11-UR-000070)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN11-UR-000070              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title
  The 'Deny access to this computer from the network' user right on
  workstations must be configured to prevent access from highly
  privileged domain accounts and local accounts on domain systems
  and unauthenticated access on all systems.

■ STIG ID
  WN11-UR-000070

■ Description
  Prevents specified accounts and groups from accessing the workstation
  over the network. This helps reduce exposure from highly privileged
  domain accounts, local accounts on domain systems, and unauthenticated
  access.

■ Remediation Details
  • User Right         : SeDenyNetworkLogonRight
  • Policy Name        : Deny access to this computer from the network

  Required on all systems:
  • Guests             : S-1-5-32-546

  Required on domain systems:
  • Enterprise Admins  : Domain-specific SID ending in -519
  • Domain Admins      : Domain-specific SID ending in -512
  • Local account      : S-1-5-113

■ Script Logic

    Exports the current local security policy using secedit.

    Checks whether the workstation is domain joined.

    Adds the required Guests SID on all systems.

    Adds Enterprise Admins, Domain Admins, and Local account on
    domain-joined systems.

    Preserves existing assignments and imports the updated policy.

■ Compliance Result
  ✅ The required accounts and groups are configured for
  'Deny access to this computer from the network' and the workstation
  is compliant with the STIG.

#>
