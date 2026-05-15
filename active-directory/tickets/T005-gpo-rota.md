# T005 — Broken GPO

## Scenario
Ventas department users report they cannot open Control Panel after a policy was applied.

## Cause
GPO "Bloqueo-Panel-Control" was linked to the Ventas OU with NoControlPanel registry value set to 1.

## Resolution

### Diagnose applied GPOs
```powershell
gpresult /R /SCOPE USER
```

### Revert the policy
```powershell
Set-GPRegistryValue -Name "Bloqueo-Panel-Control" `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -ValueName "NoControlPanel" `
    -Type DWord `
    -Value 0
```

### Force policy refresh on affected machines
```powershell
gpupdate /force
```

## Time to resolve
~10 minutes
