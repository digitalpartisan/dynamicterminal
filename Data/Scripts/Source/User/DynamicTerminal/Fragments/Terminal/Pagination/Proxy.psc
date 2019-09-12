Scriptname DynamicTerminal:Fragments:Terminal:Pagination:Proxy extends DynamicTerminal:Fragments:Terminal:Pagination Hidden Const

DynamicTerminal:PaginationProxy Property Proxy Auto Const Mandatory

Function goBack(ObjectReference akTerminalRef)
	Proxy.back(akTerminalRef)
EndFunction

Function goForward(ObjectReference akTerminalRef)
	Proxy.forward(akTerminalRef)
EndFunction

Function selectOption(Int iOptionNumber, ObjectReference akTerminalRef)
	Proxy.activate(iOptionNumber, akTerminalRef)
EndFunction
