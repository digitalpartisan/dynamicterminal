Scriptname DynamicTerminal:Listwrapper:FormList extends DynamicTerminal:ListWrapper
{Use this script to wrap lists of type FormList for use in a dynamic terminal.}

FormList Property myData Auto Const
{As this value cannot be programatically defined, it must be attached in the editor.}

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return myData.getSize()
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return myData.getAt(iNumber)
EndFunction
