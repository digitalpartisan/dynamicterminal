Scriptname DTT:ShrinkingList extends DynamicTerminal:ListWrapper:FormList

Int iDecreaseBy = 0

Function shrink()
	iDecreaseBy += 1
EndFunction

Function unfilter()
	parent.unfilter()
	iDecreaseBy = 0
EndFunction

Bool Function itemPassesFilter(Int iNumber)
	return ( (getRawDataSize() - iDecreaseBy) > iNumber ) ; whether or not the item's index is larger than the decrease will allow
EndFunction
