Scriptname DynamicTerminal:ListWrapper:FormArray:STATIC extends DynamicTerminal:ListWrapper:FormArray
{Use this ListWrapper when youmust paginate a Form[] and the Form[] in question does not change.}

Form[] Property MyData Auto Const Mandatory

Form[] Function getRawData()
	return MyData
EndFunction
