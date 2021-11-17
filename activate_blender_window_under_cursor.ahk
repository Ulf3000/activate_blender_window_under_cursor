#Persistent
SetTimer, WatchCursor, 300
return

WatchCursor:
if WinActive("ahk_exe blender.exe") 	; should only work between blender windows, windows can handle the rest with its build in function
	If GetKeyState("alt")				; a hack to prevent windows taskswitcher from disapperaing , its kotkey is alt+tabso as long as alt is held down this script will return	
		return			
	MouseGetPos, , , WindowID 			; get window ID under mouse cursor
	WinGet, ahk_exe, ProcessName, ahk_id %WindowID% ; from window ID get the corresponding exe
	if (ahk_exe = "blender.exe")
		WinActivate, ahk_id %WindowID% ;activate window with window ID

; ToolTip, processname %ahk_exe% ; for easy debugging just use a tooltp :)
return