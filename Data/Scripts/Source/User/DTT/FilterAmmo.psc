Scriptname DTT:FilterAmmo extends DynamicTerminal:ListWrapper:FormList:Static

Bool Function itemPassesFilter(Int iNumber)
	return ( (getRawDataItem(iNumber) as Ammo) != None )
EndFunction
