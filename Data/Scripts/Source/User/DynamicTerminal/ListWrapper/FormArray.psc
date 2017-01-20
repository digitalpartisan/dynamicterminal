Scriptname DynamicTerminal:ListWrapper:FormArray extends DynamicTerminal:ListWrapper
{Use this script to wrap lists of type Form[] for use in a dynamic terminal.}

Form[] Property myData Auto Const
{As this value cannot be programatically defined, it must be attached in the editor.}

int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return myData.Length
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return myData[iNumber]
EndFunction
