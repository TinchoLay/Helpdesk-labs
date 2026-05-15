# 03 — Users, OUs and GPOs
## Goal
Build the corporate structure: Organizational Units, 50 users and security groups.

## Organizational Units
```powershell
New-ADOrganizationalUnit -Name "TI" -Path "DC=corp,DC=martinlab,DC=local"
New-ADOrganizationalUnit -Name "Ventas" -Path "DC=corp,DC=martinlab,DC=local"
New-ADOrganizationalUnit -Name "Administracion" -Path "DC=corp,DC=martinlab,DC=local"
```

## Users
50 users created via PowerShell across 3 departments.

| Department | Users | Group |
|---|---|---|
| TI | 10 | TI-Team |
| Ventas | 25 | Ventas-Team |
| Administración | 15 | Administracion-Team |

## Policies applied
- Account lockout: 5 failed attempts → 30 min lockout
- Password minimum length: 8 characters
- AD Recycle Bin: enabled
- Audit policy: logon, lockout, account management, directory changes
