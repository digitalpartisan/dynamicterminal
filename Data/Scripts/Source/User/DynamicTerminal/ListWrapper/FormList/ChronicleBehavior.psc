Scriptname DynamicTerminal:ListWrapper:FormList:ChronicleBehavior extends chronicle:package:custombehavior

Jiffy:BackgroundProcessor:FormListCleaner Property BackgroundCleaner Auto Const Mandatory
DynamicTerminal:ListWrapper:FormList[] Property ListWrappers Auto Const
FormList Property ListOfListWrappers Auto Const

Function processListWrapper(DynamicTerminal:ListWrapper:FormList targetList)
	targetList && targetList.clean(BackgroundCleaner)
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

Bool Function installBehavior()
	BackgroundCleaner.Start()
	return true
EndFunction

Bool Function postloadBehavior()
	processListWrappers()
	processListOfListWrappers()
	return true
EndFunction

Bool Function uninstallBehavior()
	BackgroundCleaner.Stop()
	return true
EndFunction
