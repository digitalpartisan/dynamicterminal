Scriptname DTT:RandomFormList extends dynamicterminal:listwrapper:DynamicList

FormList Property ListsToChooseFrom = None Auto Const Mandatory

Function choose()
	Int iIndex = Utility.RandomInt(0, ListsToChooseFrom.GetSize() - 1)
	setData(ListsToChooseFrom.GetAt(iIndex) as FormList)
EndFunction
