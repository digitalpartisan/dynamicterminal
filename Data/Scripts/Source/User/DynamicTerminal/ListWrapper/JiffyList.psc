Scriptname DynamicTerminal:ListWrapper:JiffyList extends DynamicTerminal:ListWrapper

Jiffy:List Property MyList Auto Const Mandatory

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return MyList.getSize()
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return MyList.getAt(iNumber) as Form
EndFunction
