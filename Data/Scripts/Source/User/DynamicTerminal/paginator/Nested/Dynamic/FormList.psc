Scriptname DynamicTerminal:Paginator:Nested:Dynamic:FormList extends DynamicTerminal:paginator:Nested:Dynamic Conditional
{For paginators working on a list of FormList records which are used to populate the nested paginator.}

DynamicTerminal:ListWrapper:FormList:Dynamic Property DynamicFormListWrapper Auto Const Mandatory

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicFormListWrapper.setData(getItem(iItemID) as FormList)
	return DynamicFormListWrapper
EndFunction
