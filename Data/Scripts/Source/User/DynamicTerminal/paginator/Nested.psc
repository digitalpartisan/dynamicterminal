Scriptname DynamicTerminal:Paginator:Nested extends DynamicTerminal:Paginator Conditional

DynamicTerminal:Paginator Property NextPaginator Auto Const Mandatory

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	return getItem(iItemID) as DynamicTerminal:ListWrapper
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	NextPaginator.init(akTerminalRef, getListWrapper(iItem))
EndFunction
