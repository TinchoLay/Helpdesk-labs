# T011 — Full AD Audit

## Scenario
Monthly audit requested by management. Need to identify inactive users, expired passwords and disabled accounts.

## Resolution

```powershell
$outputPath = "C:\Auditoria"
New-Item -Path $outputPath -ItemType Directory -Force | Out-Null

# Inactive users (90+ days)
Get-ADUser -Filter {LastLogonDate -lt (Get-Date).AddDays(-90) -and Enabled -eq $true} `
    -Properties LastLogonDate, PasswordLastSet, Department |
    Select-Object Name, SamAccountName, LastLogonDate, Department |
    Export-Csv "$outputPath\usuarios-inactivos.csv" -NoTypeInformation

# Expired passwords
Get-ADUser -Filter {PasswordExpired -eq $true} `
    -Properties PasswordExpired, PasswordLastSet |
    Select-Object Name, SamAccountName, PasswordLastSet |
    Export-Csv "$outputPath\passwords-expirados.csv" -NoTypeInformation

# Disabled accounts
Get-ADUser -Filter {Enabled -eq $false} `
    -Properties LastLogonDate |
    Select-Object Name, SamAccountName, LastLogonDate |
    Export-Csv "$outputPath\cuentas-deshabilitadas.csv" -NoTypeInformation
```

## Output
3 CSV reports exported to C:\Auditoria\

## Time to resolve
~10 minutes
