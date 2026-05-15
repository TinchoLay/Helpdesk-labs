# T003 — New User Onboarding

## Scenario
New employee joining the TI department. Account must be created in the correct OU with proper group membership.

## Resolution

### Create user
```powershell
$pass = ConvertTo-SecureString "Password123!" -AsPlainText -Force
New-ADUser `
    -Name "Martin Layun" `
    -GivenName "Martin" `
    -Surname "Layun" `
    -SamAccountName "mlayun" `
    -UserPrincipalName "mlayun@corp.martinlab.local" `
    -Path "OU=TI,DC=corp,DC=martinlab,DC=local" `
    -AccountPassword $pass `
    -Enabled $true `
    -ChangePasswordAtLogon $true `
    -Title "IT Support N1" `
    -Department "TI"
```

### Assign to group
```powershell
Add-ADGroupMember -Identity "TI-Team" -Members "mlayun"
```

## Time to resolve
~5 minutes
