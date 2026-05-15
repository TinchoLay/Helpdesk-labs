# T002 — Password Reset

## Scenario
User Maria Lopez (mlopez) forgot her password and cannot log in.

## Resolution

### Reset password and force change at next logon
```powershell
$newPass = ConvertTo-SecureString "NuevoPass123!" -AsPlainText -Force
Set-ADAccountPassword -Identity "mlopez" -NewPassword $newPass -Reset
Set-ADUser -Identity "mlopez" -ChangePasswordAtLogon $true
```

### Verify
```powershell
Get-ADUser -Identity "mlopez" -Properties PasswordLastSet, PasswordExpired |
    Select-Object Name, PasswordLastSet, PasswordExpired
```

## Time to resolve
~3 minutes
