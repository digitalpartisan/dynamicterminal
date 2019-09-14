Scriptname DynamicTerminal:ListWrapper:FormList:Dynamic extends DynamicTerminal:ListWrapper:FormList

FormList myData = None ; This value is determined at runtime and for this reason, it is not able to be modified in the editor

Function setData(FormList newData)
	myData = newData
EndFunction

FormList Function getRawData()
	return myData
EndFunction
