Scriptname DTT:RandomArray extends dynamicterminal:listwrapper:DynamicArray

FormList Property ListsToChooseFrom = None Auto Const Mandatory

Function choose()
	setData( (Jiffy:Utility.randomFromList(ListsToChooseFrom) as DTT:ArrayWrapper).myArray )
EndFunction
