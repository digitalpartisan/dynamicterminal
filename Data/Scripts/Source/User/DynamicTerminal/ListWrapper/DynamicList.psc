Scriptname DynamicTerminal:ListWrapper:DynamicList extends DynamicTerminal:ListWrapper
{Use this script to wrap FormList records for use in a dynamic terminal.  This script allows a FormList to be substituted at runtime as needed.}

FormList myData = None ; This value is determined at runtime and for this reason, it is not able to be modified in the editor

Function setData(FormList newData)
	myData = newData
EndFunction

int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return myData.GetSize()
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return myData.GetAt(iNumber)
EndFunction
