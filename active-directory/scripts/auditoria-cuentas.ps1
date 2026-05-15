<#
.SYNOPSIS
    AD Account Audit Script
.DESCRIPTION
    Exports inactive users, expired passwords and disabled accounts to CSV.
.AUTHOR
    Martin - github.com/TinchoLay
#>

$outputPath = "C:\Auditoria"
New-Item -Path $outputPath -ItemType Directory -Force | Out-Null

# Usuarios inactivos hace más de 90 días
$fechaCorte = (Get-Date).AddDays(-90)
Get-ADUser -Filter {LastLogonDate -lt $fechaCorte -and Enabled -eq $true} `
    -Properties LastLogonDate, PasswordLastSet, Department |
    Select-Object Name, SamAccountName, LastLogonDate, PasswordLastSet, Department |
    Export-Csv "$outputPath\usuarios-inactivos.csv" -NoTypeInformation

# Passwords expirados
Get-ADUser -Filter {PasswordExpired -eq $true} `
    -Properties PasswordExpired, PasswordLastSet |
    Select-Object Name, SamAccountName, PasswordLastSet |
    Export-Csv "$outputPath\passwords-expirados.csv" -NoTypeInformation

# Cuentas deshabilitadas
Get-ADUser -Filter {Enabled -eq $false} `
    -Properties LastLogonDate |
    Select-Object Name, SamAccountName, LastLogonDate |
    Export-Csv "$outputPath\cuentas-deshabilitadas.csv" -NoTypeInformation

Write-Host "=== REPORTE DE AUDITORIA ===" -ForegroundColor Cyan
Write-Host "Reportes exportados en $outputPath" -ForegroundColor Green
