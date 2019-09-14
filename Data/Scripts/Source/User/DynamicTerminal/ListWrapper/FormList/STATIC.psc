Scriptname DynamicTerminal:ListWrapper:FormList:Static extends DynamicTerminal:ListWrapper:FormList

FormList Property MyData Auto Const Mandatory
{As this value cannot be programatically defined, it must be attached in the editor.}

FormList Function getRawData()
	return MyData
EndFunction
