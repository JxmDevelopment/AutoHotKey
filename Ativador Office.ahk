if not A_IsAdmin
Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"

#SingleInstance Force
DetectHiddenWindows, On

Run, %comspec%,, Hide, VarPID
Sleep, 500
Clipboard := "cd /d %ProgramFiles(x86)%\Microsoft Office\Office16"
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 1000
Clipboard := "for /f %x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:..\root\Licenses16\%x"
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 5000
Clipboard := "cscript ospp.vbs /sethst:e8.us.to"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /unpkey:BTDRB >nul"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /unpkey:KHGM9 >nul"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /unpkey:CPQVG >nul"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 1000
Clipboard := "cscript ospp.vbs /sethst:e8.us.to"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /setprt:1688"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /act"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 8000
WinClose, ahk_exe cmd.exe
MsgBox,, Office Activate v1.1.37.1 - Discord: Malboro#5173, Concluido !