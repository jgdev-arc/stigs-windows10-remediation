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
STIG-ID         : WN10-CC-000030

#>

# Disable ICMP redirects from overriding OSPF routes
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$propertyName = "EnableICMPRedirect"
$desiredValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue -PropertyType DWord -Force | Out-Null

Write-Output "✅ ICMP redirects are now disabled. (STIG: WN10-CC-000030)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000030              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  The system must be configured to prevent ICMP redirects from overriding OSPF routes

■ STIG ID  
  WN10-CC-000030

■ Description  
  Prevents attackers from using ICMP redirect packets to manipulate local routing
  tables and override legitimate OSPF-learned routes.

■ Remediation Details  
  • Registry Path : HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters  
  • Value Name    : EnableICMPRedirect  
  • Value Type    : REG_DWORD  
  • Required Value: 0 (Disabled)

■ Script Logic  

    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    $propertyName = "EnableICMPRedirect"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $propertyName -Value $desiredValue `
                     -PropertyType DWord -Force | Out-Null

■ Compliance Result  
  ✅ ICMP redirects are disabled and the system is compliant with the STIG.

#>
