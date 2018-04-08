Scriptname DynamicTerminal:Paginator:Nested extends DynamicTerminal:Paginator Conditional

DynamicTerminal:Paginator Property NextPaginator Auto Const Mandatory

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	NextPaginator.init(akTerminalRef, getItem(iItem) as DynamicTerminal:ListWrapper)
EndFunction
