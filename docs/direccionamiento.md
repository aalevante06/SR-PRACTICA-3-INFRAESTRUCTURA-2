# Plan de direccionamiento — Infraestructura #2

| Equipo / segmento | Interfaz / función | Dirección / red |
|---|---|---|
| NAT1 | Salida a Internet de GNS3 | DHCP / red VMware NAT |
| ISP-2174 | Fa0/0 hacia NAT1 | DHCP (`192.168.136.129` observado) |
| ISP-2174 | Fa1/0 hacia FG-2174 | `21.74.3.1/30` |
| FG-2174 | WAN-ISP / port1 | `21.74.3.2/30` |
| ISP-2174 | Fa1/1 hacia VPN-CLIENT-2174 | `21.74.4.1/30` |
| VPN-CLIENT-2174 | e0 / ens3 | `21.74.4.2/30` |
| VLAN10-USERS | Gateway FortiGate | `10.21.74.1/25` |
| PC-USER1-2174 | DHCP reservado | `10.21.74.10/25` |
| PC-USER2-2174 | DHCP reservado | `10.21.74.11/25` |
| VLAN20-JUMP | Gateway FortiGate | `10.21.75.1/29` |
| JUMP-SERVER-2174 | Windows Server | `10.21.75.2/29` |
| VLAN30-WEB | Gateway FortiGate | `10.21.75.9/29` |
| WEB-SV-2174 | Ubuntu Web Server | `10.21.75.10/29` |
| FG-2174 | port3 / administración GUI | `192.168.79.99/24` |
| VPN-REMOTE-2174 | Pool Mode Config | `10.212.135.10 - 10.212.135.20` |
| VPN-CLIENT-2174 | VIP observada al conectar | `10.212.135.10/32` |

## VLANs

| VLAN | Nombre | Red | Uso |
|---:|---|---|---|
| 10 | `users` / `VLAN10-USERS` | `10.21.74.0/25` | Dos usuarios por DHCP |
| 20 | `JUMP_SERVER` / `VLAN20-JUMP` | `10.21.75.0/29` | Jump Server |
| 30 | `WEB_SERVER` / `VLAN30-WEB` | `10.21.75.8/29` | Web Server Sistema de Caja |
| 999 | `UNUSED` | Sin direccionamiento | Native VLAN del trunk y puertos no utilizados |

## DHCP de VLAN10

- Gateway: `10.21.74.1`
- Pool: `10.21.74.10 - 10.21.74.100`
- Reserva USER1: `10.21.74.10`
- Reserva USER2: `10.21.74.11`
- DNS: `8.8.8.8`, `1.1.1.1`
