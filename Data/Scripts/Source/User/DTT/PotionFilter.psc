Scriptname DTT:PotionFilter extends DynamicTerminal:ListWrapper:FormList

Bool Function itemPassesFilter(Int iNumber)
	return ( (getRawDataItem(iNumber) as Potion) != None )
EndFunction
