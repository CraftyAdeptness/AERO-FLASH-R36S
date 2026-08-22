# AeroFlash

![AeroFlash en R36S](screenshot.png)

Reproductor de Flash (.swf) para el R36S con aceleración GPU real (Mali-G31 vía DRM/GBM/EGL), basado en [Ruffle](https://ruffle.rs/) y adaptado del port [ruffle-miyooflip](https://github.com/USUARIO/ruffle-miyooflip). Evita el freeze del renderizado por software que sufre el reproductor de Ruffle oficial en este hardware.

## Instalación

1. Descarga el `.zip` de la [última Release](https://github.com/CraftyAdeptness/AERO-FLASH-R36S/releases/latest).
2. Extrae el contenido dentro de `/roms/ports/` en tu tarjeta SD (o EASYROMS).
3. Reinicia EmulationStation.
4. AeroFlash aparecerá en la sección **Ports**.

## Controles

| Botón | Acción |
|-------|--------|
| A | Confirmar |
| B | Salir del menú |
| Select + B | Salir de AeroFlash |

## Créditos

- [Ruffle](https://github.com/ruffle-rs/ruffle) — motor de reproducción de Flash
- [ruffle-miyooflip](https://github.com/USUARIO/ruffle-miyooflip) — base del renderizado DRM/GBM/EGL adaptada para este port
