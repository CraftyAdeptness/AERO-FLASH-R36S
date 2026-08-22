#!/bin/bash
# --- Lanzador del entorno de usuario Cascade y gestor swf AERO FLASH por CraftyAdeptness---

# 1. Redireccion al directorio de datos de la app
cd "$(dirname "$0")/AEROFLASH"

echo "=== INICIANDO CASCADE LAUNCHER: $(date) ==="

# 3. Variables de entorno indispensables para RK3326 en R36S
export SDL_VIDEODRIVER=kmsdrm
export SDL_AUDIODRIVER=alsa
export EGL_PLATFORM=kms
export SDL_VIDEO_GL_DRIVER=/usr/lib/aarch64-linux-gnu/libGLESv2.so

# 4. Detener/Pausar consolas secundarias si interfieren con KMS
sudo chmod 666 /dev/dri/card0 /dev/mali0 /dev/fb0 2>/dev/null

setterm -cursor off 2>/dev/null
# Se despide emulation station, bienvenido al frutigger aero!
# --- REPRODUCCIÓN DEL SPLASH SCREEN ---
if [ -f "./assets/splash.mp4" ]; then
    echo "[SPLASH] Reproduciendo video de bienvenida..."
    ffplay -autoexit -noborder -fs -loglevel quiet -vf "scale=640:480" ./assets/splash.mp4 2>/dev/null
    clear > /dev/tty1 2>/dev/null
fi

# 5. Ejecutar el binario forzando buffer de linea en stdout
stdbuf -oL -eL ./cascade_launcher

setterm -cursor on 2>/dev/null
echo "=== FIN DE EJECUCIÓN ==="
