# windows AHK rebind script

#### Purpouse of this is to offer a non retarded keyboard binds experience on windows that does not make me want to blow my head clean off.

## Table Of Shortcuts:

| Shortcut | Action | Notes |
|---|---|---|
| `Win+Q` | Close active window | Sends `Alt+F4` |
| `Win (tap)` | No action | Suppresses Start menu on bare Win press (Win still works as a modifier) |
| `LAlt (tap)` | Open Start menu | Sends `Ctrl+Esc` (doesn't break `Alt+Tab`) |
| `Win+F` | Open File Explorer | Activates the newly opened window |
| `Win+B` | Open Google Chrome | Activates the newly opened window |
| `Win+Ctrl+Left` | Snap active window left | Sends `Win+Left` |
| `Win+Ctrl+Right` | Snap active window right | Sends `Win+Right` |
| `Win+M` | Maximize active window | Normal maximize (not fullscreen) |
| `Win+N` | Minimize active window |  |
| `Win+T` | Open Windows Terminal | Runs `wt.exe` |
| `LAlt+V` | Open Clipboard history | Sends `Win+V` |
| `Win+V` | No action | Disabled (use `LAlt+V` instead) |
| `PrtSc` | Screenshot tool | Sends `Win+Shift+S` |
| `CapsLock` | Escape | Swapped |
| `Esc` | Caps Lock | Swapped |


## Startup

To enable this script on startup place it or a shortcut to it in:
``` %AppData%\Microsoft\Windows\Start Menu\Programs\Startup ```

## Other Windows 10 tweaks

I also use other Windows Tweaks to make it less retarded outlined in Tweaks.md.
