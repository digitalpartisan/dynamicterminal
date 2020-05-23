Scriptname DynamicTerminal:Builder:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Builder")
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

Bool Function logClear(DynamicTerminal:Builder:Menu myMenu) Global
	return log(myMenu + " is clearing state")
EndFunction

Bool Function logNoBuildLogic(DynamicTerminal:Builder:Menu myMenu) Global
	return warn(myMenu + " has not implemented any build logic")
EndFunction

Bool Function logBuild(DynamicTerminal:Builder:Menu myMenu) Global
	return log(myMenu + " is building")
EndFunction
