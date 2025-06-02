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
STIG-ID         : WN10-CC-000360

#>

# Disable Digest authentication for the WinRM client
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$propertyName = "AllowDigest"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ WinRM client Digest authentication has been disabled. (STIG: WN10-CC-000360)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000360              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The Windows Remote Management (WinRM) client must not use Digest authentication

■ STIG ID  
  WN10-CC-000360

■ Description  
  Digest authentication is considered insecure. Disabling it reduces
  the risk of credential compromise through interception or replay.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client  
  • Value Name    : AllowDigest  
  • Value Type    : REG_DWORD  
  • Required Value: 0

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
    $propertyName = "AllowDigest"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Digest authentication is now disabled and compliant with the STIG.

#>
