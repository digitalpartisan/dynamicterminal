Scriptname DTT:RandomFormList extends DynamicTerminal:ListWrapper:FormList:Dynamic

FormList Property ListsToChooseFrom = None Auto Const Mandatory

Function choose()
	setData(Jiffy:Utility:FormList.random(ListsToChooseFrom) as FormList)
EndFunction
