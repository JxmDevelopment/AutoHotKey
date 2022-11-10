#MaxThreadsPerHotkey, 2

XButton2::
Click := !Click

While Click
{
Send, {Click Down}{Click Up}
}
{Click Up}
Return

XButton1::
Space := !Space

While Space
{
Send, {Space Down}{Space Up}
}
{Space Up}
Return

MButton::
Spot := !Spot

While Spot
{
Send, {Q Down}
Sleep, 100
Send, {Q Up}
}
{Q Up}
SoundPlay, C:\AutoHotkey\Scripts\SOUND\ATIV.wav
Return

