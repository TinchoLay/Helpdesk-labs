# 🖥️ Helpdesk Labs

Hands-on IT support lab built on Azure. Simulates a real corporate environment with 50 users, Active Directory, Group Policies, and a ticketing system. Built to demonstrate N1/N2 helpdesk skills in a reproducible, documented way.

---

## 🏗️ Environment

| Component | Detail |
|---|---|
| Cloud | Microsoft Azure |
| Server | Windows Server 2022 Datacenter Azure Edition |
| VM Size | Standard B2s_v2 (2 vCPU, 8 GiB RAM) |
| Domain | corp.martinlab.local |
| Users | 50 (TI, Ventas, Administración) |
| DC | dc01-Martinlab |

---

## 📁 Structure
helpdesk-labs/
└── active-directory/
├── setup/          # Step-by-step DC deployment on Azure
├── tickets/        # 12 resolved support tickets (N1/N2)
├── scripts/        # PowerShell automation scripts
└── screenshots/    # Evidence of each lab exercise

---

## 🎫 Tickets Resolved

| ID | Title | Level | Skills |
|---|---|---|---|
| T001 | Locked out user — investigation & unlock | N1 | Event Viewer, AD |
| T002 | Password reset + force change at logon | N1 | AD Users |
| T003 | New user onboarding — OU, groups, title | N1 | AD, OUs |
| T004 | Expired account — extend + policy review | N1 | AD, Password Policy |
| T005 | Broken GPO — diagnose with gpresult & revert | N2 | GPO, Registry |
| T006 | Folder access denied — NTFS vs Share audit | N2 | NTFS, SMB |
| T007 | Control delegation — junior tech restricted rights | N2 | AD ACLs |
| T008 | Slow login — startup script GPO misconfiguration | N2 | GPO, SYSVOL |
| T009 | After-hours login detection — Event Log analysis | N2 | Security Events |
| T010 | Brute force simulation — lockout policy response | N2 | Security, AD |
| T011 | Full AD audit — inactive users, expired passwords | N2 | PowerShell |
| T012 | Accidental deletion — restore via AD Recycle Bin | N2 | AD Recovery |

---

## ⚙️ Scripts

| Script | Description |
|---|---|
| `crear-usuarios.ps1` | Bulk creation of 50 users across OUs and groups |
| `auditoria-cuentas.ps1` | Export inactive, disabled and expired accounts to CSV |
| `lockout-report.ps1` | Query Security Event Log for lockout events (4625, 4740) |

---

## 🔧 Setup Guide

See [`active-directory/setup/`](active-directory/setup/) for step-by-step deployment:
1. [VM deployment on Azure](active-directory/setup/01-vm-azure.md)
2. [Domain Controller configuration](active-directory/setup/02-domain-controller.md)
3. [Users, OUs and GPOs](active-directory/setup/03-usuarios-gpos.md)

---

## 👤 Author

**Martín Layún** — IT Support | Cybersecurity enthusiast  
[LinkedIn](www.linkedin.com/in/martin-chancalay-902b543a8) · [GitHub](https://github.com/TinchoLay)
