# T001 — Locked Out User

## Scenario
User Carlos Garcia (cgarcia) is unable to log in after multiple failed attempts.

## Cause
Account locked out after 5 failed login attempts (Account Lockout Policy threshold).

## Resolution

### 1. Identify locked accounts
```powershell
Search-ADAccount -LockedOut | Select-Object Name, SamAccountName, LockedOut
```

### 2. Investigate in Event Viewer
```powershell
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 5 |
    Select-Object TimeCreated, @{N="Usuario";E={$_.Properties[5].Value}} |
    Format-Table -AutoSize
```

### 3. Unlock account
```powershell
Unlock-ADAccount -Identity "cgarcia"
```

## Events referenced
- **4625** — Failed login attempt
- **4740** — Account lockout

## Time to resolve
~5 minutes
