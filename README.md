# AeroFlash

![AeroFlash en R36S](screenshot.png)

A Flash (.swf) player for the R36S with real GPU acceleration (Mali-G31 via DRM/GBM/EGL), built on Ruffle and adapted from the ruffle-miyooflip port. Avoids the freezing caused by software rendering fallback that the official Ruffle player runs into on this hardware.
This application has only been tested on the dArkOS R36S system. Any variations would need to be within the RK3326 SoC platform or ARM Linux 4.19 kernel.

# The "EXIT" action inside .swf its very buggy, needs to press "RESET" button to restart AeroFlash or play another swf.

## Installation

1. Download the [ZIP](https://github.com/CraftyAdeptness/AERO-FLASH-R36S/releases) from the latest Release.
2. Extract the contents into `/roms/ports/` on your SD card (EASYROMS partition or other custom dir with chmod permition ).
3. Restart EmulationStation optional.
4. AeroFlash will show up under the "Ports" section.
5. AeroFlash includes its own file manager. You only need to place the .swf files along with their corresponding assets/.xml/contents that make them work in the `/roms` folder which is automatically generated on first launch.

Example of place .swf:
```
ports/
├── AEROFLASH.sh
└── AEROFLASH/
    ├── cascade_launcher
    ├── sdl2test-tb
    ├── libgetGlFunc.so
    ├── assets/
    └── roms/
        └──robo-rampage
           ├──A-roborampage_original.swf <-- "This the game who need press "A" or "X" to edit his "keymap"
           ├──assets
           ├──robo-rampage__meta.xml
           └──etc files...
```

## Controls

| Button | Action |
|-------|--------|
| A | Confirm |
| B | Back out of menu/submenu |
| X | Edit keymap for the selected .swf  |
| Y | Enters the submenu  |
| L/R | switches the submenu between Play, Edit Controls, Performance and About ||

## Submenus
| submenu | translate | color |
|-------|--------|--------|
| Jugar SWF | Play SWF | green |
| Editar control | Controls Edit | yellow |
| Rendimiento | Performance | purple |
| Acerca de | About | pink |

- **jugar swf**: This section launches the .swf files.
- **Editar Control**: This section lets you edit the controls by binding the R36S’s built-in buttons in specific swf.
- **Rendimiento**: This section lets you switch between “Low”, “Medium” and "default" to improve .swf performance and mute the audio.

## Controls in game/swf
| Button | Action |
|-------|--------|
| D-pad | move cursor |
| Y | Left mouse click |
| select + X | switch R36S controls/mouse mode |
| Select + A | EXIT to AeroFlash, very buggy need reset button sorry :( || 

> [!NOTE]
> ## Known Issues
> - The "EXIT" action inside .swf its very buggy, needs to press "RESET" button to restart AeroFlash or play another swf
>- This issue is caused by the delegation/grappler of the screen currently in use by the GPU. I have the "Python alpha version" but it uses the CPU as the video backend and runs very slowly and tends to freeze. For now, you need to press "RESET" to correct exit.

> [!IMPORTANT]
> This is an early/experimental build. Some SWFs tend to fail for various reasons. They may require extra files from online addresses that no longer exist, or specific routines that used to work in web browsers back the time. Sometimes they simply fail and freeze because there may be instructions that are currently incompatible with ARM systems.

## Credits

- [Ruffle](https://github.com/ruffle-rs/ruffle) — Flash engine
- [ruffle-miyooflip](https://github.com/aweigit/ruffle-miyooflip) — DRM/GBM/EGL rendering base adapted for this port
