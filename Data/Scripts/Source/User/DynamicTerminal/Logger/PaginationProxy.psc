Scriptname DynamicTerminal:Logger:PaginationProxy Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Proxy")
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(DynamicTerminal:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(DynamicTerminal:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(DynamicTerminal:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function logState(DynamicTerminal:PaginationProxy myProxy, String sEvent) Global
	String sMessage = myProxy + " " + sEvent + " with values "
	sMessage += " using pipboy: " + myProxy.isUsingPipBoy()
	sMessage += ", has data: " + myProxy.hasData()
	sMessage += ", show previous: " + myProxy.showPrevious()
	sMessage += ", show next: " + myProxy.showNext()
	sMessage += ", page items: " + myProxy.getPageItems()
	
	return log(sMessage)
EndFunction
