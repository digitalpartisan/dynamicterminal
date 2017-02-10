Scriptname dynamicterminal:logger:Builder Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Builder")
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

Bool Function logClear(DynamicTerminal:Builder:Menu myMenu) Global
	return log(myMenu + " is clearing state")
EndFunction

Bool Function logNoBuildLogic(DynamicTerminal:Builder:Menu myMenu) Global
	return warn(myMenu + " has not implemented any build logic")
EndFunction

Bool Function logBuild(DynamicTerminal:Builder:Menu myMenu) Global
	return log(myMenu + " is building")
EndFunction
