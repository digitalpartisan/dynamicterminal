Scriptname DynamicTerminal:Paginator:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Paginator")
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return DynamicTerminal:Logger.log(sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return DynamicTerminal:Logger.warn(sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return DynamicTerminal:Logger.error(sMessage, getTags())
EndFunction

Bool Function logState(DynamicTerminal:Paginator myPaginator, String sEvent) Global
	String sMessage = myPaginator + " " + sEvent + " with values "
	sMessage += " using pipboy: " + myPaginator.isUsingPipBoy()
	sMessage += ", has data: " + myPaginator.hasData()
	sMessage += ", list size: " + myPaginator.getListSize()
	sMessage += ", show previous: " + myPaginator.showPrevious()
	sMessage += ", show next: " + myPaginator.showNext()
	sMessage += ", current page: " + myPaginator.getCurrentPage()
	sMessage += ", page offset: " + myPaginator.getPageOffset()
	sMessage += ", page items: " + myPaginator.getPageItems()
	sMessage += ", proxy: " + myPaginator.getProxy()
	
	return log(sMessage)
EndFunction

Bool Function logDataFilter(DynamicTerminal:Paginator myPaginator, String sEvent) Global
	return log(myPaginator + " refreshing filter on data set " + myPaginator.getData() + " because " + sEvent)
EndFunction

Bool Function logInitialization(DynamicTerminal:Paginator myPaginator, DynamicTerminal:ListWrapper myWrapper, DynamicTerminal:Paginator:Proxy myProxy) Global
	return log(myPaginator + " initialized with data " + myWrapper + " by proxy " + myProxy)
EndFunction
