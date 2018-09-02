Scriptname DTT:DecreaseListSize extends DynamicTerminal:Paginator Conditional

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getData() as DTT:ShrinkingList).shrink()
EndFunction
