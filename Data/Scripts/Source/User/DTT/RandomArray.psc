Scriptname DTT:RandomArray extends dynamicterminal:listwrapper:DynamicArray

FormList Property ListsToChooseFrom = None Auto Const

Function choose()
	Int iIndex = Utility.RandomInt(0, ListsToChooseFrom.GetSize() - 1)
	setData( ( ListsToChooseFrom.GetAt(iIndex) as DTT:ArrayWrapper ).myArray )
EndFunction
