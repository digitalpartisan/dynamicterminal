Scriptname dynamicterminal:paginator:Nested:DynamicArray extends dynamicterminal:paginator:Nested Hidden Conditional

DynamicTerminal:ListWrapper:DynamicArray Property DynamicListWrapper Auto Const Mandatory

Form[] Function getArray(Int iItemID)
{Override this function to generate an array of Form records given the item ID activated in the terminal.}
	return None
EndFunction

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicListWrapper.setData(getArray(iItemID))
	return DynamicListWrapper
EndFunction
