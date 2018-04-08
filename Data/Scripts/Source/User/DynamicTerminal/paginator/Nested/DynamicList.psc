Scriptname DynamicTerminal:Paginator:Nested:DynamicList extends DynamicTerminal:Paginator:Nested Conditional

DynamicTerminal:ListWrapper:DynamicList Property DynamicListWrapper Auto Const Mandatory

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicListWrapper.setData(getItem(iItemID) as FormList)
	return DynamicListWrapper
EndFunction
