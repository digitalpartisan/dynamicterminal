Scriptname DTT:PotionFilter extends DynamicTerminal:ListWrapper:FormList:Static

Bool Function itemPassesFilter(Int iNumber)
	return ( (getRawDataItem(iNumber) as Potion) != None )
EndFunction
