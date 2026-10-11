# Matriz de validación — Infraestructura #2

| Prueba | Resultado esperado | Resultado observado | Evidencia |
|---|---|---|---|
| Topología final | Todos los componentes conectados | Correcto | `01-topologia-final.png` |
| Políticas FortiGate | Reglas por perfil, Jump, Web y VPN | Correcto | `02-fortigate-politicas-finales.png` |
| VPN IPsec | Túnel `VPN-REMOTE-2174` activo | Correcto | `04-vpn-ipsec-tunnel-activo.png` |
| VPN → Jump | Acceso permitido | Correcto | `05-vpn-validacion-jump-web.png` |
| VPN → Web directo | Acceso bloqueado | Correcto (`No route to host`) | `05-vpn-validacion-jump-web.png` |
| USER-SIN-PRIV → Jump HTTPS | Permitido | Correcto | `12-user1-restricciones.png` |
| USER-SIN-PRIV → SSH/RDP directo | Restringido | Sin sesión | `12-user1-restricciones.png` |
| USER-PRIV → Jump HTTPS/RDP | Permitido | Correcto | `13-user2-permisos.png` |
| USER-PRIV → SSH directo | Restringido | Sin sesión | `13-user2-permisos.png` |
| RD Web clásico / sin privilegios | Solo navegador Web | Correcto | `06-rdweb-user-sin-priv.png` |
| RD Web clásico / privilegiado | Web + PuTTY + RDP | Correcto | `07-rdweb-user-priv.png` |
| RD Web Client HTML5 | Publicado | Correcto | `08-webclient-html5-publicado.png` |
| HTML5 / sin privilegios | Solo navegador Web | Correcto | `09-html5-user-sin-priv.png` |
| HTML5 / privilegiado | Web + PuTTY + RDP | Correcto | `10-html5-user-priv.png` |
| Jump → Web RDP | XRDP accesible en 3389 | Correcto | `11-rdp-jump-web-xrdp.png` |
| Jump → Web TCP/80 | Bloqueado | `TcpTestSucceeded: False` | `14-jump-web-http80-bloqueado.png` |
| Switch | VLANs, trunk y puertos no usados asegurados | Correcto | `16-switch-status-final.png` |
| ISP | Ruta final limpia | Correcto | `15-isp-routing-final.png` |

## Nota sobre servicios Jump → Web

La política `JUMP-TO-WEB-ALLOWED` autoriza únicamente:

- HTTPS — TCP/443
- RDP — TCP/3389
- SSH — TCP/22

La prueba de TCP/80 falla, confirmando que no existe una regla amplia de acceso entre ambos segmentos.
