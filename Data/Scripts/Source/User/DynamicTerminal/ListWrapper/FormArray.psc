Scriptname DynamicTerminal:ListWrapper:FormArray extends DynamicTerminal:ListWrapper
{Use this script to wrap lists of type Form[] for use in a dynamic terminal.}

Form[] Function getRawData()
	return None
EndFunction

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	Form[] rawData = getRawData()
	if (!rawData)
		return 0
	endif
	
	return rawData.Length
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	Form[] rawData = getRawData()
	if (!rawData)
		return None
	endif
	
	return rawData[iNumber]
EndFunction
