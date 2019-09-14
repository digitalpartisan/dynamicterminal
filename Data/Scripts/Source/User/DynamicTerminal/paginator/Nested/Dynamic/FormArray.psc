Scriptname DynamicTerminal:paginator:Nested:Dynamic:FormArray extends DynamicTerminal:paginator:Nested:Dynamic Hidden Conditional
{For paginators iterating over form records that can produce an arrya of forms to populate the next paginator.
Because Form[] data types are not Form types, the user of this script must provide their own Form -> Form[] conversion mechanism.}

DynamicTerminal:ListWrapper:FormArray:Dynamic Property DynamicFormArrayWrapper Auto Const Mandatory

Form[] Function getArray(Int iItemID)
{Override this function to generate an array of Form records given the item ID activated in the terminal.}
	return None
EndFunction

DynamicTerminal:ListWrapper Function getListWrapper(Int iItemID)
	DynamicFormArrayWrapper.setData(getArray(iItemID))
	return DynamicFormArrayWrapper
EndFunction
