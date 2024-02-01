DetectHiddenWindows, On
SetTitleMatchMode 2
#MaxThreadsPerHotkey 2

XButton1::
ControlSend,, {rshift}, ahk_exe ArkAscended.exe
x := !x
while x
{
ControlSend,, {w down}, ahk_exe ArkAscended.exe
}
Sleep, 500
ControlSend,, {w up}, ahk_exe ArkAscended.exe
Return

XButton2::
{
Send, {shift down}{w down}     ; IRA SEGURAR O SHIFT + W, CONSEGUE DESATIVAR DANDO UM CLIQUE NO SHIFT
}
Return
