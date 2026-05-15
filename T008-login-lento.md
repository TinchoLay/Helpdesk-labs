# T008 — Slow Login

## Scenario
Ventas users report very slow logins. Issue started after a new GPO was applied.

## Cause
GPO "Script-Inicio-Lento" contained a startup script with a 30-second delay linked to the Ventas OU.

## Resolution

### Diagnose with gpresult
```powershell
gpresult /H "C:\gpresult.html"
Start-Process "C:\gpresult.html"
```

### Identify linked GPOs
```powershell
Get-GPInheritance -Target "OU=Ventas,DC=corp,DC=martinlab,DC=local" |
    Select-Object -ExpandProperty GpoLinks
```

### Remove problematic GPO link
```powershell
Remove-GPLink -Name "Script-Inicio-Lento" -Target "OU=Ventas,DC=corp,DC=martinlab,DC=local"
```

## Time to resolve
~15 minutes
