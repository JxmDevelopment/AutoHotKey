#SingleInstance Force

If not A_IsAdmin
{
Run *RunAs "%A_ScriptFullPath%"
ExitApp
}
Return

^Home::
{
Run, netsh advfirewall firewall add rule name="AHK Firewall" protocol=any dir=in enable=no action=block profile=any,, hide
Run, netsh advfirewall firewall add rule name="AHK Firewall" protocol=any dir=out enable=no action=block profile=any,, hide
sleep, 500
MsgBox, REGRAS CRIADAS
}
Return

^Del::
{
Run, netsh advfirewall firewall delete rule name="AHK Firewall",, hide
Run, netsh advfirewall firewall delete rule name="AHK Firewall",, hide
sleep, 500
MsgBox, REGRAS DELETADAS
}
Return

MButton::
Net := !Net
If Net
{
Run, netsh advfirewall firewall set rule name="AHK Firewall" new enable="yes",, hide
Tooltip, ON, 1, 1
}
else
{
Run, netsh advfirewall firewall set rule name="AHK Firewall" new enable="no",, hide
Tooltip, OFF, 1, 1
Sleep, 1000
ToolTip
}
Return