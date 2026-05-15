# T004 — Expired Account

## Scenario
User Rosa Ibarra (ribarra) cannot log in. Account expiration date has passed.

## Resolution

### Verify expiration
```powershell
Get-ADUser -Identity "rrojas" -Properties AccountExpirationDate, Enabled |
    Select-Object Name, AccountExpirationDate, Enabled
```

### Extend account for 1 year
```powershell
Set-ADAccountExpiration -Identity "rrojas" -DateTime (Get-Date).AddYears(1)
```

## Time to resolve
~3 minutes
