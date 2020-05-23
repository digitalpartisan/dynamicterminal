Scriptname DynamicTerminal:ListWrapper:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("ListWrapper")
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

Bool Function logPassthroughFilter(DynamicTerminal:ListWrapper myWrapper) Global
	return warn(myWrapper + " is using the default filter (passthrough)") ; if it's a passthrough filter, why is it being filtered at all?
EndFunction

Bool Function logFilterResult(DynamicTerminal:ListWrapper myWrapper, Int iStartSize, Int iEndSize) Global
	return log(myWrapper + " filtered list from size " + iStartSize + " to " + iEndSize)
EndFunction

Bool Function logUnfilter(DynamicTerminal:ListWrapper myWrapper) Global
	return log(myWrapper + " has been unfiltered")
EndFunction
