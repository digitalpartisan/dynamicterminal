Scriptname DynamicTerminal:ListWrapper:FormList extends DynamicTerminal:ListWrapper Hidden

FormList Function getRawData()
	return None
EndFunction

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	FormList rawData = getRawData()
	if (!rawData)
		return 0
	endif
	
	return rawData.getSize()
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	FormList rawData = getRawData()
	if (!rawData)
		return None
	endif
	
	return rawData.getAt(iNumber)
EndFunction
