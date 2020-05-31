Scriptname DynamicTerminal:ListWrapper:FormList:Static extends DynamicTerminal:ListWrapper:FormList
{Use this script to paginate over the same FormList every time the List Wrapper is used.}

FormList Property MyData Auto Const Mandatory
{As this value cannot be programatically defined, it must be attached in the editor.}

FormList Function getRawData()
	return MyData
EndFunction
