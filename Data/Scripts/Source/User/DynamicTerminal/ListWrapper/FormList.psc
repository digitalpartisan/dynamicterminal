Scriptname DynamicTerminal:Listwrapper:FormList extends DynamicTerminal:ListWrapper:FormList:Abstract Hidden

FormList Function getRawData()
	return None
EndFunction

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return getRawData().getSize()
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return getRawData().getAt(iNumber)
EndFunction
