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
STIG-ID         : WN10-CC-000327

#>

# Enable PowerShell transcription with output directed to C:\Transcripts
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$enableKey = "EnableTranscripting"
$outputKey = "OutputDirectory"
$logPath = "C:\Transcripts"
$desiredValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name $enableKey -Value $desiredValue -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $regPath -Name $outputKey -Value $logPath -PropertyType String -Force | Out-Null

Write-Output "✅ PowerShell transcription has been enabled. Logs will be saved to: $logPath (STIG: WN10-CC-000327)"


<#
╔════════════════════════════════════════════════════════════════╗
║        STIG REMEDIATION SUMMARY – WN10-CC-000327              ║
╚════════════════════════════════════════════════════════════════╝

■ Rule Title  
  PowerShell Transcription must be enabled on Windows 10

■ STIG ID  
  WN10-CC-000327

■ Description  
  Enables detailed logging of PowerShell activity to assist with audit,
  forensic, and compliance efforts.

■ Remediation Details  
  • Registry Path : HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription  
  • Value Name    : EnableTranscripting = 1  
  • Value Name    : OutputDirectory = C:\Transcripts  
  • Value Types   : REG_DWORD, REG_SZ

■ Script Logic  

    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
    $enableKey = "EnableTranscripting"
    $outputKey = "OutputDirectory"
    $logPath = "C:\Transcripts"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    New-ItemProperty -Path $regPath -Name $enableKey -Value $desiredValue -PropertyType DWord -Force | Out-Null
    New-ItemProperty -Path $regPath -Name $outputKey -Value $logPath -PropertyType String -Force | Out-Null

■ Compliance Result  
  ✅ PowerShell transcription is now active and logging to C:\Transcripts

#>
