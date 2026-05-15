<#
.SYNOPSIS
    Account Lockout Report
.DESCRIPTION
    Queries Security Event Log for failed logins (4625) and lockout events (4740).
.AUTHOR
    Martin - github.com/TinchoLay
#>

Write-Host "=== LOCKOUT REPORT ===" -ForegroundColor Cyan

# Eventos de login fallido (4625)
Write-Host "`nFailed login attempts (Event 4625):" -ForegroundColor Yellow
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 20 -ErrorAction SilentlyContinue |
    Select-Object TimeCreated,
    @{N="Usuario";E={$_.Properties[5].Value}},
    @{N="Workstation";E={$_.Properties[13].Value}},
    @{N="IP";E={$_.Properties[19].Value}} |
    Format-Table -AutoSize

# Eventos de lockout (4740)
Write-Host "`nAccount lockout events (Event 4740):" -ForegroundColor Red
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4740} -MaxEvents 20 -ErrorAction SilentlyContinue |
    Select-Object TimeCreated,
    @{N="Usuario";E={$_.Properties[0].Value}},
    @{N="Locked by";E={$_.Properties[1].Value}} |
    Format-Table -AutoSize

# Cuentas actualmente bloqueadas
Write-Host "`nCurrently locked accounts:" -ForegroundColor Red
Search-ADAccount -LockedOut | Select-Object Name, SamAccountName, LockedOut | Format-Table -AutoSize
