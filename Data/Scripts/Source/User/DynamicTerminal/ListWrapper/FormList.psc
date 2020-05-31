Scriptname DynamicTerminal:ListWrapper:FormList extends DynamicTerminal:ListWrapper Hidden
{The generic type of ListWrapper that works on the forms in a FormList.  See DynamicTerminal:ListWrapper.}

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

Function clean(Jiffy:BackgroundProcessor:FormListCleaner cleaner)
	cleaner.clean(getRawData())
EndFunction
