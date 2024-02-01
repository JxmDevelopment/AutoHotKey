if not A_IsAdmin
Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"

#SingleInstance Force

CoordMode, ToolTip, Screen
Tooltip, CTRL + 1 = Desinstalar Impressora [ Padrão ]`nCTRL + 2 = Desinstalar Impressora [ Avançada ]`nCTRL + 3 = Desinstalar Todas Impressoras [ Completa ]`nHome = Recarregar`nEnd = Sair, 0, 0

Home::Reload
End::ExitApp

;--> Desinstalar Impressora <--

^1::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
SendInput, wmic printer get name {Enter}
Sleep, 1000
SendInput, printui.exe /dl /n ""
}
Return

;--> Desinstalação Completa De Determinada Impressora <--

^2::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
; -> REGISTROS <-
SendInput, REG DELETE "HKCU\Printers\ConvertUserDevModesCount" /va /f {Enter}
Sleep, 1000
; -> DRIVERS <-
SendInput, REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3" /va /f {Enter}
Sleep, 1000
; -> VERIFICAR NOME DA IMPRESSORA <-
SendInput, wmic printer get name {Enter}
Sleep, 1000
; -> REMOVER IMPRESSORA <-
SendInput, printui.exe /dl /n ""
}
Return

;--> Desinstalação Completa De Todas As Impressoras <--

^3::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
; -> DRIVERS <-
SendInput, REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3" /f {Enter}
Sleep, 1000
; -> REGISTROS <-
SendInput, REG DELETE "HKCU\Printers\ConvertUserDevModesCount" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKCU\Printers\Settings" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKLM\SYSTEM\ControlSet001\Control\Print\Environments\Windows x64\Drivers\Version-3" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\.DEFAULT\Printers\ConvertUserDevModesCount" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\.DEFAULT\Printers\DevModePerUser" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-19\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Devices" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-19\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PrinterPorts" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Devices" /f {Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PrinterPorts" /f {Enter}
Sleep, 1000
; -> VERIFICAR NOME DA IMPRESSORA <-
SendInput, wmic printer get name {Enter}
Sleep, 1000
; -> REMOVER IMPRESSORA <-
SendInput, printui.exe /dl /n ""
}
Return