Scriptname DynamicTerminal:Fragments:Terminal:Pagination:Paginator extends DynamicTerminal:Fragments:Terminal:Pagination Hidden Const

DynamicTerminal:Paginator Property Paginator Auto Const

Function goBack(ObjectReference akTerminalRef)
	Paginator.back(akTerminalRef)
EndFunction

Function goForward(ObjectReference akTerminalRef)
	Paginator.forward(akTerminalRef)
EndFunction

Function selectOption(Int iOptionNumber, ObjectReference akTerminalRef)
	Paginator.activate(iOptionNumber, akTerminalRef)
EndFunction
