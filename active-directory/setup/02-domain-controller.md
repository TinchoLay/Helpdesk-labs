# 02 — Domain Controller Configuration
## Goal
Promote the Windows Server VM to a Domain Controller for domain `corp.martinlab.local`.

## Steps

### 1. Install AD DS role
```powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

### 2. Promote to Domain Controller
```powershell
Install-ADDSForest `
    -DomainName "corp.martinlab.local" `
    -DomainNetbiosName "CORP" `
    -ForestMode "WinThreshold" `
    -DomainMode "WinThreshold" `
    -InstallDns:$true `
    -Force:$true
```

Set a strong SafeModeAdministratorPassword when prompted. The VM will reboot automatically.

### 3. Verify
```powershell
Get-ADDomain | Select-Object DNSRoot, NetBIOSName, DomainMode
```

## Result
| Property | Value |
|---|---|
| Domain | corp.martinlab.local |
| NetBIOS | CORP |
| DC Name | dc01-Martinlab |
| DNS | Integrated with AD |
