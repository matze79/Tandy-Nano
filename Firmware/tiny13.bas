'ATtiny13 lm386 control
$regfile = "attiny13.dat"
$crystal = 1200000
$hwstack = 8
$swstack = 4
$framesize = 4
Config Portb.4 = Output
'Config Portb.3 = Output
Mute Alias Portb.4
Config Pinb.2 = Input
Config Pinb.0 = Input
Portb.3 = 1
Portb.2 = 1
Isareset Alias Pinb.0
Impuls Alias Pinb.2

Dim Poweron As Integer
Reboot:
Poweron = 0
Mute = 1

Waitms 10000
'Survive BIOS boot if the card is listening on 0C0h; otherwise the BIOS scan would enable the LM386/74HC125 gate.

Do
If Isareset = 1 Then Goto Reboot
If Impuls = 0 Then Poweron = 1
If Poweron = 1 Then Mute = 0 Else Mute = 1
Loop

End