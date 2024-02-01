#SingleInstance Force

SetWorkingDir %A_ScriptDir%
if not A_IsAdmin
{
Run *RunAs "%A_ScriptFullPath%"
}

DetectHiddenWindows, On

Run, powershell,, Hide, TempID
Sleep, 500
ControlSendRaw,, Get-NetAdapter | Where-Object { $_.HardwareInterface -eq $True -and $_.MediaType -eq "802.3" } | Rename-NetAdapter -NewName "Ethernet", ahk_pid %TempID%
Sleep, 250
ControlSend,, {Enter}, ahk_pid %TempID%
Sleep, 500
;WinKill, powershell
Run, %comspec%,, Hide, VarPID
Sleep, 500
ControlSend,, netsh interface ip set address "Ethernet" dhcp{Enter}, ahk_pid %VarPID%
Sleep, 500
ControlSendRaw,, wmic nicconfig where (IPEnabled=TRUE) call SetDNSServerSearchOrder (), ahk_pid %VarPID%
Sleep, 250
ControlSend,, {Enter}, ahk_pid %VarPID%
Sleep, 500
WinClose, ahk_exe cmd.exe
Sleep, 250
MsgBox,, Aviso !, Concluido Com Sucesso !