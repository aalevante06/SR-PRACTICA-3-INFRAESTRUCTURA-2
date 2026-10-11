# Configuración del cliente VPN

Se publica una plantilla sanitizada de `ipsec.conf` para strongSwan y un ejemplo de `ipsec.secrets` sin credenciales reales.

Parámetros principales del laboratorio:

- Cliente: `21.74.4.2/30`
- Peer FortiGate: `21.74.3.2`
- IKEv1 / Aggressive Mode
- XAUTH + PSK
- Pool entregado por FortiGate: `10.212.135.10–10.212.135.20`
- Split tunnel: `JUMP-SERVER` (`10.21.75.2/32`)

Nunca suba la PSK o contraseña XAUTH real al repositorio.
