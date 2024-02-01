#SingleInstance Force
#MaxThreadsPerHotkey 2

Delete::Reload

^1::
afk := !afk
while afk
{
Send, {Y Down}{Y Up}
Sleep, 500
SendInput, .{enter}
Sleep, 240000
}
Return

XButton2::
Joy11::
Seta := !Seta
While Seta
{
Send, {Left Down}
Sleep, 100
Send, {Left Up}
Sleep, 350
Send, {Right Down}
Sleep, 100
Send, {Right Up}
Sleep, 350
}
Sleep, 1000
Send, {Right Down}{Right Up}
Return

XButton1::
Joy12::
Pisca := !Pisca
While Pisca
{
Send, {Q Down}
Sleep, 50
Send, {Q Up}
Sleep, 100
Send, {Q Down}
Sleep, 100
Send, {Q Up}
Sleep, 800
}
Send, {Q Down}{Q Up}
Return

MButton::
Joy13::
{
Send, {J Down}
Sleep, 63
Send, {J Up}
Sleep, 297
Send, {J Down}
Sleep, 47
Send, {J Up}
Sleep, 125
Send, {J Down}
Sleep, 31
Send, {J Up}
Sleep, 109
Send, {J Down}
Sleep, 47
Send, {J Up}
Sleep, 297
Send, {J Down}
Sleep, 63
Send, {J Up}
Sleep, 625
Send, {J Down}
Sleep, 62
Send, {J Up}
Sleep, 235
Send, {J Down}
Sleep, 62
Send, {J Up}
}
Return