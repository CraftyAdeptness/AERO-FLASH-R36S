## Cómo funciona

AeroFlash se compone de dos partes: el motor que reproduce los `.swf` con aceleración GPU, y el launcher visual que permite elegir qué juego abrir.

### El reproductor: `sdl2test-tb`

El binario que realmente reproduce los archivos Flash es un fork de [ruffle-miyooflip](https://github.com/USUARIO/ruffle-miyooflip), escrito en Rust sobre el motor [Ruffle](https://ruffle.rs/). El objetivo era evitar el problema del reproductor oficial de Ruffle, que en este hardware cae a renderizado por software (llvmpipe) y se congela.

- **Compilación cruzada:** el binario se compila para `aarch64-unknown-linux-gnu` vía GitHub Actions, ya que compilar Rust/Ruffle localmente no era viable en el hardware disponible.
- **Renderizado directo por DRM/GBM/EGL:** en vez de pasar por X11, el binario abre `/dev/dri/card0` directamente, crea una superficie GBM real y dibuja sobre ella — esto es lo que permite usar la GPU Mali-G31 de verdad en vez de caer a software.
- **El fix clave:** el código base intentaba crear la superficie EGL pasando una ventana nativa nula (funcionaba solo en el hardware original para el que se diseñó el fork), en vez de usar la implementación DRM/GBM que ya existía en el repo pero no estaba conectada al build. Corregir esa conexión fue lo que desbloqueó la aceleración real.
- **Vinculación con el driver real:** el sistema traía únicamente stubs vacíos de EGL/GLES (los dispatchers genéricos de GLVND), sin conexión al driver real del fabricante. Fue necesario enlazar el binario directamente contra el blob de Mali (`libmali.so`) para que las llamadas gráficas realmente llegaran a la GPU.

### El launcher visual: `cascade_launcher`

Es un programa en C, compilado aparte, que actúa como el menú de selección de juegos. Usa:

- **SDL2** — ventana, input de gamepad y dibujo de la interfaz.
- **SDL_image** — carga de íconos/miniaturas para cada entrada del menú.
- **SDL_ttf** — renderizado de texto con fuentes TrueType para los nombres de los juegos.
- **`dirent.h` + `sys/stat.h`** — escaneo del directorio `roms/` en tiempo de ejecución para listar los `.swf` disponibles sin necesidad de una lista fija.

Al seleccionar un juego desde el menú, `cascade_launcher` invoca a `sdl2test-tb` con la ruta del `.swf` elegido, que se encarga de la reproducción con aceleración GPU.
