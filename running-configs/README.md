# Running-configs

Archivos finales utilizados en la entrega.

- `ISP-2174.txt`: running-config final del ISP.
- `SW-INFRA2-2174.txt`: running-config final del switch.
- `FortiGate-2174-relevant.conf`: extracto depurado con la configuración relevante de la práctica.
- `FortiGate-2174-SANITIZED.conf`: backup completo sanitizado.

## Seguridad

El backup original de FortiGate contenía valores cifrados, contraseñas, PSK y llaves privadas. En la copia pública esos valores se reemplazaron por `<REDACTED>` y los bloques de llaves privadas fueron eliminados.

## Nota ISP

La descripción heredada `WAN-HACIA-R-CISCO-2174` permanece en `Fa1/1`; la interfaz física se reutiliza en esta infraestructura para el enlace `21.74.4.0/30` hacia `VPN-CLIENT-2174`.
