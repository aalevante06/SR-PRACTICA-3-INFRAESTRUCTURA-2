# RDS / RemoteApp — JUMP-SERVER-2174

El Jump Server utiliza Windows Server con el dominio de laboratorio `infra2.local` y una colección RDS denominada `QuickSessionCollection`.

## Perfiles de acceso

- `USER-SIN-PRIV` pertenece al grupo `RDS-SIN-PRIV` y recibe únicamente el navegador Web publicado.
- `USER-PRIV` pertenece al grupo `RDS-PRIV` y recibe navegador Web, PuTTY y Remote Desktop Connection.

## Aplicaciones publicadas

| Aplicación | Uso |
|---|---|
| Internet Explorer | Acceso al servicio Web desde el Jump Server |
| PuTTY | Administración SSH desde el Jump Server hacia el Web Server |
| Remote Desktop Connection | RDP desde el Jump Server hacia el Web Server |

## RD Web Access

Se validaron dos modalidades:

1. RD Web Access clásico (`/RDWeb`).
2. Remote Desktop Web Client HTML5 (`/RDWeb/webclient/`).

El laboratorio utiliza certificados autofirmados, por lo que el navegador puede mostrar una advertencia de confianza. El certificado se aplicó a los roles RDS y se importó en el RD Web Client.

## Web Server

`WEB-SV-2174` utiliza Ubuntu en `10.21.75.10/29`. El servicio HTTPS expone la página funcional del servidor Apache usada como endpoint del **Sistema de Caja** y XRDP habilita RDP en TCP/3389 para la demostración desde el Jump Server.
