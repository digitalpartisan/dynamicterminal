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

Bool Function logState(DynamicTerminal:PaginationProxy proxy, DynamicTerminal:Paginator paginator, String sEvent) Global
	String sMessage = proxy + " updated by paginator " + paginator + " "
	
	if ("" != sEvent)
		sMessage += "on " + sEvent + " "
	endif
	
	sMessage += "with values using pipboy: " + proxy.isUsingPipBoy()
	sMessage += ", has data: " + proxy.hasData()
	sMessage += ", show previous: " + proxy.showPrevious()
	sMessage += ", show next: " + proxy.showNext()
	sMessage += ", page items: " + proxy.getPageItems()
	
	return log(sMessage)
EndFunction
