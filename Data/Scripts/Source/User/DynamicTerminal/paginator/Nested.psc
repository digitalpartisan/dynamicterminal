Scriptname DynamicTerminal:Paginator:Nested extends DynamicTerminal:Paginator Hidden Conditional
{The activation logic of this paginator is to use the selected item in the current paginator to prime the dataset of the next paginator and then initiate pagination.
Note that if you are nesting pagination terminals, it is almost certainly required to use different token prefixes or else risk pagination-to-pagination replacement bleed-over effects while going up or down the terminal chain.}

DynamicTerminal:Paginator Property NextPaginator Auto Const Mandatory

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
{Override this function in child scripts to decide what data set populates the next paginator.}
	return None
EndFunction

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	NextPaginator.init(akTerminalRef, getListWrapper(iItem))
EndFunction
