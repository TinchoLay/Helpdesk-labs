# T009 — After-Hours Login Detection

## Scenario
Security team suspects a user account is being accessed outside business hours.

## Resolution

### Configure logon hours restriction
```powershell
$hours = New-Object byte[] 21
0..20 | ForEach-Object { $hours[$_] = 0 }
$hours[3] = 252
$hours[6] = 252
$hours[9] = 252
$hours[12] = 252
$hours[15] = 252
Set-ADUser -Identity "cgarcia" -LogonHours $hours
```

### Query Security Event Log for failed logins
```powershell
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 10 |
    Select-Object TimeCreated,
    @{N="Usuario";E={$_.Properties[5].Value}},
    @{N="Motivo";E={$_.Properties[8].Value}} |
    Format-Table -AutoSize
```

## Events referenced
- **4625** — Failed logon (includes reason code for after-hours restriction)

## Time to resolve
~20 minutes
