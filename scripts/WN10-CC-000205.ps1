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
STIG-ID         : WN10-CC-000205

#>

# Set Windows telemetry to Security (0) to prevent Full data collection
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$propertyName = "AllowTelemetry"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ Windows telemetry has been restricted to Security level. (STIG: WN10-CC-000205)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000205              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  Windows Telemetry must not be configured to Full

■ STIG ID  
  WN10-CC-000205

■ Description  
  Limits diagnostic data collection to the minimum (Security level),
  preventing excessive telemetry from being sent to Microsoft.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection  
  • Value Name    : AllowTelemetry  
  • Value Type    : REG_DWORD  
  • Required Value: 0 (Security)

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
    $propertyName = "AllowTelemetry"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ Telemetry is now set to Security level and is compliant with the STIG.

#>
