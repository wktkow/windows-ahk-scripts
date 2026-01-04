#Requires AutoHotkey v2.0

; --- Win+Q => Alt+F4 (close window) ---
#q::Send "!{F4}"

; --- Disable Start menu on bare Win press, but keep Win as modifier ---
~LWin::Send "{Blind}{vkE8}"
~RWin::Send "{Blind}{vkE8}"

; --- Left pure Alt => Start menu (Ctrl+Esc), without breaking Alt+Tab ---
~*LAlt up::
{
    ; Only if Alt was pressed and released without any other key
    if (A_PriorKey = "LAlt")
        Send "^{Esc}"
}

; --- Win+F => open File Explorer ---
#f::Run "explorer.exe"

; --- Win+B => open Google Chrome ---
#b::Run "chrome.exe"    ; if needed, replace with full path to chrome.exe

; --- Win+Ctrl+Right => snap window to right (Win+Right) ---
^#Right::Send "#{Right}"

; --- Win+Ctrl+Left => snap window to left (Win+Left) ---
^#Left::Send "#{Left}"

; --- Win+M => maximize active window (normal maximize, not fullscreen) ---
#m::
{
    WinMaximize "A"
}

; --- Win+N => minimize active window ---
#n::
{
    WinMinimize "A"
}

; --- Win+T => open Windows Terminal (tabbed wt.exe) ---
#t::Run "wt.exe"        ; if this fails, point it to the full path of wt.exe

; --- Swap CapsLock and Esc ---
$CapsLock::Esc
$Esc::CapsLock
