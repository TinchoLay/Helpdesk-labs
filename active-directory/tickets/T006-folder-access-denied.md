# T006 — Folder Access Denied

## Scenario
A Ventas user reports they cannot access a shared folder. Permissions need to be audited.

## Resolution

### Check Share permissions
```powershell
Get-SmbShareAccess -Name "TI"
```

### Check NTFS permissions
```powershell
icacls "C:\Shares\TI"
```

### Add read access if needed
```powershell
$acl = Get-Acl "C:\Shares\TI"
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "CORP\Ventas-Team", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow"
)
$acl.AddAccessRule($rule)
Set-Acl "C:\Shares\TI" $acl
```

## Key concept
Share permissions and NTFS permissions are independent. The most restrictive one applies.

## Time to resolve
~10 minutes
