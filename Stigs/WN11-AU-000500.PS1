<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Tywin Kalandyk
    LinkedIn        : linkedin.com/in/tywin-kalandyk/
    GitHub          : github.com/tkalandyk
    Date Created    : 2026-01-08
    Last Modified   : 2026-01-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Create the key if it doesn't exist
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' -Force | Out-Null

# Set MaxSize DWORD to 0x8000 (hex) = 32768 hexadecimal
Set-ItemProperty `
  -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' `
  -Name 'MaxSize' `
  -Value 0x8000 `
  -Type DWord
