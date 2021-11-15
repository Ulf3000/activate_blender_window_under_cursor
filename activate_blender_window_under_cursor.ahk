#Persistent
SetTimer, WatchCursor, 300
return

WatchCursor:
MouseGetPos, , , Window

if !WinActive("ahk_id" Window)
	WinGet, ahk_exe, ProcessName, ahk_id %Window%
	if (ahk_exe = "blender.exe")
		WinActivate, ahk_id %Window%

; ToolTip, processname %ahk_exe%
return