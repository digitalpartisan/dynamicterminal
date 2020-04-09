Scriptname DynamicTerminal:ListWrapper:FormList:ChronicleBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as DynamicTerminal:ListWrapper:FormList:ChronicleBehavior)
EndFunction

DynamicTerminal:ListWrapper:FormList:ChronicleBehavior[] Function searchListWrappers(Chronicle:Package targetPackage)
	return search(targetPackage) as DynamicTerminal:ListWrapper:FormList:ChronicleBehavior[]
EndFunction

DynamicTerminal:ListWrapper:FormList:ChronicleBehavior Function searchOneListWrapper(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as DynamicTerminal:ListWrapper:FormList:ChronicleBehavior
EndFunction
