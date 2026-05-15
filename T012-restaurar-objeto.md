# T012 — Restore Deleted Object

## Scenario
A user account was accidentally deleted by an admin. Account must be restored without data loss.

## Resolution

### Find object in Recycle Bin
```powershell
$eliminado = Get-ADObject -Filter {SAMAccountName -eq "fflorencia"} `
    -IncludeDeletedObjects `
    -Properties *
```

### Restore object
```powershell
Restore-ADObject -Identity $eliminado.ObjectGUID
```

### Verify restoration
```powershell
Get-ADUser -Identity "fflorencia" -Properties Enabled, LastLogonDate |
    Select-Object Name, SamAccountName, Enabled
```

## Prerequisite
AD Recycle Bin must be enabled before deletion occurs. Enabled during initial domain setup.

## Time to resolve
~5 minutes
