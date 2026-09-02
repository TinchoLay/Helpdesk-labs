# 🖥️ Helpdesk Labs

**[Español](#español) | [English](#english)**

---

## Español

Este es un laboratorio de soporte IT que armé en Azure para practicar y mostrar trabajo real de administración de Active Directory. Levanté un entorno con 50 usuarios, políticas de grupo y resolución de tickets, tal como se ve en una empresa mediana.

La idea no es una demo de juguete: los 12 tickets que resolví simulan problemas que un técnico N1/N2 tiene que atender en el día a día, desde un usuario bloqueado hasta un GPO roto que hay que diagnosticar con gpresult.

### Entorno

| Componente | Detalle |
|---|---|
| Nube | Microsoft Azure |
| Servidor | Windows Server 2022 Datacenter Azure Edition |
| Tamaño de VM | Standard B2s_v2 (2 vCPU, 8 GiB RAM) |
| Dominio | corp.martinlab.local |
| Usuarios | 50 (TI, Ventas, Administración) |
| Controlador de dominio | dc01-Martinlab |

### Estructura del repositorio

```
helpdesk-labs/
└── active-directory/
    ├── setup/          # Guía paso a paso del despliegue del DC
    ├── tickets/        # 12 tickets de soporte resueltos (N1/N2)
    ├── scripts/        # Scripts de automatización en PowerShell
    └── screenshots/    # Capturas de cada ejercicio
```

### Tickets resueltos

| ID | Título | Nivel | Habilidades |
|---|---|---|---|
| T001 | Usuario bloqueado — investigación y desbloqueo | N1 | Visor de eventos, AD |
| T002 | Reseteo de contraseña + cambio forzado en el próximo login | N1 | Usuarios de AD |
| T003 | Alta de usuario nuevo — OU, grupos, puesto | N1 | AD, OUs |
| T004 | Cuenta vencida — extensión y revisión de política | N1 | AD, política de contraseñas |
| T005 | GPO roto — diagnóstico con gpresult y reversión | N2 | GPO, registro |
| T006 | Acceso denegado a carpeta — auditoría NTFS vs recurso compartido | N2 | NTFS, SMB |
| T007 | Delegación de control — permisos restringidos para técnico junior | N2 | ACLs de AD |
| T008 | Login lento — mala configuración de script de inicio por GPO | N2 | GPO, SYSVOL |
| T009 | Detección de login fuera de horario — análisis de logs de eventos | N2 | Eventos de seguridad |
| T010 | Simulación de fuerza bruta — respuesta a política de bloqueo | N2 | Seguridad, AD |
| T011 | Auditoría completa de AD — usuarios inactivos, contraseñas vencidas | N2 | PowerShell |
| T012 | Borrado accidental — recuperación con la papelera de reciclaje de AD | N2 | Recuperación de AD |

### Scripts

| Script | Descripción |
|---|---|
| `crear-usuarios.ps1` | Crea 50 usuarios en lote, distribuidos en OUs y grupos |
| `auditoria-cuentas.ps1` | Exporta a CSV las cuentas inactivas, deshabilitadas y vencidas |
| `lockout-report.ps1` | Consulta el log de seguridad para eventos de bloqueo (4625, 4740) |

### Guía de instalación

La carpeta [`active-directory/setup/`](active-directory/setup/) tiene el paso a paso:

1. [Despliegue de la VM en Azure](active-directory/setup/01-vm-azure.md)
2. [Configuración del controlador de dominio](active-directory/setup/02-domain-controller.md)
3. [Usuarios, OUs y GPOs](active-directory/setup/03-usuarios-gpos.md)

### Autor

**Martín** — Soporte IT | Entusiasta de ciberseguridad
[LinkedIn](https://www.linkedin.com/in/martin-chancalay-902b543a8) · [GitHub](https://github.com/TinchoLay)

---

## English

This is an IT support lab I built on Azure to practice and showcase real Active Directory administration work. I set up an environment with 50 users, group policies, and ticket resolution, modeled after what you'd see in a mid-sized company.

It's not a toy demo: the 12 tickets I resolved simulate the kind of problems an N1/N2 technician actually deals with day to day, from a locked-out user to a broken GPO that needs to be diagnosed with gpresult.

### Environment

| Component | Detail |
|---|---|
| Cloud | Microsoft Azure |
| Server | Windows Server 2022 Datacenter Azure Edition |
| VM Size | Standard B2s_v2 (2 vCPU, 8 GiB RAM) |
| Domain | corp.martinlab.local |
| Users | 50 (IT, Sales, Administration) |
| Domain Controller | dc01-Martinlab |

### Repository structure

```
helpdesk-labs/
└── active-directory/
    ├── setup/          # Step-by-step DC deployment guide
    ├── tickets/        # 12 resolved support tickets (N1/N2)
    ├── scripts/        # PowerShell automation scripts
    └── screenshots/    # Screenshots of each exercise
```

### Tickets resolved

| ID | Title | Level | Skills |
|---|---|---|---|
| T001 | Locked-out user — investigation and unlock | N1 | Event Viewer, AD |
| T002 | Password reset + force change at next logon | N1 | AD Users |
| T003 | New user onboarding — OU, groups, job title | N1 | AD, OUs |
| T004 | Expired account — extension and policy review | N1 | AD, password policy |
| T005 | Broken GPO — diagnosed with gpresult and reverted | N2 | GPO, registry |
| T006 | Folder access denied — NTFS vs. share audit | N2 | NTFS, SMB |
| T007 | Delegated control — restricted rights for a junior technician | N2 | AD ACLs |
| T008 | Slow login — startup script GPO misconfiguration | N2 | GPO, SYSVOL |
| T009 | After-hours login detection — event log analysis | N2 | Security events |
| T010 | Brute-force simulation — lockout policy response | N2 | Security, AD |
| T011 | Full AD audit — inactive users, expired passwords | N2 | PowerShell |
| T012 | Accidental deletion — restored via AD Recycle Bin | N2 | AD recovery |

### Scripts

| Script | Description |
|---|---|
| `crear-usuarios.ps1` | Bulk-creates 50 users across OUs and groups |
| `auditoria-cuentas.ps1` | Exports inactive, disabled, and expired accounts to CSV |
| `lockout-report.ps1` | Queries the security event log for lockout events (4625, 4740) |

### Setup guide

See [`active-directory/setup/`](active-directory/setup/) for the step-by-step deployment:

1. [VM deployment on Azure](active-directory/setup/01-vm-azure.md)
2. [Domain Controller configuration](active-directory/setup/02-domain-controller.md)
3. [Users, OUs, and GPOs](active-directory/setup/03-usuarios-gpos.md)

### Author

**Martín** — IT Support | Cybersecurity enthusiast
[LinkedIn](https://www.linkedin.com/in/martin-chancalay-902b543a8) · [GitHub](https://github.com/TinchoLay)
