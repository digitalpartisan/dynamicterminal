Scriptname DynamicTerminal:Fragments:Terminal:Pagination extends Terminal Hidden Const
{This script prevents the repetition required in making a pagination terminal in your plugin.

To use this, implement the terminal itself (likely by copying the appropriate terminal from the DynamicTerminalTesting.esp plugin and then rename the script it uses to match your needs.
Directly edit that script and have it extend one of the children of this script to suit your needs.  Compile your script.  Save and reload your plugin, making sure not to otherwise modify the terminal in question.
When the CK has reloaded your plugin, edit the terminal fragment script's properties to assign the desired paginator or pagination proxy.}

Function goBack(ObjectReference akTerminalRef)

EndFunction

Function goForward(ObjectReference akTerminalRef)

EndFunction

Function selectOption(Int iOptionNumber, ObjectReference akTerminalRef)

EndFunction

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
	goBack(akTerminalRef)
EndFunction

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
	selectOption(0, akTerminalRef)
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
	selectOption(1, akTerminalRef)
EndFunction

Function Fragment_Terminal_04(ObjectReference akTerminalRef)
	selectOption(2, akTerminalRef)
EndFunction

Function Fragment_Terminal_05(ObjectReference akTerminalRef)
	selectOption(3, akTerminalRef)
EndFunction

Function Fragment_Terminal_06(ObjectReference akTerminalRef)
	selectOption(4, akTerminalRef)
EndFunction

Function Fragment_Terminal_07(ObjectReference akTerminalRef)
	selectOption(5, akTerminalRef)
EndFunction

Function Fragment_Terminal_08(ObjectReference akTerminalRef)
	selectOption(6, akTerminalRef)
EndFunction

Function Fragment_Terminal_09(ObjectReference akTerminalRef)
	selectOption(7, akTerminalRef)
EndFunction

Function Fragment_Terminal_10(ObjectReference akTerminalRef)
	selectOption(8, akTerminalRef)
EndFunction

Function Fragment_Terminal_11(ObjectReference akTerminalRef)
	selectOption(9, akTerminalRef)
EndFunction

Function Fragment_Terminal_12(ObjectReference akTerminalRef)
	selectOption(10, akTerminalRef)
EndFunction

Function Fragment_Terminal_13(ObjectReference akTerminalRef)
	selectOption(11, akTerminalRef)
EndFunction

Function Fragment_Terminal_14(ObjectReference akTerminalRef)
	goForward(akTerminalRef)
EndFunction
