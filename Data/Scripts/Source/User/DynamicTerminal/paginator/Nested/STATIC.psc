Scriptname DynamicTerminal:Paginator:Nested:Static extends DynamicTerminal:Paginator:Nested Conditional
{For nested paginators where the data being paginated is a list of non-dynamic ListWrappers}

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	return getItem(iItemID) as DynamicTerminal:ListWrapper
EndFunction
