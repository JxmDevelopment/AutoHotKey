#SingleInstance Force

if not A_IsAdmin
Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"

CoordMode, ToolTip, Screen
Tooltip, CTRL + 1 -> Sintegra`nCTRL + 2 -> Relatorios`nHome -> Recarregar`nEnd -> Sair, 0, 0
Home::Reload
End::ExitApp

^1::
{
WinActivate, ahk_exe GDOOR.exe
Sleep, 1000
CoordMode, Pixel, Window
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\fis.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Loop
{
WinActivate, ahk_exe GFiscal.exe
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\sint.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 800
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\a.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\b.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\c.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\d.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\e.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\f.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\g.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\nor.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\h.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\i.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\j.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\k.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\ok.png
}
Until, !ErrorLevel
WinClose, ahk_exe GFiscal.exe
Sleep, 500
WinClose, ahk_exe GFiscal.exe
}
Return

^2::
{
WinActivate, ahk_exe GDOOR.exe
Sleep, 1000
InputBox, MES, OBS: 01 a 12, Insira o Mês:, , 180, 150
if ErrorLevel
{
    MsgBox,, AVISO:, Você Cancelou !
    ExitApp
    Return
}
Sleep, 500
InputBox, DIA, OBS: 01 a 31, Insira o Última Dia:, , 180, 150
if ErrorLevel
{
    MsgBox,, AVISO:, Você Cancelou !
    ExitApp
    Return
}
Sleep, 500
InputBox, NOME, v.1.1 - By: Jardel, Nome Da Pasta:, , 180, 150
if ErrorLevel
{
    MsgBox,, AVISO:, Você Cancelou !
    ExitApp
    Return
}
Else
Sleep, 250
IfNotExist, %A_Desktop%\Sintegra\2023
Sleep, 250
FileCreateDir, %A_Desktop%\Sintegra\2023
Sleep, 250
IfNotExist, %A_Desktop%\Sintegra\2023\%NOME%
Sleep, 250
FileCreateDir, %A_Desktop%\Sintegra\2023\%NOME%
Sleep, 250
CoordMode, Pixel, Window
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\rel.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Loop
{
WinActivate, ahk_exe Relatorios.exe
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500

; -> TOTAIS

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\tot.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
Send, {Right}
Sleep, 500
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 5}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\1.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 1500
SendInput, Totais
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
}

; -> RESUMO

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\res.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 6}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\2.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 500
SendInput, Resumo
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
}

; -> CFOP e Modelo

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Send, {Up}
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\cf.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 6}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Send, {Tab 2}{Down}
Sleep, 1000
Send, {Tab 2}{Space}
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\3.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 500
SendInput, CFOP e Modelo
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
}

; -> CANCELADOS <-

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Send, {Enter}
Sleep, 1000
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 7}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Send, {Tab 3}{Down}
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\4.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 500
SendInput, Cancelados
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
WinClose, ahk_exe Relatorios.exe
Sleep, 500
}
}
ExitApp
Return