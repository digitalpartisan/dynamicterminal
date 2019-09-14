Scriptname DTT:FilterMiscObject extends DynamicTerminal:ListWrapper:FormList:Static

Bool Function itemPassesFilter(Int iNumber)
	return ( (getRawDataItem(iNumber) as MiscObject) != None )
EndFunction
