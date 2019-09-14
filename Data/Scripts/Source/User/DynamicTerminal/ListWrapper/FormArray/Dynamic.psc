Scriptname DynamicTerminal:ListWrapper:FormArray:Dynamic extends DynamicTerminal:ListWrapper:FormArray

Form[] myData = None

Form[] Function getRawData()
	return myData
EndFunction

Function setData(Form[] newValue)
	myData = newValue
EndFunction
