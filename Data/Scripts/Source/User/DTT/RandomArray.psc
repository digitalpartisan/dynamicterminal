Scriptname DTT:RandomArray extends DynamicTerminal:ListWrapper:FormArray:Dynamic

FormList Property ListsToChooseFrom = None Auto Const Mandatory

Function choose()
	setData( (Jiffy:Utility:FormList.random(ListsToChooseFrom) as DTT:ArrayWrapper).myArray )
EndFunction
