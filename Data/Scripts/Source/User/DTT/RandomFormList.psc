Scriptname DTT:RandomFormList extends dynamicterminal:listwrapper:DynamicList

FormList Property ListsToChooseFrom = None Auto Const Mandatory

Function choose()
	setData(Jiffy:Utility.randomFromList(ListsToChooseFrom) as FormList)
EndFunction
