Scriptname DynamicTerminal:Paginator:Nested extends DynamicTerminal:Paginator Hidden Conditional

DynamicTerminal:Paginator Property NextPaginator Auto Const Mandatory

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
{Override this function in child scripts to decide what data set populates the next paginator.}
	return None
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	NextPaginator.init(akTerminalRef, getListWrapper(iItem))
EndFunction
