#Persistent

processName := "blender.exe"

SetTimer, CheckConsoleWindow, 1000
return

CheckConsoleWindow:
if WinExist("ahk_class ConsoleWindowClass")
{
    WinGet, consoleWin, ID, ahk_class ConsoleWindowClass
    WinGet, consolePID, PID, ahk_id %consoleWin%
    if (ProcessExist(processName, consolePID))
    {
        WinSet, AlwaysOnTop, On, ahk_id %consoleWin% ; Set the window to always be on top
        ; Do something else here, e.g. send a keystroke or show a message box
    }
}
return

ProcessExist(processName, pid)
{
    Process, Exist, %processName%
    if ErrorLevel && ErrorLevel = pid
        return true
    else
        return false
}
