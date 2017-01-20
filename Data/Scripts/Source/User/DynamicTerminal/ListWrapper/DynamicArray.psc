Scriptname dynamicterminal:listwrapper:DynamicArray extends dynamicterminal:listwrapper
{Use this script to wrap lists of type Form[] for use in a dynamic terminal.  This script allows an array to be substituted at runtime as needed.}

Form[] myData ; This value is determined at runtime and for this reason, it is not able to be modified in the editor

Function setData(Form[] newData)
	myData = newData
EndFunction

int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return myData.Length
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return myData[iNumber]
EndFunction
