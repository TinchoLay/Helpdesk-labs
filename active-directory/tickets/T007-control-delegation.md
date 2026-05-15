# T007 — Control Delegation

## Scenario
Junior technician mlayun needs to reset passwords for Ventas users without full admin rights.

## Resolution

### Delegate password reset rights on Ventas OU
```powershell
$ou = "OU=Ventas,DC=corp,DC=martinlab,DC=local"
$user = Get-ADUser "mlayun"
$guidResetPassword = [GUID]"00299570-246d-11d0-a768-00aa006e0529"

$acl = Get-Acl "AD:\$ou"
$rule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule(
    $user.SID,
    "ExtendedRight",
    "Allow",
    $guidResetPassword,
    "Descendents",
    ([GUID]"bf967aba-0de6-11d0-a285-00aa003049e2")
)
$acl.AddAccessRule($rule)
Set-Acl "AD:\$ou" $acl
```

## Result
mlayun can reset passwords for Ventas users only. No other admin rights granted.

## Time to resolve
~15 minutes
