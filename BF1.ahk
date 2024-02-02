#MaxThreadsPerHotkey 2

Delete::Reload

; --> PEGAR VEICULO - CLIQUE <--

Xbutton2::
Click := !Click
While Click
{
Send, {Click Down}{Click Up}
}
Send, {Click Up}
Return

; --> PEGAR VEICULO - SPACE <--

Xbutton1::
Space := !Space
While Space
{
Send, {Space Down}{Space Up}
}
Send, {Space Up}
Return

; --> SPOTAR <--

MButton::
Spotar := !Spotar

; Som De Alerta ON/OFF Do Spotar

If Spotar
{
SoundPlay, C:\AutoHotkey\Scripts\Sound\Ativação\Spot ON.mp3
}
Else
{
SoundPlay, C:\AutoHotkey\Scripts\Sound\Ativação\Spot OFF.mp3
}

; Loop Do Spotar

While Spotar
{
Send, {Blind}{Q Down}{Q Up}
}
Send, {Q Up} ; {Ctrl Up}{Alt Up}{Shift Up}
Return

; --> VERIFICAR SE ESTAR ATIVADO <--

; Som Verificador Se O Rapid Fire Está ON/OFF

Home::
If Ativar
{
SoundPlay, C:\AutoHotkey\Scripts\Sound\Ativação\Ligado.mp3
}
Else
{
SoundPlay, C:\AutoHotkey\Scripts\Sound\Ativação\Desligado.mp3
}
Return

; --> ATIVAR RAPID FIRE <--

Insert::
Ativar := !Ativar

; Som De Alerta ON/OFF Do Rapid Fire

If Ativar = 1
{
SoundPlay, C:\AutoHotkey\Scripts\Sound\Ativação\Ativado.mp3
}
Else
{
SoundPlay, C:\AutoHotkey\Scripts\Sound\Ativação\Desativado.mp3
}

; Ativa e Desativa o Rapid Fire

#If Ativar = 1
LButton::
{
while GetKeyState("LButton", "P")
Send, {Click}
}
Return