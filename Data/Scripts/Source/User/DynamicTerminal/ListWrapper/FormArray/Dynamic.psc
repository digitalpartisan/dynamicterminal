Scriptname DynamicTerminal:ListWrapper:FormArray:Dynamic extends DynamicTerminal:ListWrapper:FormArray
{Use this script when you have a Form[] to paginate but the specific array needs to change from one pagination to another.}

Form[] myData = None

Form[] Function getRawData()
	return myData
EndFunction

Function setData(Form[] newValue)
	myData = newValue
EndFunction
