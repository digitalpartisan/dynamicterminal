Scriptname DynamicTerminal:ListWrapper:FormList:ChronicleBehavior extends chronicle:package:custombehavior

DynamicTerminal:ListWrapper:FormList[] Property ListWrappers Auto Const
FormList Property ListOfListWrappers Auto Const

Function processListWrapper(DynamicTerminal:ListWrapper:FormList targetList)
	if (!targetList)
		return
	endif
	
	targetList.clean()
EndFunction

Function processListWrappers()
	if (!ListWrappers || !ListWrappers.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < ListWrappers.Length)
		processListWrapper(ListWrappers[iCounter])
		iCounter += 1
	endWhile
EndFunction

Function processListOfListWrappers()
	if (!ListOfListWrappers || !ListOfListWrappers.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = ListOfListWrappers.GetSize()
	while (iCounter < iSize)
		processListWrapper(ListOfListWrappers.GetAt(iCounter) as DynamicTerminal:ListWrapper:FormList)
		iCounter += 1
	endWhile
EndFunction

Bool Function postloadBehavior()
	processListWrappers()
	processListOfListWrappers()
	return true
EndFunction
