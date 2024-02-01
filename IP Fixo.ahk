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
WinKill, powershell
Run, cmd
Sleep, 500
ControlSend,, ipconfig{Enter}, ahk_exe cmd.exe
Sleep, 250
InputBox, GATE, ATENÇÃO,Insira a 3° Casa Do Gateway:,, 200, 140
WinClose, ahk_exe cmd.exe
Sleep, 250
Run, %comspec%,, Hide, VarPID
Sleep, 500
ControlSend,, netsh interface ipv4 set address name="Ethernet" static 192.168.%GATE%.200 255.255.255.0 192.168.%GATE%.1{Enter}, ahk_pid %VarPID%
Sleep, 250
ControlSend,, netsh interface IP add DNS name="Ethernet" 8.8.8.8{Enter}, ahk_pid %VarPID%
Sleep, 250
ControlSend,, netsh interface IP add DNS name="Ethernet" 8.8.4.4 index=2{Enter}, ahk_pid %VarPID%
Sleep, 250
WinClose, ahk_exe cmd.exe
MsgBox,, Aviso !, Concluido Com Sucesso !