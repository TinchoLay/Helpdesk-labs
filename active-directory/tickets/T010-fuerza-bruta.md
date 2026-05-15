# T010 — Brute Force Simulation

## Scenario
Multiple accounts show repeated failed login attempts in a short timeframe, suggesting a brute force attack.

## Resolution

### Detect all locked accounts
```powershell
Search-ADAccount -LockedOut | Select-Object Name, SamAccountName, LockedOut | Format-Table -AutoSize
```

### Unlock all affected accounts
```powershell
Search-ADAccount -LockedOut | Unlock-ADAccount
```

### Review lockout policy
```powershell
Get-ADDefaultDomainPasswordPolicy |
    Select-Object LockoutThreshold, LockoutDuration, LockoutObservationWindow
```

## Mitigation
Account Lockout Policy set to 5 attempts / 30 min lockout prevented further unauthorized access.

## Time to resolve
~15 minutes
