Scriptname DynamicTerminal:Logger:Component Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = DynamicTerminal:Logger:Builder.getTags()
	tags.Add("Component")
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

Bool Function logClear(DynamicTerminal:Builder:Component myComponent) Global
	return log(myComponent + " is clearing state")
EndFunction

Bool Function logSetOptions(DynamicTerminal:Builder:Component myComponent, DynamicTerminal:ListWrapper myOptions = None) Global
	return log(Jiffy:Loggout.buildMessage(myComponent + " was given options " + myOptions, None == myOptions, "", " with " + myOptions.getSize() + " choice(s)"))
EndFunction

Bool Function logSetValue(DynamicTerminal:Builder:Component myComponent, Form fValue) Global
	return log(myComponent + " was given value " + fValue)
EndFunction
