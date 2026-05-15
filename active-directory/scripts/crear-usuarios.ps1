# Crear grupos de seguridad primero
New-ADGroup -Name "TI-Team" -GroupScope Global -Path "OU=TI,DC=corp,DC=martinlab,DC=local"
New-ADGroup -Name "Ventas-Team" -GroupScope Global -Path "OU=Ventas,DC=corp,DC=martinlab,DC=local"
New-ADGroup -Name "Administracion-Team" -GroupScope Global -Path "OU=Administracion,DC=corp,DC=martinlab,DC=local"

# Lista de usuarios ficticios
$usuarios = @(
    @{Nombre="Carlos";Apellido="Garcia";OU="TI";Grupo="TI-Team"},
    @{Nombre="Maria";Apellido="Lopez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Juan";Apellido="Martinez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Laura";Apellido="Rodriguez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Diego";Apellido="Fernandez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Sofia";Apellido="Gonzalez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Lucas";Apellido="Perez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Valentina";Apellido="Sanchez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Matias";Apellido="Ramirez";OU="TI";Grupo="TI-Team"},
    @{Nombre="Camila";Apellido="Torres";OU="TI";Grupo="TI-Team"},
    @{Nombre="Andres";Apellido="Flores";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Florencia";Apellido="Diaz";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Sebastian";Apellido="Moreno";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Natalia";Apellido="Alvarez";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Facundo";Apellido="Romero";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Agustina";Apellido="Herrera";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Gonzalo";Apellido="Medina";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Lucia";Apellido="Castro";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Nicolas";Apellido="Ortiz";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Micaela";Apellido="Gutierrez";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Pablo";Apellido="Vargas";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Romina";Apellido="Ruiz";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Ezequiel";Apellido="Jimenez";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Gabriela";Apellido="Morales";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Ignacio";Apellido="Reyes";OU="Ventas";Grupo="Ventas-Team"},
    @{Nombre="Mariana";Apellido="Cruz";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Roberto";Apellido="Vega";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Claudia";Apellido="Mendoza";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Fernando";Apellido="Rios";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Patricia";Apellido="Soto";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Ricardo";Apellido="Pena";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Monica";Apellido="Cabrera";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Eduardo";Apellido="Suarez";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Silvia";Apellido="Molina";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Hector";Apellido="Silva";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Adriana";Apellido="Rojas";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Jorge";Apellido="Nunez";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Graciela";Apellido="Acosta";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Miguel";Apellido="Delgado";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Susana";Apellido="Mendez";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Ramon";Apellido="Guerrero";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Elena";Apellido="Navarro";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Oscar";Apellido="Ramos";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Alicia";Apellido="Espinoza";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Victor";Apellido="Contreras";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Rosa";Apellido="Ibarra";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Alberto";Apellido="Fuentes";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Carmen";Apellido="Aguilar";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Mario";Apellido="Campos";OU="Administracion";Grupo="Administracion-Team"},
    @{Nombre="Teresa";Apellido="Parra";OU="Administracion";Grupo="Administracion-Team"}
)

# Crear cada usuario
$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force

foreach ($u in $usuarios) {
    $username = ($u.Nombre.Substring(0,1) + $u.Apellido).ToLower()
    $ouPath = "OU=$($u.OU),DC=corp,DC=martinlab,DC=local"
    
    New-ADUser `
        -Name "$($u.Nombre) $($u.Apellido)" `
        -GivenName $u.Nombre `
        -Surname $u.Apellido `
        -SamAccountName $username `
        -UserPrincipalName "$username@corp.martinlab.local" `
        -Path $ouPath `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    Add-ADGroupMember -Identity $u.Grupo -Members $username
    Write-Host "Creado: $username en $($u.OU)" -ForegroundColor Green
}

Write-Host "`n✓ 50 usuarios creados exitosamente." -ForegroundColor Cyan
