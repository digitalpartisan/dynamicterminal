Scriptname DynamicTerminal:ListWrapper:FormArray extends DynamicTerminal:ListWrapper
{Use this script to wrap lists of type Form[] for use in a dynamic terminal.}

Form[] Function getRawData()
	return None
EndFunction

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return getRawData().Length
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return getRawData()[iNumber]
EndFunction
